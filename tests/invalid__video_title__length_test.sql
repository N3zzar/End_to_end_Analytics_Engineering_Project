select *
from {{ ref('fct_videos_performance') }}
where video_title IS NULL AND LENGTH(TRIM(video_title)) > 500