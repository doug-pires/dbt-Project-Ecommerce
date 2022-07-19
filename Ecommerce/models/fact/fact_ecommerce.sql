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
        CAST (
            '01/01/2022' AS DATE
        ) AS date_stock,
        weight_in_gms,
        {{ gms_to_kgs('weight_in_gms') }}
    FROM
        {{ ref('stg_ecommerce') }}
)
SELECT
    *
FROM
    fact_ecommerce
