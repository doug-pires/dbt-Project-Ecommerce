WITH dates AS (
    SELECT
        *
    FROM
        {{ ref('stg_date') }}
),
basecolumns AS (
    SELECT
        date_day,
        MONTH (
            date_day
        ) AS numbermonth,
        YEAR (
            date_day
        ) AS yearnumber,
        MONTHNAME(date_day) AS month_name,
        quarter (date_day) AS quarternumber
    FROM
        dates
),
FINAL AS (
    SELECT
        *,
        month_name || ' - ' || yearnumber AS month_year,
        {{ extract_orderyearmonth(
            'yearnumber',
            'numbermonth'
        ) }} AS orderyearmonth
    FROM
        basecolumns
)
SELECT
    *
FROM
    FINAL
