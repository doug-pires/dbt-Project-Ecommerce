-- Config if necessity
-- Queries
WITH dim_warehouse AS(
    SELECT
        warehouse_block AS warehouse_block_id,
        CASE
            WHEN warehouse_block = 'A' THEN 'Alvada'
            WHEN warehouse_block = 'B' THEN 'Balvada'
            WHEN warehouse_block = 'C' THEN 'Calvada'
            WHEN warehouse_block = 'D' THEN 'Dpires'
            WHEN warehouse_block = 'F' THEN 'Falvada'
            ELSE 'N/A'
        END AS description_warehouse
    FROM
        {{ ref('stg_ecommerce') }}
)
SELECT
    DISTINCT warehouse_block_id,
    description_warehouse
FROM
    dim_warehouse
ORDER BY
    warehouse_block_id ASC
