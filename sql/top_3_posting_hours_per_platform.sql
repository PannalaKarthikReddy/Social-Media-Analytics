USE social_media_campaign_analytics;

WITH ranked_hours AS (
    SELECT
        platform,
        posting_hour,
        COUNT(*) AS post_count,
        ROUND(AVG(reach), 2) AS avg_reach,
        ROUND(AVG(total_engagement), 2) AS avg_engagement,
        ROUND(AVG(engagement_rate), 2) AS avg_engagement_rate,
        ROW_NUMBER() OVER (
            PARTITION BY platform
            ORDER BY AVG(engagement_rate) DESC
        ) AS hour_rank
    FROM social_media_posts
    GROUP BY platform, posting_hour
)
SELECT
    platform,
    posting_hour,
    post_count,
    avg_reach,
    avg_engagement,
    avg_engagement_rate,
    hour_rank
FROM ranked_hours
WHERE hour_rank <= 3
ORDER BY platform, hour_rank;