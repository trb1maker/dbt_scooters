select
    date, age,
    count(*)       trips,
    sum(price_rub) revenue_rub
from {{ ref("trips_users") }}
group by 1, 2