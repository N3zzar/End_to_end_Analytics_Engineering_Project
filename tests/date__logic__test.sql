select *
from {{ ref('fct_videos_performance')}}
where published_date >= current_date