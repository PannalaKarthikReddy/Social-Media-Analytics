USE social_media_campaign_analytics;

WITH ranked_content AS (
    SELECT
        campaign,
        content_type,
        COUNT(*) AS post_count,
        ROUND(AVG(reach), 2) AS avg_reach,
        ROUND(AVG(total_engagement), 2) AS avg_engagement,
        ROUND(AVG(engagement_rate), 2) AS avg_engagement_rate,
        ROW_NUMBER() OVER (
            PARTITION BY campaign
            ORDER BY AVG(engagement_rate) DESC
        ) AS content_rank
    FROM social_media_posts
    GROUP BY
        campaign,
        content_type
)
SELECT
    campaign,
    content_type,
    post_count,
    avg_reach,
    avg_engagement,
    avg_engagement_rate,
    content_rank
FROM ranked_content
WHERE content_rank <= 3
ORDER BY
    campaign,
    content_rank;