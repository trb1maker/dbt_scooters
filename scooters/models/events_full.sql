select *
from {{ ref('events_clean') }}
join {{ ref('event_types') }}
    using (type_id)
