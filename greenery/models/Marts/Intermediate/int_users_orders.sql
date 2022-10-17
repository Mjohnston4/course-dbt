with cte_user_order as (
    SELECT
        u.user_id,
        sum(Case when o.status = 'shipped'   then 1 else 0 end ) as number_of_shipped_orders,
        sum(Case when o.status = 'preparing' then 1 else 0 end ) as number_of_prepared_orders,
        sum(Case when o.status = 'delivered' then 1 else 0 end ) as number_of_delivered_orders,
        min(o.created_at) as first_order_created_at,
        max(o.created_at) as last_order_created_at,
        min(delivered_at) as first_order_delivered_at,
        max(delivered_at) as last_order_delivered_at,
        sum(o.order_cost) as total_order_cost,
        max(o.order_total) as max_spend_per_user,
        sum(o.order_total) as total_spend_per_user
    FROM {{ ref( 'stg_users') }} u
    left Join {{ ref( 'stg_orders') }} o
    On u.user_id = o.user_id
    Group by 1
)

Select * from cte_user_order