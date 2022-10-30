{{
  config(
    materialized='view'
  )
}}


Select  
    ips.product_id,
    ips.product_name,
    count(distinct e.session_id) as product_sessions,
    count(distinct sessions_for_ordered_products) as total_sessions_for_ordered_products,
    count(distinct sessions_for_ordered_products) /  count(distinct e.session_id) as product_conversion,
    count(ips.order_id) as count_orders_with_product,
    sum(quantity) as total_products_ordered,
    sum(quantity*price) as total_products_revenue,
    sum(quantity*price)/count(ips.order_id) as AOV
    from {{ref('int_product_stats')}} ips
    FUll Join {{ref('stg_events')}} e
    on ips.product_id = e.product_id
    group by 1,2