{{ config(materialized = 'table') }}

with Videos_dim as(
    select * from {{ref('Videos_stg') }}
),

Channel_dim as(
    select * from {{ref('Channel_stg') }}
),

final as (
    SELECT 
        C.channel,
        C.channel_title,
        C.Subscribers,
        V.video,
        V.video_title,
        V.published_date,
        V.views,
        V.likes,
        V.comments_amount,
        --Like Rate
        round(case when views > 0 then likes * 1.0 / views else 0 end, 3) as like_rate,
        -- Comment Rate
        case when views > 0 then comments_amount * 1 else 0 end as comment_rate,
        -- engagement Rate = (likes + comments) / views
        round(case when views > 0 then (likes +comments_amount) * 1.0 /views else 0 end,2) as engagement_rate,
        -- Engagement Tier: Low, medium, high
        case 
            when (likes + comments_amount) * 1.0 / nullif(views,0) >= 0.1 then 'high'
            when (likes + comments_amount) * 1.0 / nullif(views,0) >= 0.03 then 'medium'
            else 'low'
        end as engagement_tier,
        -- Channel Rate: Views per subscribers
        round(case when subscribers > 0 then views * 1.0 / subscribers else null end, 0) as channel_rate,
        -- Published year
        extract(year from published_date) as published_year,
        -- Published month
        trim(to_char(published_date, 'Month')) as published_month_name,
        -- Published Dow
        trim(to_char(published_date,'Day')) as published_day_name,
        -- Channel Size Bucket
        case 
            when subscribers < 100000 then 'small'
            when subscribers between 100000 and 1000000 then 'medium'
            else 'large'
        end as channel_size,
        -- Is viral? 
        case 
            when views > 50000 and (likes + comments_amount) * 1.0 / nullif(views, 0) >= 0.025 then true
            else false
        end as is_viral,
        -- Days since Published
        (current_date- published_date) as days_since_published
    from Channel_dim C
    left join Videos_dim V on C.Channel = V.Channel
    group by C.Channel,
            C.channel_title,
            C.Subscribers,
            V.video,
            V.video_title,
            V.published_date,
            V.views,
            V.likes,
            V.comments_amount
)

select * from final