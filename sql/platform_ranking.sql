USE social_media_campaign_analytics;

WITH platform_metrics AS (
    SELECT
        platform,
        COUNT(*) AS posts,
        AVG(reach) AS avg_reach,
        AVG(total_engagement) AS avg_engagement,
        AVG(engagement_rate) AS avg_engagement_rate
    FROM social_media_posts
    GROUP BY platform
)

SELECT
    platform,
    posts,
    ROUND(avg_reach, 2) AS avg_reach,
    ROUND(avg_engagement, 2) AS avg_engagement,
    ROUND(avg_engagement_rate, 2) AS avg_engagement_rate,
    RANK() OVER (
        ORDER BY avg_engagement_rate DESC
    ) AS engagement_rate_rank
FROM platform_metrics
ORDER BY engagement_rate_rank;