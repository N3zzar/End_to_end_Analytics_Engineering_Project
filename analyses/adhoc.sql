with video_channels__data(
    select *
    from {{ ref('stg_youtube__analytics_engineering__videos') }}
),

benchmark as(
    select 
        average_value as youtube_avg_engagement_rate
    from {{ ref('platform_benchmarks') }}
    where metric = 'engagement_rate'
)

select
    vd.channel,
    vd.channel_title,
    vd.Subscribers,
    vd.video,
    vd.video_title,
    vd.published_date,
    vd.views,
    vd.likes,
    vd.comments_amount,
    vd.engagement_rate,
    b.youtube_avg_engagement_rate
    round(vd.engagement_rate - b.youtube_avg_engagement_rate,4) as delta_from_avg
from video_channels__data vd 
cross join benchmark b 
where vd.engagement_rate > b.youtube_avg_engagement_rate
order by delta_from_avg desc