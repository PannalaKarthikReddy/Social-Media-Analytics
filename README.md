# Social-Media-Analytics
End-to-end social media analytics project using MySQL, SQL, and Power BI

## 📌 Project Overview

This project analyzes social media performance data across **Facebook, Instagram, LinkedIn, and YouTube** to identify patterns in engagement, reach, content performance, campaign performance, and posting behavior.

The project combines **MySQL for data analysis** and **Microsoft Power BI for interactive visualization**, transforming raw social media post data into measurable insights and data-informed recommendations.

The dataset covers **2025–2026** and contains approximately **5,000 posts**.

---

## 🎯 Business Problem

Social media platforms generate large amounts of performance data, but raw metrics do not always explain which content, campaigns, platforms, or publishing periods are associated with stronger engagement.

This project addresses questions such as:

* How is social media performing overall?
* How does engagement vary across platforms?
* Which campaign categories show different engagement patterns?
* How does performance vary by content type?
* How does engagement vary by posting time and day?
* How has performance changed across 2025 and 2026?
* What characteristics are common among high-performing posts?

---

## 🎯 Project Objectives

* Measure overall social media performance.
* Analyze engagement, reach, and engagement rate.
* Compare performance across platforms.
* Analyze campaign and content-type performance.
* Identify high-performing posts.
* Analyze posting-time and day-of-week patterns.
* Compare high-performing content across years.
* Build an interactive Power BI dashboard.
* Generate data-informed business recommendations.

---

## 🗂️ Dataset

The dataset contains post-level social media performance data.

### Key columns

| Column             | Description             |
| ------------------ | ----------------------- |
| `post_id`          | Unique post identifier  |
| `post_date`        | Date of publication     |
| `platform`         | Social media platform   |
| `content_type`     | Content format          |
| `campaign`         | Campaign category       |
| `category`         | Post category           |
| `posting_hour`     | Hour of publication     |
| `followers`        | Followers at posting    |
| `impressions`      | Number of impressions   |
| `reach`            | Number of users reached |
| `likes`            | Likes generated         |
| `comments`         | Comments generated      |
| `shares`           | Shares generated        |
| `saves`            | Saves generated         |
| `total_engagement` | Total engagement        |
| `engagement_rate`  | Engagement rate         |
| `reach_rate`       | Reach rate              |

---

## 🛠️ Tools & Technologies

* **MySQL** — database and SQL analysis
* **SQL** — aggregation, filtering, segmentation, and performance analysis
* **Microsoft Power BI** — interactive dashboard and visualization
* **Power Query / Power BI Data Model** — data connection and preparation
* **GitHub** — project documentation and portfolio presentation

---

## 🔄 Project Workflow

```text
Raw Social Media Data
        ↓
MySQL Database
        ↓
SQL Data Analysis
        ↓
Performance Segmentation
        ↓
Power BI
        ↓
Interactive Dashboard
        ↓
Business Insights
        ↓
Recommendations
```

---

# 🔎 SQL Analysis

SQL was used to transform the raw post-level data into meaningful performance metrics.

The analysis used:

* `COUNT()`
* `SUM()`
* `AVG()`
* `GROUP BY`
* `ORDER BY`
* Conditional filtering
* Date-based analysis
* Platform and campaign segmentation

### Overall KPI calculations

The analysis produced:

| KPI                      |     Result |
| ------------------------ | ---------: |
| Total Posts              |     **5K** |
| Total Engagement         |   **101M** |
| Average Reach            | **235.6K** |
| Average Engagement Rate  |  **8.32%** |
| Average Total Engagement | **20.25K** |

---

# 🚀 High-Performing Post Analysis

To identify unusually strong-performing content, an engagement-rate threshold of **12.02%** was used.

Posts satisfying:

```text
engagement_rate >= 12.02%
```

were classified as high-performing.

### High-performing segment

| Metric                   |     Result |
| ------------------------ | ---------: |
| High-performing posts    |    **500** |
| Average Engagement Rate  | **13.15%** |
| Average Reach            | **280.6K** |
| Average Total Engagement |  **37.1K** |

This segmentation allowed the analysis to compare the characteristics of high-performing posts with the overall dataset.

---

# 📱 Platform Analysis

The overall average engagement rates were:

| Platform  | Average Engagement Rate |
| --------- | ----------------------: |
| Facebook  |               **8.42%** |
| YouTube   |               **8.38%** |
| Instagram |               **8.27%** |
| LinkedIn  |               **8.21%** |

The difference between the highest and lowest platform averages is relatively small, showing that platform-level averages alone do not explain the full performance picture.

---

# 🎬 Content Type Analysis

Content performance was analyzed across:

* Reel
* Video
* Carousel
* Image

Within the high-performing segment, Reels represented a substantial share of the high-performing posts.

The analysis also compared content formats using:

* Average engagement rate
* Average reach
* Average total engagement

This helps identify content-format patterns without relying on a single metric.

---

# 📣 Campaign Analysis

Campaign categories analyzed included:

* Brand Awareness
* Community Campaign
* Educational Series
* Event Promotion
* Festival Campaign
* Product Launch
* Seasonal Campaign
* Special Campaign

