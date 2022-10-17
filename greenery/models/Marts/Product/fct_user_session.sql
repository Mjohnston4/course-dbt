{{config( 
    materialized = 'table'
    )
}}

with session_length as (
    SELECT
        session_id,
        min(created_at) as first_event,
        max(created_at) as last_event
    from {{ref('stg_events')}}
    group by 1
) 

, session_events_agg as (
Select * from {{ref('int_sessions_events_agg')}}
)

, users as (
    Select * from {{ref('stg_users')}}
)

Select
session_events_agg.session_id,
session_events_agg.user_id,
users.user_first_name,
users.user_last_name,
users.user_email,
session_events_agg.page_views,
session_events_agg.add_to_carts,
session_events_agg.checkouts,
session_events_agg.package_shippeds,
session_length.first_event as first_session_event,
session_length.last_event as last_session_event
, datediff('minute', session_length.first_event,session_length.last_event) as session_length_minutes

from session_events_agg
left join users
on users.user_id = session_events_agg.user_id
left join session_length
on session_length.session_id = session_events_agg.session_id













