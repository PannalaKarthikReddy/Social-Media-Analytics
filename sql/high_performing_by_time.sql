USE social_media_campaign_analytics;

SELECT
    CASE
        WHEN posting_hour BETWEEN 5 AND 8 THEN 'Morning'
        WHEN posting_hour BETWEEN 9 AND 11 THEN 'Late Morning'
        WHEN posting_hour BETWEEN 12 AND 14 THEN 'Afternoon'
        WHEN posting_hour BETWEEN 15 AND 17 THEN 'Evening'
        WHEN posting_hour BETWEEN 18 AND 21 THEN 'Prime Time'
        ELSE 'Late Night'
    END AS time_bucket,
    COUNT(*) AS high_performing_posts,
    ROUND(AVG(engagement_rate), 2) AS avg_engagement_rate,
    ROUND(AVG(reach), 2) AS avg_reach,
    ROUND(AVG(total_engagement), 2) AS avg_engagement
FROM social_media_posts
WHERE engagement_rate >= 12.02
GROUP BY time_bucket
ORDER BY avg_engagement_rate DESC;