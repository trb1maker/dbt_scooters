{% macro trips_geom_stat(trips_table, geom_col, grid) %}
select
    st_transform(hex.geom, 4326) geom,
    count(*)                     trips
from {{ trips_table }}
cross join st_hexagongrid({{ grid }}, st_transform({{ geom_col }}, 3857)) hex
where st_intersects(st_transform({{ geom_col }}, 3857), hex.geom)
group by 1
{% endmacro %}