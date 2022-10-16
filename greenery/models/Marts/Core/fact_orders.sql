with fact_orders as (
    SELECT
        address_id,
        created_at,
        delivered_at,
        estimated_delivery_at,
        order_cost,
        order_id,
        order_total,
        promo_id,
        shipping_cost,
        shipping_service,
        status,
        tracking_id,
        user_id
    FROM {{ref('stg_orders')}}
)

Select * from fact_orders