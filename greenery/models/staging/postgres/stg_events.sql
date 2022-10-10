with events as (
    SELECT
        created_at,
        event_id,
        event_type,
        order_Id,
        page_url,
        product_id,
        session_id,
        user_id
    FROM raw.public.events
)

Select * from events