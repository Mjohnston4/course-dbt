with users as (
    SELECT
        address_id,
        created_at,
        email,
        first_name,
        last_name,
        phone_number,
        updated_at,
        user_id
    FROM raw.public.users
)

Select * from users