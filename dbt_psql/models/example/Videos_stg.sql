SELECT channel,
        video,
        video_title,
        published_date,
        views,
        likes,
        comments_amount
FROM {{ ref('Cleaned_stg') }}