with users_orders_facts as (
    SELECT
    user_id,
    number_of_shipped_orders,
    number_of_prepared_orders,
    number_of_delivered_orders,
    first_order_created_at,
    last_order_created_at,
    first_order_delivered_at,
    last_order_delivered_at,
    total_order_cost,
    max_spend_per_user,
    total_spend_per_user
    FROM {{ ref( 'int_users_orders') }}
)

Select * from users_orders_facts