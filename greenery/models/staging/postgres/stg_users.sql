{{
  config(
    materialized='view'
  )
}}

with users as (
    SELECT
        address_id,
        created_at,
        email as user_email,
        first_name as user_first_name,
        last_name as user_last_name,
        phone_number,
        updated_at,
        user_id
    FROM {{source('postgres', 'users')}}
)

Select * from users