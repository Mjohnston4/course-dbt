{{
  config(
    materialized='view'
  )
}}
-- the final table contains product dimensions on orders

with cte_checkout_orders as 
    (
    SELECT
        e.order_id,
        e.product_id,
        e.session_id,
        o.order_total,
        o.order_cost
    FROM {{ ref( 'stg_events') }} e
    left Join {{ ref( 'stg_orders') }} o
    On e.order_id = o.user_id
    Where event_type = 'checkout'
    ), cte_order_items_in_checkout as(
        Select 
            c.order_id,
            c.order_cost,
            c.order_total,
            c.session_id,
            oi.product_id,
            oi.quantity
        From cte_checkout_orders c
        left join {{ ref( 'stg_order_items') }} oi
        on oi.order_id = c.order_id
        ), cte_products_in_checkout as
            ( Select 
                p.product_id,
                p.name as product_name,
                p.price,
                p.inventory,
                session_id as sessions_for_ordered_products,
                order_id,
                quantity,
                order_cost,
                order_total
             From cte_order_items_in_checkout ch
             left JOIN {{ ref( 'stg_products') }} p
             ON p.product_id = ch.product_id
                )

Select * from cte_products_in_checkout