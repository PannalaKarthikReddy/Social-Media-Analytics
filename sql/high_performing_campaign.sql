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
    campaign,
    COUNT(*) AS high_performing_posts,
    ROUND(AVG(reach), 2) AS avg_reach,
    ROUND(AVG(total_engagement), 2) AS avg_engagement,
    ROUND(AVG(engagement_rate), 2) AS avg_engagement_rate
FROM ranked_posts
WHERE performance_decile = 1
GROUP BY campaign
ORDER BY high_performing_posts DESC;

USE social_media_campaign_analytics;

SELECT
    COUNT(*) AS total_posts,
    SUM(reach) AS total_reach,
    SUM(total_engagement) AS total_engagement,
    ROUND(AVG(engagement_rate), 2) AS avg_engagement_rate,
    ROUND(AVG(reach_rate), 2) AS avg_reach_rate,
    ROUND(MAX(engagement_rate), 2) AS max_engagement_rate,
    ROUND(
        (
            SELECT engagement_rate
            FROM social_media_posts
            ORDER BY engagement_rate
            LIMIT 1 OFFSET 4499
        ),
        2
    ) AS approx_90th_percentile
FROM social_media_posts;