SELECT  video_id,
        video_title,
        channel_id,
        channel_name,
        published_date,
        view_count,
        like_count,
        comment_count
FROM {{ ref('stg_youtube__analytics_engineering__videos') }}