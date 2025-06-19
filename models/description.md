{% docs columns_description %}

## This 'columns_description' documentation

This documentation houses the description for all the columns.

video_id
Unique identifier for each video. This is the primary key for video_level analysis

video_title
The exact title of the video as published on Youtube.

channel_id
Unique identifier for each channel. This is the primary key for channel_level analysis

Channel_title
Name of the Youtube Channel that uploaded the video

subscribers
Total numbers of subcribers this channel had at the time of data capture

published_date
The date the video was published on the platform

view_count
Total views the video has accumulated

likes_count
Number of likes the video recieved

comments_amount
Number of comments posted on the video

engagement_rate
Ratio of total engagement (likes + comments) to view or subscribers, indicating viewer interaction level

engagement_tier
Categorical classifciation (e.g High, medium, Low) based on engagement_raet benchmarks

like_rate
percentage of viewers who commented on the video (comments_amount / views).

comments_rate
Ratio of total video views to the number of channel subscribers, showing content reach efficiency

channel_size 
Categorical tier of the channel based on subscribers count (e.g Micro, mid, macro, mega)

published_year
Year extracted from the published_date

published_month
Month extracted from the published_date

published_year
Day of the week (e.g., Monday, Tuesday) the video was published

days_since_published
Number of days elapsed since the video was published, calculated as the difference between the current date and the published_date.

is_viral
Boolean flag indicating whether a video surpassed a predefined viral engagement threshold


{% enddocs %}