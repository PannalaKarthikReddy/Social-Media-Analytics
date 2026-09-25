USE social_media_campaign_analytics;

WITH ordered AS (
    SELECT
        engagement_rate,
        ROW_NUMBER() OVER (ORDER BY engagement_rate) AS rn,
        COUNT(*) OVER () AS n
    FROM social_media_posts
),
bounds AS (
    SELECT
        FLOOR((n - 1) * 0.90) + 1 AS lower_pos,
        CEIL((n - 1) * 0.90) + 1 AS upper_pos,
        (n - 1) * 0.90 - FLOOR((n - 1) * 0.90) AS fraction
    FROM ordered
    LIMIT 1
),
values_at_positions AS (
    SELECT
        MAX(CASE WHEN o.rn = b.lower_pos
                 THEN o.engagement_rate END) AS lower_value,
        MAX(CASE WHEN o.rn = b.upper_pos
                 THEN o.engagement_rate END) AS upper_value,
        MAX(b.fraction) AS fraction
    FROM ordered o
    CROSS JOIN bounds b
)
SELECT
    ROUND(
        lower_value +
        fraction * (upper_value - lower_value),
        2
    ) AS p90_engagement_rate
FROM values_at_positions;