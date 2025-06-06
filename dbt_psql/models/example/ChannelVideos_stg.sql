WITH cha_vid as (
    SELECT 
        channel_id AS Channel,
        video_id AS Video,
        title AS Title,
        published_at AS published_date,
        view_count AS views,
        like_count AS likes,
        comment_count AS comments_amount
    FROM {{ source('analytics', 'youtube_engineering_ng') }}

)


SELECT
    Channel,
    Video,
    Title,
    published_date,
    views,
    likes,
    comments_amount,
    --Surrogate Key for Channel_level uniqueness
    {{dbt_utils.generate_surrogate_key(['Channel']) }} as Channel_key
FROM cha_vid