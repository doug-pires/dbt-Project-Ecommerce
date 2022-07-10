-- Build a query to check if there are discounts offered greater than 100%
-- Only run dbt test to check it out
SELECT
    *
FROM
    {{ ref('fact_ecommerce') }}
WHERE
    discount_offered >= 100
LIMIT 10
