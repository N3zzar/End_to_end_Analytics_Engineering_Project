# 📊 YouTube Analytics Engineering Pipeline – From Scraping to Storytelling
> *An end-to-end analytics engineering pipeline that scrapes, stores, models, and visualizes YouTube video data — with real engagement metrics, dbt transformations, and an interactive dashboard.*  


## 🚀 Project Overview

This project demonstrates an end-to-end analytics engineering workflow where I scraped YouTube videos related to analytics engineering tools and concepts, transformed the data using dbt Core, and visualised the insights in Hex.

The pipeline moves from raw data to insights, showcasing skills in data ingestion, transformation, testing, version control, orchestration, and visualization.

## 🔍 Project Preview

It is alot of documentation and may be too technical for you, so here's a quick look at the final dashboard:

![dashboard-preview](images/dashboard-preview.png)


## 🧰 Tech Stack

- **Python** – Web scraping via YouTube Data API
- **PostgreSQL** – Raw + transformed data storage
- **dbt Core** – Data cleaning, transformation, testing, documentation
- **Git + GitHub** – Version control for dbt models
- **Aiven** – Managed PostgreSQL for Hex connection
- **Hex** – Data visualization and storytelling

## 🔄 Pipeline Architecture

Below is the full pipeline flow from data ingestion to dashboard:

![Pipeline Flow]((https://github.com/N3zzar/End_to_end_Analytics_Engineering_Project/blob/main/images/Pipeline%20Flow.svg)

## Project lineage

You can view my documentation [here](https://luxury-pixie-36f938.netlify.app/)


## ⚙️ Pipeline Breakdown

### 1. Data Collection
- Used YouTube Data API + Python to search for relevant videos
- Extracted metadata: title, views, likes, comments, publish date, etc.
- Saved to CSV for initial backup

📁 [Scraping Script](./scripts/youtube_scraper.py)  
📄 [Raw CSV Sample](./data/youtube_raw_data.csv)

### 2. Data Storage
- Uploaded CSV into local PostgreSQL instance

### 3. Data Transformation with dbt Core
- Created `staging` and `marts` layers
- Applied tests and documentation
- Connected dbt to GitHub for source control

📂 `models/` contains folders for:
- `staging/`
- `marts/`
- `schema.yml`

🧾 [View dbt docs locally](./dbt_docs/index.html)

### 4. Cloud Integration
- Final model table sent to **Aiven PostgreSQL**
- Aiven connected to **Hex** for live dashboards

📈 [View Final Hex Dashboard](https://app.hex.tech/your-dashboard-link)

## 💡 Key Insights

- Identified top-performing educational content on analytics engineering
- Discovered that videos with high engagement often feature [e.g. dbt vs Airflow comparisons]
- Engagement rate, not just views, is a better indicator of virality

📊 See full analysis in the [Hex dashboard](https://app.hex.tech/your-dashboard-link)



## 📌 Learnings & Next Steps

This project helped me practice:
- Designing end-to-end ELT pipelines
- Implementing dbt best practices (sources, staging, testing)
- Using Hex to bridge insights and storytelling

### 🔮 Future Improvements
- Automate scraping on a schedule
- Add NLP on video titles/descriptions for topic clustering
- Deploy on Airbyte + dbt Cloud


## 🙏 Acknowledgments

Thanks to [Mentors, YouTube Channels, or Tools] that inspired this project.




## 🔗 Useful Links

- [Hex Dashboard](https://app.hex.tech/your-dashboard-link)
- [Project Walkthrough on Medium (if available)](https://medium.com/your-link)














### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices



