USE social_media_campaign_analytics;

WITH platform_campaign AS (
    SELECT
        platform,
        campaign,
        COUNT(*) AS posts,
        AVG(reach) AS avg_reach,
        AVG(total_engagement) AS avg_engagement,
        AVG(engagement_rate) AS avg_engagement_rate
    FROM social_media_posts
    GROUP BY platform, campaign
),

ranked_campaigns AS (
    SELECT
        platform,
        campaign,
        posts,
        avg_reach,
        avg_engagement,
        avg_engagement_rate,
        RANK() OVER (
            PARTITION BY platform
            ORDER BY avg_engagement_rate DESC
        ) AS campaign_rank
    FROM platform_campaign
)

SELECT
    platform,
    campaign,
    posts,
    ROUND(avg_reach, 2) AS avg_reach,
    ROUND(avg_engagement, 2) AS avg_engagement,
    ROUND(avg_engagement_rate, 2) AS avg_engagement_rate,
    campaign_rank
FROM ranked_campaigns
WHERE campaign_rank = 1
ORDER BY platform;