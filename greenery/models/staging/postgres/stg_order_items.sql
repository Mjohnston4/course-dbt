with order_items as (
    SELECT
        order_id,
        product_id,
        quantity
    FROM raw.public.order_items
)

Select * from order_items