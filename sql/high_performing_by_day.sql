USE social_media_campaign_analytics;

SELECT
    DAYNAME(post_date) AS day_of_week,
    COUNT(*) AS high_performing_posts,
    ROUND(AVG(engagement_rate), 2) AS avg_engagement_rate,
    ROUND(AVG(reach), 2) AS avg_reach,
    ROUND(AVG(total_engagement), 2) AS avg_engagement
FROM social_media_posts
WHERE engagement_rate >= 12.02
GROUP BY DAYOFWEEK(post_date), DAYNAME(post_date)
ORDER BY avg_engagement_rate DESC;

SELECT
    DAYNAME(post_date) AS day_of_week,
    COUNT(*) AS high_performing_posts,
    ROUND(AVG(engagement_rate), 2) AS avg_engagement_rate,
    ROUND(AVG(reach), 2) AS avg_reach,
    ROUND(AVG(total_engagement), 2) AS avg_engagement
FROM social_media_posts
WHERE engagement_rate >= 12.02
GROUP BY DAYOFWEEK(post_date), DAYNAME(post_date)
ORDER BY DAYOFWEEK(post_date);