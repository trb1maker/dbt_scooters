select  
    "group"        age_group,
    count(*)       trips,
    sum(price_rub) revenue_rub
from {{ ref('trips_users') }} t
join {{ ref('age_groups') }} a
    on t.age between a.age_start and a.age_end
group by 1