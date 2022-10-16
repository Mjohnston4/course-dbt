with int_users_orders as (
    SELECT
        u.address_id,
        u.created_at,
        u.email,
        u.first_name,
        u.last_name,
        u.phone_number,
        u.updated_at,
        u.user_id,
        o.created_at as order_created_at,
        o.order_cost,
        o.order_id,
        o.order_total,
        o.promo_id,
        o.status as order_status,
        o.tracking_id,
        Select count(u.user_id) as count_users,

    FROM {{ ref( 'stg_users') }} u
    left Join {{ ref( 'stg_orders') }} o
        On u.user_id = o.user_id
)

Select * from int_users_orders
