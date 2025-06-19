{% set keywords = [
  'hex', 'apache spark', 'snowflake', 'dbt', 'spark', 'prefect', 'data pipeline', 'postgresql', 'data modeling', 'elt', 'etl', 'airbyte', 'scd', 'dp-600', 'analytics engineer', 'dagster', 'docker', 'pipeline', 'orchestrator',  'orchestration',  'sql'
] %}

WITH 

source as (
    select *  
    from {{ source('analytics', 'youtube_engineering_ng') }}
),


selected_columns as (
    select 
        channel_id, 
        channel_title, 
        subscriber_count,
        video_id,
        title,
        published_at,
        view_count,
        like_count,
        comment_count
    from source
),


filtered as (
    select * 
    from selected_columns
    where view_count > 4
      and (
        {% for keyword in keywords %}
            lower(title) like '%{{ keyword | lower }}%' {% if not loop.last %} or {% endif %}
        {% endfor %}
      )
),


renamed as(
    select
        channel_id::text as channel_id,
        channel_title::text as channel_name,
        subscriber_count::int as subscriber_count,
        video_id::text as video_id,
        title::text as video_title,
        published_at::date as published_date,
        view_count::int as view_count,
        like_count::int as like_count,
        comment_count::int as comment_count
    from filtered
)

select * from renamed