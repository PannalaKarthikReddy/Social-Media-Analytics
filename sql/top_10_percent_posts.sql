USE social_media_campaign_analytics;

WITH ranked_posts AS (
    SELECT
        post_id,
        platform,
        content_type,
        campaign,
        reach,
        total_engagement,
        engagement_rate,

        NTILE(10) OVER (
            ORDER BY engagement_rate DESC
        ) AS performance_decile

    FROM social_media_posts
)

SELECT
    post_id,
    platform,
    content_type,
    campaign,
    reach,
    total_engagement,
    ROUND(engagement_rate, 2) AS engagement_rate
FROM ranked_posts
WHERE performance_decile = 1
ORDER BY engagement_rate DESC;