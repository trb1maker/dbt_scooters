select
    count(fan or null) fan_count,
    count(regular or null) regular_count,
    count(rare or null) rare_count,
    count(to_work or null) to_work_count,
    count(no_class or null) no_class_count,
    count(*) total_count
from {{ ref('users_class') }}
