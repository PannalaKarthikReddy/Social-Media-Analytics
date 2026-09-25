SELECT
    campaign,
    content_type,
    COUNT(*) AS high_performing_posts,
    ROUND(AVG(engagement_rate), 2) AS avg_engagement_rate,
    ROUND(AVG(reach), 2) AS avg_reach,
    ROUND(AVG(total_engagement), 2) AS avg_engagement
FROM social_media_posts
WHERE engagement_rate >= 12.02
GROUP BY campaign, content_type
ORDER BY campaign, avg_engagement_rate DESC;