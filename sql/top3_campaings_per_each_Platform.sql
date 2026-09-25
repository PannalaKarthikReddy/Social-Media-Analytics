USE social_media_campaign_analytics;

WITH ranked_campaigns AS (
    SELECT
        platform,
        campaign,
        COUNT(*) AS post_count,
        ROUND(AVG(reach), 2) AS avg_reach,
        ROUND(AVG(total_engagement), 2) AS avg_engagement,
        ROUND(AVG(engagement_rate), 2) AS avg_engagement_rate,
        ROW_NUMBER() OVER (
            PARTITION BY platform
            ORDER BY AVG(engagement_rate) DESC
        ) AS campaign_rank
    FROM social_media_posts
    GROUP BY
        platform,
        campaign
)
SELECT
    platform,
    campaign,
    post_count,
    avg_reach,
    avg_engagement,
    avg_engagement_rate,
    campaign_rank
FROM ranked_campaigns
WHERE campaign_rank <= 3
ORDER BY
    platform,
    campaign_rank;