USE social_media_campaign_analytics;

WITH ranked_posts AS (
    SELECT
        post_id,
        post_date,
        platform,
        content_type,
        campaign,
        reach,
        total_engagement,
        ROUND(engagement_rate, 2) AS engagement_rate,
        ROW_NUMBER() OVER (
            PARTITION BY platform
            ORDER BY engagement_rate DESC
        ) AS platform_rank
    FROM social_media_posts
)
SELECT
    post_id,
    post_date,
    platform,
    content_type,
    campaign,
    reach,
    total_engagement,
    engagement_rate,
    platform_rank
FROM ranked_posts
WHERE platform_rank <= 5
ORDER BY platform, platform_rank;