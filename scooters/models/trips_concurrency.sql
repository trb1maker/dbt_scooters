with
unnest_cte as (
    select
        unnest(array[started_at, finished_at]) "timestamp",
        unnest(array[1, -1])                   increment
    from {{ source('scooters_raw', 'trips') }}
),
sum_cte as (
    select
        "timestamp",
        sum(increment) increment,
        true           preserve_row
    from unnest_cte
    where
    {% if is_incremental() %}
        "timestamp" > (select max("timestamp") from {{ this }})
    {% else %}
        "timestamp" < (date '2023-06-01' + interval '7' hour) at time zone 'Europe/Moscow'
    {% endif %}
    group by 1
    {% if is_incremental() %}
    union all
    select
        "timestamp",
        concurrency increment,
        false       preserve_row
    from {{ this }}
    where "timestamp" = (select max("timestamp") from {{ this }})
    {% endif %}
),
cumsum_cte as (
    select
        "timestamp",
        sum(increment) over (order by "timestamp") concurrency,
        preserve_row
    from sum_cte
)
select
    "timestamp",
    concurrency,
    {{ updated_at() }}
from cumsum_cte
where preserve_row
order by 1