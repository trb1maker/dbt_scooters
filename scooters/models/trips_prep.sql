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
    distance / 1000 distance_m,
    (price / 100)::numeric(20, 2) price_rub,
    extract(epoch from finished_at - started_at) duration_s,
    price = 0 and finished_at != started_at is_free,
    {{ date_in_moscow('started_at') }}           date
from {{ source('scooters_raw', 'trips') }}
