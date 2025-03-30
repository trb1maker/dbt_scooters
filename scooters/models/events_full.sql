select *
from {{ ref('events_clean') }}
inner join {{ ref('event_types') }}
    using (type_id)
