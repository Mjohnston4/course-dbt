{{
  config(
    materialized='view'
  )
}}


with addresses as (
    SELECT
        address_id,
        address,
        zipcode,
        state,
        country
    FROM {{source('postgres', 'addresses')}}
)

Select * from addresses