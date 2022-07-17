-- Config
{{ config(
    materialized = 'view'
) }}
---------------------------------
{{ dbt_utils.date_spine(
    datepart = "day",
    start_date = "cast(" ~ "'" ~ var('year_min') ~ "-01-01' " ~ "as date)",
    end_date = "cast(" ~ "'" ~ var('year_max') ~ "-12-31' " ~ "as date)"
) }}
