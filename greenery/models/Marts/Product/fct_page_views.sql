with final as (
    SELECT
        product_id,
        total_product_pageviews
    FROM {{ref( 'int_product_sessions')}}
)

Select * from final