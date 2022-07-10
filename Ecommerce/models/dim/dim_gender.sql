-- Derive DIM_GENDER
WITH dim_gender AS(
    SELECT
        gender AS gender_id,
        CASE
            WHEN gender = 'M' THEN 'Male'
            WHEN gender = 'F' THEN 'Female'
            ELSE 'Other'
        END AS description_gender
    FROM
        {{ ref('stg_ecommerce') }}
)
SELECT
    DISTINCT gender_id,
    description_gender
FROM
    dim_gender
