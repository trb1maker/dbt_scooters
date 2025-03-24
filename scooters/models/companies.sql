select
    company,
    count(model)  models,
    sum(scooters) scooters
from {{ ref('scooters') }}
group by company