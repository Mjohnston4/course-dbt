
-- aggregating event types for user and session


with final as (
    SELECT
        user_id,
        session_id,
        sum(case when event_type = 'checkout' then 1 else 0 end) as checkouts,
        sum(case when event_type = 'package_shipped' then 1 else 0 end) as package_shippeds,
        sum(case when event_type = 'add_to_cart' then 1 else 0 end) as add_to_carts,
        sum(case when event_type = 'page_view' then 1 else 0 end) as page_views

    FROM {{ref('stg_events')}}
    group by 1,2
)

Select * from final





