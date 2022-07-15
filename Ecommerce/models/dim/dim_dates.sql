
{# "cast('{{var("year_min") ~ "-01-01" }}' as date)" #}
 {% set date %}

            {{  var( "year_min" ) | as_text ~ "-01-01" }}

        {%endset%}
        {{date}}

WITH dates AS (
   
    {{  
       
        dbt_utils.date_spine(
            
        datepart = "day",
        start_date = "cast('2019-01-01' as date)",
        end_date = "cast('2020-01-01' as date)"
    ) }}
),
othercolumns AS (
    SELECT
        MONTH (
            date_day
        ) AS MONTH,
        YEAR (
            date_day
        ) AS YEAR month_name(date_day) AS month_name,
        quarter (
            date_day
        ) quarter *
    FROM
        dates
);
SELECT
    *
FROM
    othercolumns