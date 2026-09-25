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
    content_type,
    COUNT(*) AS high_performing_posts,
    ROUND(AVG(reach), 2) AS avg_reach,
    ROUND(AVG(total_engagement), 2) AS avg_engagement,
    ROUND(AVG(engagement_rate), 2) AS avg_engagement_rate
FROM ranked_posts
WHERE performance_decile = 1
GROUP BY content_type
ORDER BY high_performing_posts DESC;