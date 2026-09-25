USE social_media_campaign_analytics;

SELECT
    CASE
        WHEN posting_hour BETWEEN 0 AND 5 THEN 'Late Night'
        WHEN posting_hour BETWEEN 6 AND 9 THEN 'Morning'
        WHEN posting_hour BETWEEN 10 AND 12 THEN 'Late Morning'
        WHEN posting_hour BETWEEN 13 AND 16 THEN 'Afternoon'
        WHEN posting_hour BETWEEN 17 AND 19 THEN 'Evening'
        ELSE 'Prime Time'
    END AS time_bucket,

    COUNT(*) AS posts,
    ROUND(AVG(reach), 2) AS avg_reach,
    ROUND(AVG(total_engagement), 2) AS avg_engagement,
    ROUND(AVG(engagement_rate), 2) AS avg_engagement_rate

FROM social_media_posts

GROUP BY
    CASE
        WHEN posting_hour BETWEEN 0 AND 5 THEN 'Late Night'
        WHEN posting_hour BETWEEN 6 AND 9 THEN 'Morning'
        WHEN posting_hour BETWEEN 10 AND 12 THEN 'Late Morning'
        WHEN posting_hour BETWEEN 13 AND 16 THEN 'Afternoon'
        WHEN posting_hour BETWEEN 17 AND 19 THEN 'Evening'
        ELSE 'Prime Time'
    END

ORDER BY avg_engagement_rate DESC;