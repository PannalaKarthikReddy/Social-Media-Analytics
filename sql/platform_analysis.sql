CREATE DATABASE social_media_campaign_analytics;
USE social_media_campaign_analytics;

SELECT COUNT(*) AS total_rows
FROM social_media_posts;

SELECT *
FROM social_media_posts
LIMIT 5;

#Platform Performance
SELECT
    platform,
    COUNT(*) AS posts,
    ROUND(AVG(reach), 2) AS avg_reach,
    ROUND(AVG(total_engagement), 2) AS avg_engagement,
    ROUND(AVG(engagement_rate), 2) AS avg_engagement_rate,
    ROUND(AVG(reach_rate), 2) AS avg_reach_rate
FROM social_media_posts
GROUP BY platform
ORDER BY avg_reach DESC;

USE social_media_campaign_analytics;

SELECT
    platform,
    COUNT(*) AS posts,
    ROUND(AVG(reach), 2) AS avg_reach,
    ROUND(AVG(total_engagement), 2) AS avg_engagement,
    ROUND(AVG(engagement_rate), 2) AS avg_engagement_rate,
    ROUND(AVG(reach_rate), 2) AS avg_reach_rate
FROM social_media_posts
GROUP BY platform
ORDER BY avg_reach DESC;

