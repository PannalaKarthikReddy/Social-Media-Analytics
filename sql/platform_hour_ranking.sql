USE social_media_campaign_analytics;

WITH hourly_platform AS (
    SELECT
        platform,
        posting_hour,
        COUNT(*) AS posts,
        AVG(reach) AS avg_reach,
        AVG(total_engagement) AS avg_engagement,
        AVG(engagement_rate) AS avg_engagement_rate
    FROM social_media_posts
    GROUP BY platform, posting_hour
),

ranked_hours AS (
    SELECT
        platform,
        posting_hour,
        posts,
        avg_reach,
        avg_engagement,
        avg_engagement_rate,
        RANK() OVER (
            PARTITION BY platform
            ORDER BY avg_engagement_rate DESC
        ) AS hour_rank
    FROM hourly_platform
)

SELECT
    platform,
    posting_hour,
    posts,
    ROUND(avg_reach, 2) AS avg_reach,
    ROUND(avg_engagement, 2) AS avg_engagement,
    ROUND(avg_engagement_rate, 2) AS avg_engagement_rate,
    hour_rank
FROM ranked_hours
WHERE hour_rank <= 3
ORDER BY platform, hour_rank;