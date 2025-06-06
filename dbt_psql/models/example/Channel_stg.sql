SELECT channel,
       channel_title,
       Subscribers
FROM {{ ref('Cleaned_stg') }}