# 📊 YouTube Analytics Engineering Pipeline – From Scraping to Storytelling 
> *An end-to-end analytics engineering pipeline that scrapes, stores, models, and visualises YouTube video data — with real engagement metrics, dbt transformations, and an analysis that tells stories.*  

## 🚀 Project Overview

This project demonstrates an end-to-end analytics engineering workflow where I scraped YouTube videos related to analytics engineering tools and concepts, transformed the data using dbt Core, and visualised the insights in Hex.

The pipeline moves from raw data to insights, showcasing skills in data ingestion, transformation, testing, version control, orchestration, and visualisation.

## 🔍 Project Preview

It is alot of documentation and may be too technical for you, so here's a shortcut to view the final visualization:

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
- I did all these in Visual Studio Code as my IDE (Integrated development environment)
- Saved to CSV for initial backup

You can find the separate documentation I did in another folder [here](https://github.com/N3zzar/Youtube_data_extraction_project)

📁 [Scraping Script](https://github.com/N3zzar/Youtube_data_project/blob/main/Code)
📄 [Raw CSV Sample](https://github.com/N3zzar/End_to_end_Analytics_Engineering_Project/blob/main/Files/Nezzar_results_cleaned.csv)


### 2. Data loading
- Wrote a script to create the schema that reflects the columns and also fitted the datatype I have in my CSV file and then ran it.
- Imported the CSV I downloaded into the local PostgreSQL instance table I had created

### 3. Data Transformation with dbt Core

To ensure clean, reliable, and testable data transformations, I used **dbt Core** to build out a modular analytics workflow. Here's how dbt added value to the pipeline:
- ✅ I installed and configured dbt core in my VS code, installing the necessary extensions.
- ✅ I connected dbt core to my local PostgreSQL instance using my local credentials.
- ✅ **Model structure**: I separated logic into `staging`, `intermediate`, and `marts` layers using the modern ELT pattern.
- ✅ **Testing**: Applied built-in dbt tests (e.g. `not_null`, `unique`, `accepted values` and `relationship integrity`) to enforce data quality rules. I also did custom logic test in my marts where I ensured my published_date was not greater than my current date. I also ensured my video title column was not null and not more than 500 characters.
- ✅ **Version control**: Integrated with GitHub for full change tracking and collaboration readiness.
- ✅ **Documentation**: Used dbt’s `docs generate` to create browsable documentation with lineage graphs. Included documentation for unique values in some columns. I also 
- ✅ **Reusability**: Built Jinja-powered macros for flexible metric logic (e.g., identifying viral videos based on engagement rate thresholds).
- ✅ In order to do adhoc analysis, I created a CSV file in my seeds folder that contained some benchmarks that I can evaluate against.
- ✅ In order to test what I had created in my seeds folder, I had to write a .sql file that selects videos that were greater than the engagement rate threshold.

📂 Explore the dbt project:
- [`models/staging/`](./models/staging) – Raw cleaning + formatting (This was materialized as view)
- [`models/intermediate/`](https://github.com/N3zzar/End_to_end_Analytics_Engineering_Project/tree/main/models/intermediate) (This was materialized as view)
- [`models/marts/`](./models/marts) – Business-ready tables  (This was materialized as table)
- [`schema.yml`](./models/schema.yml) – Tests + documentation
- [`exposure/`](./models/exposure.yml) -
- [`date_column documentation`](./models/date_documentation.md)
- [`tests`](./tests) 
- [`macros/`](./macros) – Custom logic like `is_viral()`
- [`seeds`](./seeds)
- [`analyses`](./analyses)

🧾 [View the generated dbt documentation locally](https://luxury-pixie-36f938.netlify.app/)

### 4. Cloud Integration
- Doing dbt run would then compile everything back to my local postgre.
- I exported the csv file that was created in my marts layer which was materiaized as a table while everything else was materialized as view.
- Final table was then imported to a table which was created on **Aiven PostgreSQL** that have been configured on PgAdmin using my Aiven credentials.
- Aiven was now connected to **Hex** for live dashboards

### 5. Data Storytelling

📈 [View Final Hex Dashboard](https://app.hex.tech/01975268-573e-700f-b2a8-334ff3d11792/app/0197653c-a671-7006-8804-4c569c560481/latest)


## 💡 Key Insights

- Identified top-performing educational content on analytics engineering
- Discovered that videos with high engagement often feature [e.g. dbt vs Airflow comparisons]
- Engagement rate, not just views, is a better indicator of virality

📊 See full analysis in the [Hex dashboard](https://app.hex.tech/01975268-573e-700f-b2a8-334ff3d11792/app/0197653c-a671-7006-8804-4c569c560481/latest)



## Challenges
- I was new to dbt so I was learning and implementing almost at the same time.
- I made it a goal to implement best practices so I was always thinking of how best I can do this.
- At some point when I ran dbt run and dbt compile, it wasn't working because two utils package were being installed at the same time. Took a long time to fix. It was caused by one of the extensions I installed.
- 

## 📌 Learnings & Next Steps

This project helped me practice:
- Designing end-to-end ELT pipelines
- Navigating PostgreSQL. I've been used to MySQL.
- Working with dbt core. (I feel I would have an easy time adapting to dbt cloud)
- Implementing dbt best practices (sources, staging, testing, structure, documentation)
- Connecting to GitHub for version control
- Using Hex to bridge insights and storytelling
- Installing a cloud storage on PgAdmin

### 🔮 Future Improvements
- Automate scraping on a schedule
- Add NLP on video titles/descriptions for topic clustering
- Deploy on Airbyte + dbt Cloud


## 🙏 Acknowledgments

Thanks to my mentor who guided me through this project.




## 🔗 Useful Links

- [Hex Dashboard](https://app.hex.tech/your-dashboard-link)
- [Project Walkthrough on Medium (if available)](https://medium.com/your-link)














### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
