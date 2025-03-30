{{ trips_geom_stat(
    trips_table=ref('trips_geom'),
    geom_col='finish_point',
    grid=10
) }}
