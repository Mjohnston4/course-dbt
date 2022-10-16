with promos as (
    SELECT
        discount,
        promo_id,
        status
    FROM {{source('postgres', 'promos')}}
)

Select * from promos