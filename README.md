# 📊 YouTube Analytics Engineering Pipeline – From Scraping to Storytelling 
> *An end-to-end analytics engineering pipeline that scrapes, stores, models, and visualizes YouTube video data — with real engagement metrics, dbt transformations, and an interactive dashboard.*  

## 🚀 Project Overview

This project demonstrates an end-to-end analytics engineering workflow where I scraped YouTube videos related to analytics engineering tools and concepts, transformed the data using dbt Core, and visualised the insights in Hex.

The pipeline moves from raw data to insights, showcasing skills in data ingestion, transformation, testing, version control, orchestration, and visualization.

## 🔍 Project Preview

It is alot of documentation and may be too technical for you, so here's a shortcut to view the story:

[Final Visualization](https://app.hex.tech/01975268-573e-700f-b2a8-334ff3d11792/app/0197653c-a671-7006-8804-4c569c560481/latest)


## 🧰 Tech Stack

- **Python** – Web scraping via YouTube Data API
- **PostgreSQL** – Raw + transformed data storage
- **dbt Core** – Data cleaning, transformation, testing, documentation
- **Git + GitHub** – Version control for dbt models
- **Aiven** – Managed PostgreSQL for Hex connection
- **Hex** – Data visualization and storytelling

## 🔄 Pipeline Architecture

Below is the full pipeline flow from data ingestion to dashboard:

![Pipeline Flow](https://github.com/N3zzar/End_to_end_Analytics_Engineering_Project/blob/main/images/Pipeline%20Flow.svg)


## Project lineage

Below is the DAG lineage ![here](https://github.com/N3zzar/End_to_end_Analytics_Engineering_Project/blob/main/images/dbt-dag.png)


## ⚙️ Pipeline Breakdown

### 1. Data Extraction
- Used YouTube Data API + Python to search for relevant videos
- Extracted metadata: title, views, likes, comments, publish date, etc.
- Saved to CSV for initial backup

📁 [Scraping Script](https://github.com/N3zzar/Youtube_data_project/blob/main/Code)
📄 [Raw CSV Sample](https://github.com/N3zzar/End_to_end_Analytics_Engineering_Project/blob/main/Files/Nezzar_results_cleaned.csv)

### 2. Data loading
- Uploaded CSV into local PostgreSQL instance

### 3. Data Transformation with dbt Core

To ensure clean, reliable, and testable data transformations, I used **dbt Core** to build out a modular analytics workflow. Here's how dbt added value to the pipeline:

- ✅ **Model structure**: I separated logic into `staging` and `marts` layers using the modern ELT pattern.
- ✅ **Source freshness**: Defined and tested raw sources from my PostgreSQL database.
- ✅ **Testing**: Applied built-in dbt tests (e.g. `not_null`, `unique`) to enforce data quality rules.
- ✅ **Version control**: Integrated with GitHub for full change tracking and collaboration readiness.
- ✅ **Documentation**: Used dbt’s `docs generate` to create browsable documentation with lineage graphs.
- ✅ **Reusability**: Built Jinja-powered macros for flexible metric logic (e.g., identifying viral videos based on engagement rate thresholds).

📂 Explore the dbt project:
- [`models/staging/`](./models/staging) – Raw cleaning + formatting  
- [`models/marts/`](./models/marts) – Business-ready tables  
- [`schema.yml`](./models/schema.yml) – Tests + documentation  
- [`macros/`](./macros) – Custom logic like `is_viral()`  

🧾 [View the generated dbt documentation locally](https://luxury-pixie-36f938.netlify.app/)

### 4. Cloud Integration
- Final model table sent to **Aiven PostgreSQL**
- Aiven connected to **Hex** for live dashboards

### 5. Data Storytelling

📈 [View Final Hex Dashboard](https://app.hex.tech/01975268-573e-700f-b2a8-334ff3d11792/app/0197653c-a671-7006-8804-4c569c560481/latest)


## 💡 Key Insights

- Identified top-performing educational content on analytics engineering
- Discovered that videos with high engagement often feature [e.g. dbt vs Airflow comparisons]
- Engagement rate, not just views, is a better indicator of virality

📊 See full analysis in the [Hex dashboard](https://app.hex.tech/01975268-573e-700f-b2a8-334ff3d11792/app/0197653c-a671-7006-8804-4c569c560481/latest)



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
