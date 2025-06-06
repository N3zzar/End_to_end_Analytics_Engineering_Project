WITH raw as (
        select channel_id, 
                channel_title, 
                subscriber_count,
                video_id,
                Cast(title as TEXT),
                published_at,
                view_count,
                like_count,
                comment_count
        from {{ source('analytics', 'youtube_engineering_ng') }}
),

filtered as (
    select * 
    from raw
    WHERE (view_count > 4)
      and (
        LOWER(title) LIKE '%hex%'
        OR LOWER(title) LIKE '%apache spark%'
        OR LOWER(title) LIKE '%snowflake%'
        OR LOWER(title) LIKE '%dbt%'
        OR LOWER(title) LIKE '%spark%'
        OR LOWER(title) LIKE '%prefect%'
        OR LOWER(title) LIKE '%data pipeline%'
        OR LOWER(title) LIKE '%postgresql%'
        OR LOWER(title) LIKE '%data modeling%'
        OR LOWER(title) LIKE '%elt%'
        OR LOWER(title) LIKE '%etl%'
        OR LOWER(title) LIKE '%airbyte%'
        OR LOWER(title) LIKE '%scd%'
        OR LOWER(title) LIKE '%dp-600%'
        OR LOWER(title) LIKE '%analytics engineer%'
        OR LOWER(title) LIKE '%dagster%'
        OR LOWER(title) LIKE '%docker%'
        OR LOWER(title) LIKE '%pipeline%'
        OR LOWER(title) LIKE '%orchestrator%'
        OR LOWER(title) LIKE '%orchestration%'
        OR LOWER(title) LIKE '%sql%'
      )
),

renamed as(
    select
        channel_id AS channel, 
        channel_title AS channel_title,
        subscriber_count As Subscribers,
        video_id AS video,
        title AS video_title,
        CAST(published_at AS Date) as published_date,
        view_count AS views,
        like_count AS likes,
        comment_count AS comments_amount
    from filtered
)

select * from renamed