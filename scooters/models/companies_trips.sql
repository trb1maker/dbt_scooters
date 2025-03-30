with company_trips as (
    select
        s.company,
        count(*) as trips
    from {{ ref('trips_prep') }} as t
    inner join {{ ref('scooters') }} as s
        on t.scooter_hw_id = s.hardware_id
    group by 1
)

select
    t.company,
    t.trips,
    c.scooters,
    trips / cast(scooters as real) as trips_per_scooter
from company_trips as t
inner join scooters.companies as c
    on t.company = c.company
