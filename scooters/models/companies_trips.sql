with company_trips as (
    select
        s.company,
        count(*) trips
    from {{ ref('trips_prep') }} t
    join {{ ref('scooters') }} s
        on t.scooter_hw_id = s.hardware_id
    group by 1
)

select
    t.company,
    t.trips,
    c.scooters,
    trips / cast(scooters as real) trips_per_scooter
from company_trips t
join scooters.companies c
    on t.company = c.company
