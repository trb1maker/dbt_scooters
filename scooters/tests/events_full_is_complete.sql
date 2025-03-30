with
source_cte as (
    select count(*) row_count
    from {{ ref('events_clean') }}
),

target_cte as (
    select count(*) row_count
    from {{ ref('events_full') }}
)

select
    'Row count mismatch' error_message,
    source_cte.row_count source_count,
    target_cte.row_count target_count
from source_cte, target_cte
where source_cte.row_count != target_cte.row_count
