
-- aggregating event types for user and session

{% set event_types = get_event_types() %}

SELECT
user_id,
session_id,
{% for event_type in event_types %}
sum(case when event_type = '{{event_type}}' then 1 else 0 end) as total_{{event_type}}
{%- if not loop.last %},{% endif -%}
{% endfor %}
FROM {{ref('stg_events')}}
group by 1,2


