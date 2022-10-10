with products as (
    SELECT
        inventory,
        name,
        price,
        product_id
    FROM raw.public.products
)

Select * from products