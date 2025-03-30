{{ 
    trips_geom_stat(
        trips_table=ref('trips_geom'),
        geom_col='start_point',
        grid=500
    )
}}
