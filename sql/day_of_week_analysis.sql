USE social_media_campaign_analytics;

SELECT
    DAYNAME(post_date) AS day_of_week,
    COUNT(*) AS posts,
    ROUND(AVG(reach), 2) AS avg_reach,
    ROUND(AVG(total_engagement), 2) AS avg_engagement,
    ROUND(AVG(engagement_rate), 2) AS avg_engagement_rate
FROM social_media_posts
GROUP BY DAYOFWEEK(post_date), DAYNAME(post_date)
ORDER BY DAYOFWEEK(post_date);