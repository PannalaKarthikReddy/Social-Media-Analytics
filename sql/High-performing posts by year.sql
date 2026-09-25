SELECT
    YEAR(STR_TO_DATE(post_date, '%Y-%m-%d %H:%i:%s')) AS year,
    COUNT(*) AS high_performing_posts,
    ROUND(AVG(engagement_rate), 2) AS avg_engagement_rate,
    ROUND(AVG(reach), 2) AS avg_reach,
    ROUND(AVG(total_engagement), 2) AS avg_engagement
FROM social_media_posts
WHERE engagement_rate >= 12.02
GROUP BY YEAR(STR_TO_DATE(post_date, '%Y-%m-%d %H:%i:%s'))
ORDER BY year;