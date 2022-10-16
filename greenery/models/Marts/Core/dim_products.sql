with dim_products as (
    SELECT
        inventory,
        name,
        price,
        product_id
    FROM {{ref('stg_products')}}
)

Select * from dim_products