select
    t.*,
    u.sex,
    extract(year from t.started_at) - extract(year from u.birth_date) age,
    {{ updated_at() }}
from {{ ref('trips_prep') }} t
left join {{ source('scooters_raw', 'users') }} u 
    on t.user_id = u.id
where
{% if is_incremental() %}
    t.id > (select max(id) from {{ this }})
{% else %}
    t.id <= 75000
{% endif %}
order by t.id
limit 75000