select
    user_id,
    date(date_trunc('month', "date")) "month",
    sum(price_rub)                    revenue_total
from {{ ref('trips_users') }}
where not is_free
group by 1, 2