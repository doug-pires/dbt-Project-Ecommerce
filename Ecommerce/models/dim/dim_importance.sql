-- Derive DIM_IMPORTANCE
WITH dim_importance AS(
    SELECT
        product_importance AS product_importance_id
    FROM
        {{ ref('stg_ecommerce') }}
)
SELECT
    DISTINCT product_importance_id
FROM
    dim_importance
