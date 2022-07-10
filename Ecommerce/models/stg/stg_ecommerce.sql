-- Configs if necessity
-- Change names of some columns and with minimum transformations
WITH stg_ecommerce AS (
    SELECT
        *
    FROM
        {{ source(
            'ecommerce',
            'ecommerce_raw'
        ) }}
)
SELECT
    id AS id_row,
    warehouse_block,
    mode_of_shipment,
    customer_care_calls,
    customer_rating,
    cost_of_the_product AS cost_product,
    prior_purchases,
    INITCAP (
        product_importance
    ) AS product_importance,
    gender,
    discount_offered,
    weight_in_gms
FROM
    stg_ecommerce
