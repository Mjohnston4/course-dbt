with user_order_facts as (
    SELECT
        address_id,
        created_at,
        email,
        first_name,
        last_name,
        phone_number,
        updated_at,
        user_id,
        order_created_at,
        order_cost,
        order_id,
        order_total,
        promo_id,
        order_status,
        tracking_id

    FROM {{ ref( 'int_users_orders') }}
)

Select * from user_order_facts