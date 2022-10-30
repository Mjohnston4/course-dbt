{{
  config(
    materialized='view'
  )
}}

with products as (
    SELECT
        inventory,
        name,
        price,
        product_id
    FROM {{source('postgres', 'products')}}
)

Select * from products