Campaign performance was evaluated using engagement rate, reach, and total engagement.

This provides a multidimensional view of campaign performance rather than evaluating campaigns only by the number of posts published.

---

# ⏰ Timing Analysis

The project analyzed performance across different posting time slots and days of the week.

### Time slots analyzed

* Morning
* Late Morning
* Afternoon
* Evening
* Prime Time
* Late Night

The analysis showed relatively close engagement-rate values across the time slots within the high-performing group.

This means posting time should be treated as a variable to test rather than assumed to be the sole explanation for performance differences.

---

# 📅 Year-over-Year Analysis

High-performing posts were compared between 2025 and 2026.

| Year | High-Performing Posts | Avg. Engagement Rate | Avg. Reach | Avg. Engagement |
| ---- | --------------------: | -------------------: | ---------: | --------------: |
| 2025 |               **280** |           **13.19%** | **284.5K** |       **37.8K** |
| 2026 |               **220** |           **13.11%** | **275.5K** |       **36.3K** |

The average engagement rate remained relatively close between the two years in the high-performing segment.

---

# 📊 Power BI Dashboard

The SQL analysis was converted into an interactive Power BI dashboard.

### Dashboard structure

**5 KPI Cards**

1. Total Posts
2. Total Engagement
3. Average Reach
4. Average Engagement Rate
5. Average Total Engagement

**8 Analytical Visuals**

* Average Engagement Rate by Platform
* Average Reach by Platform
* Average Engagement by Campaign
* Average Reach by Content Type
* Average Engagement Rate by Time Slot
* Platform × Campaign analysis
* Platform × Time-Slot analysis
* Time-based performance analysis

The dashboard provides a single-page view of overall performance while allowing deeper comparisons across different dimensions.

---

# 💡 Key Insights

### 1. Strong overall engagement volume

The dataset contains approximately **5K posts** generating **101M total engagements**, with an average reach of **235.6K** per post.

### 2. High-performing posts show stronger engagement

Posts above the **12.02% engagement-rate threshold** formed a group of **500 posts**, with an average engagement rate of **13.15%**.

### 3. Reels are strongly represented among high-performing posts

Short-form video content, particularly Reels, was strongly represented in the high-performing segment.

### 4. Platform differences are relatively small

Overall platform engagement rates ranged from **8.21% to 8.42%**, a difference of only **0.21 percentage points**.

### 5. Campaign performance varies

Different campaign categories showed different engagement patterns, demonstrating the value of analyzing campaign type alongside reach and engagement.

### 6. Timing differences are relatively modest

High-performing posts showed relatively close engagement-rate values across different time slots.

### 7. High-performing performance remained relatively stable across years

The high-performing segment recorded **13.19%** average engagement rate in 2025 and **13.11%** in 2026.

---

# 📈 Business Recommendations

### 1. Continue testing short-form video

Because Reels were strongly represented among high-performing posts, future campaigns can continue testing short-form video while measuring topic, hook, length, platform, and campaign combinations.

### 2. Analyze campaign + content combinations

Instead of evaluating campaigns independently, future analysis should examine:

```text
Campaign × Content Type × Platform
```

This can reveal combinations associated with stronger engagement.

### 3. Monitor multiple performance metrics

Platform-level engagement rate should be evaluated together with:

* Reach
* Total engagement
* Content type
* Campaign
* Posting period

### 4. Treat posting time as an experiment variable

Because differences between time slots were relatively modest, future campaigns can test multiple publishing windows rather than relying on one fixed time.

### 5. Maintain a high-performance benchmark

The **12.02% engagement-rate threshold** can be used as a benchmark for monitoring high-performing content in this dataset.

As additional data becomes available, the benchmark should be recalculated to reflect changes in the dataset.

---

# ⚠️ Analytical Limitations

This analysis identifies **patterns and associations** in the available data. It does not establish that a specific platform, content type, campaign, or posting time directly causes higher engagement.

Other factors may influence performance, including:

* Content topic
* Audience composition
* Creative quality
* Followers
* Seasonality
* Campaign objectives
* External events
* Platform algorithms

Therefore, the recommendations should be validated through continued measurement and controlled content experiments.

---

# 🧠 Skills Demonstrated

### Data Analytics

* Data exploration
* KPI development
* Aggregation
* Segmentation
* Trend analysis
* Comparative analysis
* Performance benchmarking

### SQL

* `SELECT`
* `WHERE`
* `GROUP BY`
* `ORDER BY`
* `COUNT`
* `SUM`
* `AVG`
* Date-based analysis
* Conditional filtering

### Power BI

* Data connection
* Data modeling
* KPI cards
* Interactive visualizations
* Dashboard design
* Analytical storytelling

### Business Analysis

* Problem definition
* KPI identification
* Pattern identification
* Insight generation
* Data-informed recommendations
* Analytical limitations

---

# 🏁 Final Outcome

This project demonstrates an end-to-end **Data Analytics workflow**:
 **Raw Data → MySQL → SQL Analysis → Performance Segmentation → Power BI → Insights → Recommendations**

The project combines technical analysis with business interpretation to understand social media performance across multiple platforms, campaigns, content formats, and publishing periods.
