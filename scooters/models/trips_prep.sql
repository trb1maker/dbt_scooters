select
    id,
    user_id,
    scooter_hw_id,
    started_at,
    finished_at,
    start_lat,
    start_lon,
    finish_lat,
    finish_lon,
    (price / 100)::numeric(20, 2) as price_rub,
    distance / 1000 as distance_m,
    extract(epoch from finished_at - started_at) as duration_s,
    price = 0 and finished_at != started_at as is_free,
    {{ date_in_moscow('started_at') }}           as date
from {{ source('scooters_raw', 'trips') }}
