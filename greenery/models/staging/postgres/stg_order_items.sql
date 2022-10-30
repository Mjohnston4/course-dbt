{{
  config(
    materialized='view'
  )
}}

with order_items as (
    SELECT
        order_id,
        product_id,
        quantity
    FROM {{source('postgres', 'order_items')}}
)

Select * from order_items