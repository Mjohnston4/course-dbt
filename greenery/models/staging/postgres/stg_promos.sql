with promos as (
    SELECT
        discount,
        promo_id,
        status
    FROM raw.public.promos
)

Select * from promos