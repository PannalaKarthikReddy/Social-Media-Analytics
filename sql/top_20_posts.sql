USE social_media_campaign_analytics;

SELECT
    post_id,
    post_date,
    platform,
    content_type,
    campaign,
    reach,
    total_engagement,
    ROUND(engagement_rate, 2) AS engagement_rate,
    RANK() OVER (
        ORDER BY engagement_rate DESC
    ) AS performance_rank
FROM social_media_posts
ORDER BY engagement_rate DESC
LIMIT 20;