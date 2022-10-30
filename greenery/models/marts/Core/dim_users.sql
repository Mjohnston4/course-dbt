{{
  config(
    materialized='view'
  )
}}

with dim_users as (
    SELECT
        address_id,
        created_at,
        user_email,
        user_first_name,
        user_last_name,
        phone_number,
        updated_at,
        user_id
    FROM {{ref('stg_users')}}
)

Select * from dim_users