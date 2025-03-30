with montly_trips_stats as (
    /*
     * Для каждого пользователя находим месячную статистику поездок:
     * trips_per_month - количество поездок в месяц
     */
    select
        user_id,
        date_trunc('month', date) "month",
        count(*) trips_per_month
    from {{ ref('trips_prep') }}
    group by 1, 2
)

select
    user_id,
    sum(trips_per_month) <= 2 as rare
from montly_trips_stats
group by 1
