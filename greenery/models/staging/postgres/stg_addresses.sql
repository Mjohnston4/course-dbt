with addresses as (
    SELECT
        address_id,
        address,
        zipcode,
        state,
        country
    FROM raw.public.addresses
)

Select * from addresses