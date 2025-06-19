{{ config(materialized = 'table') }}

with videos_dim as(
    select * from {{ ref('int_videos_info') }}
),


channel_dim as(
    select * from {{ ref('int_channel_info') }}
),


final as (
    SELECT 
        channel_dim.channel_id,
        channel_dim.channel_name,
        channel_dim.subscriber_count,
        videos_dim.video_id,
        videos_dim.video_title,
        videos_dim.published_date,
        videos_dim.view_count,
        videos_dim.like_count,
        videos_dim.comment_count,
        --Like Rate
        round(case when view_count > 0 then like_count * 1.0 / view_count else 0 end, 3) as like_rate,
        -- Comment Rate
        case when view_count > 0 then comment_count * 1 else 0 end as comment_rate,
        -- engagement Rate = (like_count + comments) / view_count
        round(case when view_count > 0 then (like_count +comment_count) * 1.0 /view_count else 0 end,2) as engagement_rate,
        -- Engagement Tier: Low, medium, high
        case 
            when (like_count + comment_count) * 1.0 / nullif(view_count,0) >= 0.1 then 'high'
            when (like_count + comment_count) * 1.0 / nullif(view_count,0) >= 0.03 then 'medium'
            else 'low'
        end as engagement_tier,
        -- Channel Rate: Views per subscribers
        round(case when subscriber_count > 0 then view_count * 1.0 / subscriber_count else null end, 0) as channel_rate,
        -- Published year
        extract(year from published_date) as published_year,
        -- Published month
        trim(to_char(published_date, 'Month')) as published_month_name,
        -- Published Dow
        trim(to_char(published_date,'Day')) as published_day_name,
        -- Channel Size Bucket
        case 
            when subscriber_count < 100000 then 'small'
            when subscriber_count between 100000 and 1000000 then 'medium'
            else 'large'
        end as channel_size,
        -- Days since Published
        (current_date- published_date) as days_since_published,
        -- Is viral? (calculation done using macro)
        {{ is_viral('view_count', 'like_count', 'comment_count', 0.025) }} as is_viral
    from channel_dim
    left join videos_dim on channel_dim.channel_id = videos_dim.channel_id
    group by 1,2,3,4,5,6,7,8,9
)

select * from final
