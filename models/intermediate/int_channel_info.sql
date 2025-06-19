SELECT channel_id,
       channel_name,
       subscriber_count
FROM {{ ref('stg_youtube__analytics_engineering__videos') }}