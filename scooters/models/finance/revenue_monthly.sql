select
    "month",
    count(*) users,
    percentile_cont(0.5) within group (
        order by revenue_total
    ) revenue_median,
    percentile_cont(0.95) within group (
        order by revenue_total
    ) revenue_95,
    max(revenue_total) revenue_max,
    sum(revenue_total) revenue_total
from {{ ref('revenue_user_monthly') }}
group by 1
