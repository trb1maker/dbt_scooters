select
    age,
    {{ dbt_utils.pivot(
        column='sex',
        values=['F', 'M']
    ) }}
from {{ ref('trips_users') }}
group by age
order by age
