with dim_users as (
    SELECT
        address_id,
        created_at,
        email,
        first_name,
        last_name,
        phone_number,
        updated_at,
        user_id
    FROM {{ref('stg_users')}}
)

Select * from dim_users