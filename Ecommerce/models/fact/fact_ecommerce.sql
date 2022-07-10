{{ config(
    materialized = 'table'
) }}
-- Derive FACT_ECOMMERCE ( Full Update )
WITH fact_ecommerce AS(

    SELECT
        warehouse_block AS warehouse_block_id,
        mode_of_shipment AS mode_of_shipment_id,
        customer_care_calls,
        customer_rating,
        CAST (
            cost_product AS DOUBLE
        ) AS cost_product,
        prior_purchases,
        product_importance AS product_importance_id,
        gender AS gender_id,
        discount_offered,
        weight_in_gms,
        ROUND (div0 (weight_in_gms, 1000), 1) weight_in_kgs
    FROM
        {{ ref('stg_ecommerce') }}
)
SELECT
    *
FROM
    fact_ecommerce
