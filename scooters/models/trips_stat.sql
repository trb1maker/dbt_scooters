select
    count(id) trips,
    count(distinct user_id) users,
    avg(duration_s) / 60 avg_duration_m,
    sum(distance_m) / 1000 distance_km,
    sum(price_rub) revenue_rub,
    count(is_free or null) / cast(count(*) as real) * 100 free_trips_pct
from {{ ref('trips_prep') }}
