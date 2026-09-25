USE social_media_campaign_analytics;

WITH ranked_time_buckets AS (
    SELECT
        platform,
        CASE
            WHEN posting_hour BETWEEN 5 AND 8 THEN 'Morning'
            WHEN posting_hour BETWEEN 9 AND 11 THEN 'Late Morning'
            WHEN posting_hour BETWEEN 12 AND 15 THEN 'Afternoon'
            WHEN posting_hour BETWEEN 16 AND 18 THEN 'Evening'
            WHEN posting_hour BETWEEN 19 AND 22 THEN 'Prime Time'
            ELSE 'Late Night'
        END AS time_bucket,
        COUNT(*) AS post_count,
        ROUND(AVG(reach), 2) AS avg_reach,
        ROUND(AVG(total_engagement), 2) AS avg_engagement,
        ROUND(AVG(engagement_rate), 2) AS avg_engagement_rate,
        ROW_NUMBER() OVER (
            PARTITION BY platform
            ORDER BY AVG(engagement_rate) DESC
        ) AS time_rank
    FROM social_media_posts
    GROUP BY
        platform,
        time_bucket
)
SELECT
    platform,
    time_bucket,
    post_count,
    avg_reach,
    avg_engagement,
    avg_engagement_rate,
    time_rank
FROM ranked_time_buckets
WHERE time_rank <= 3
ORDER BY
    platform,
    time_rank;