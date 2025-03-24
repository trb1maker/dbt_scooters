{% test unique_key(model, columns) %}
select
    {% for column in columns %}
    "{{ column }}"::text ||
    {% endfor %}
    ''
from {{ model }}
group by 1
having count(*) > 1
{% endtest %}