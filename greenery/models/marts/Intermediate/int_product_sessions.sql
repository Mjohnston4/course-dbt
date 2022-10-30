{{
  config(
    materialized='view'
  )
}}

Select 
    product_id, 
    count(session_id) as total_product_pageviews
FROM {{ref('stg_events')}}
where event_type = 'page_view'
group by 1