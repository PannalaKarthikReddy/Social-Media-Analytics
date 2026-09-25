USE social_media_campaign_analytics;

SELECT
    platform,
    content_type,
    COUNT(*) AS posts,
    ROUND(AVG(reach), 2) AS avg_reach,
    ROUND(AVG(total_engagement), 2) AS avg_engagement,
    ROUND(AVG(engagement_rate), 2) AS avg_engagement_rate,
    RANK() OVER (
        PARTITION BY platform
        ORDER BY AVG(engagement_rate) DESC
    ) AS content_rank
FROM social_media_posts
GROUP BY platform, content_type
ORDER BY platform, content_rank;