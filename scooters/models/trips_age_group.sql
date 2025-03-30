select
    "group" as age_group,
    count(*) as trips,
    sum(price_rub) as revenue_rub
from {{ ref('trips_users') }} as t
inner join {{ ref('age_groups') }} as a
    on t.age between a.age_start and a.age_end
group by 1
