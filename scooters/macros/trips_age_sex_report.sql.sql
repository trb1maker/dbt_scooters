{% macro trips_age_sex_report(trips_table, granularity) %}

{%- set time_column -%}
    {%- if granularity == 'daily' -%}
        "date"
    {%- elif granularity == 'weekly' -%}
        date_trunc('week', "date")::date "week"
    {%- elif granularity == 'monthly' -%}
        date_trunc('month', "date")::date "month"
    {%- else -%}
        {{ exceptions.raise_compiler_error("Invalid granularity: " ~ granularity) }}
    {%- endif -%}
{%- endset -%}

select
    {{ time_column }},
    age,
    coalesce(sex, 'UNKNOWN') sex,
    count(*)                 trips,
    sum(price_rub)           revenue_rub
from {{ trips_table }}
group by 1, 2, 3

{% endmacro%}