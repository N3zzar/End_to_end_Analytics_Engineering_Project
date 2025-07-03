# 📊 YouTube Analytics Engineering Pipeline – From Scraping to Storytelling 
> *An end-to-end analytics engineering pipeline that scrapes, stores, models, and visualises YouTube video data related to analytics engineering content — with real engagement metrics, dbt transformations, and data-driven storytelling in Hex.*  

## 🚀 Project Overview

This project showcases a full-stack analytics engineering pipeline that begins with YouTube data ingestion and ends with insights delivered through interactive dashboards.

It demonstrates my ability to build and manage modern ELT workflows using Python, PostgreSQL, dbt Core, Aiven and Hex — with version control, testing, and best practices embedded throughout the pipeline.

## 🔍 Project Preview

If you want to skip the technical details and jump straight to the insights:

[View the Final Visualization](https://app.hex.tech/01975268-573e-700f-b2a8-334ff3d11792/app/0197653c-a671-7006-8804-4c569c560481/latest)


## 🧰 Tech Stack

- **Python** – Web scraping via YouTube Data API
- **PostgreSQL** – Raw + transformed data storage
- **dbt Core** – Data cleaning, transformation, testing, documentation
- **Git + GitHub** – Version control for dbt models
- **Aiven** – Managed PostgreSQL for Hex connection
- **Hex** – Data visualization and storytelling

## 🔄 Pipeline Architecture

Below is the full pipeline flow from raw ingestion to data-driven storytelling:

![Pipeline Flow](https://github.com/N3zzar/End_to_end_Analytics_Engineering_Project/blob/main/images/Pipeline%20Flow.svg)


## dbt lineage

Below is the full DAG of the dbt model flow: ![here](https://github.com/N3zzar/End_to_end_Analytics_Engineering_Project/blob/main/images/dbt-dag.png)


## ⚙️ Pipeline Breakdown

### 1. Data Extraction
- Development done in Visual Studio Code
- Used the YouTube Data API via Python to search and retrieve videos related to dbt, SQL, Airflow, Power BI, Hex, etc.
- Extracted video and channel metadata including title, view count, like count, comment count, and publish date.
- Saved initial results to CSV.

🗂️ You can find a detailed documentation I did for ingestion [here](https://github.com/N3zzar/Youtube_data_extraction_project)  
📁 [Here is the Scraping Script](https://github.com/N3zzar/Youtube_data_project/blob/main/Code)  
📄 [Here is the Raw CSV Sample](https://github.com/N3zzar/End_to_end_Analytics_Engineering_Project/blob/main/Files/Nezzar_results_cleaned.csv)


### 2. Data loading
- Wrote a schema-matching sql script to create a postgresql table schema that matches the columns with the accompanying datatype I have in my CSV file
- Imported the CSV I downloaded into the local PostgreSQL instance table I had created

### 3. Data Transformation with dbt Core
To ensure clean, reliable, and testable data transformations, I used **dbt Core** to build out a modular analytics workflow.

Here's how dbt added value to the pipeline:
- ✅ I installed and configured dbt core in my VS code, installing the necessary extensions.
- ✅ I connected dbt core to my local PostgreSQL instance using my local credentials.
- ✅ I used `dbt debug` to ensure my connection and configuration was successful.
- ✅ **Model structure**: I separated logic into `staging`, `intermediate`, and `marts` layers using the modern ELT pattern.
- ✅ **Testing**: Applied built-in dbt tests (e.g. `not_null`, `unique`, `accepted values` and `relationship integrity`) to enforce data quality rules in my `schema.yml` file.
      I also wrote custom singular test in my `tests` folder where I ensured my published date was not in the future and also overly long video titles.
- ✅ **Documentation**: Used `schema.yml` to provide column-level descriptions in my final table, provide documentation at the model and source level. Used `dbt docs generate` and `dbt docs serve` to generate model lineage for better transparency. Included a separate documentation for unique values in my date column as an `md` file which was referenced in my `schema.yml` file.
- ✅ Exposure: This was just to document where and how my models were consumed.
- ✅ **Reusability**: Built Jinja-powered macros in my `macros` folder that identified viral videos based on engagement rate thresholds, which was as an application of the DRY principles.
- ✅ In order to do adhoc analysis, I created a CSV file in my `seeds` folder that contained some static benchmarks data that I can evaluate against.
- ✅ In order to test what I had created in my `seeds` folder, I had to create a .sql file that selects videos that were greater than the engagement rate threshold in my `analyses` folder. This was a prototype SQL logic to ensure it works before using it in dbt models.
- ✅ **Version control**: Integrated with GitHub for full change tracking across the entire dbt project.
- ✅ I hosted my documentation on netlify app for accces.

📂 Explore the dbt project:
- [`models/staging/`](./models/staging) – Raw cleaning + formatting (This was materialized as view)
- [`models/intermediate/`](./models/intermediate)- Joins and enrichment (This was materialized as view)
- [`models/marts/`](./models/marts) – Business-ready table  (This was materialized as table)
- [`schema.yml`](./models/schema.yml) – Tests + documentation
- [`exposure`](./models/exposure.yml) - Defined downstream dashboard dependencies for data governance and impact tracking purpose.
- [`date_column documentation`](./models/date_documentation.md)
- [`tests`](./tests) - for singular testing
- [`macros`](./macros) – Custom and reusable logic like `is_viral()`
- [`seeds`](./seeds) - Reference threshold
- [`analyses`](./analyses) - Exploratory SQL and adhoc analysis

🧾 [View the generated dbt documentation locally](https://luxury-pixie-36f938.netlify.app/)

### 4. Cloud Integration
- Doing `dbt run` would then compile everything back to my local postgre.
- Final ```marts``` table was exported from local PostgreSQL and uploaded to Aiven PostgreSQL, a managed cloud database.
- Aiven was now connected to **Hex** for dashboarding

### 5. Data Storytelling
Used Hex to build interactive visuals and tell the story behind the data.

📈 [View Final Hex Dashboard](https://app.hex.tech/01975268-573e-700f-b2a8-334ff3d11792/app/0197653c-a671-7006-8804-4c569c560481/latest)


## 💡 Key Insights
```
- Identified top-performing educational content on analytics engineering
- Discovered that videos with high engagement often feature [e.g. dbt vs Airflow comparisons]
- Found that engagement rate (likes + comments / views) was a more reliable indicator of virality than view count alone.
```

📊 See full breakdown available in the [Hex dashboard](https://app.hex.tech/01975268-573e-700f-b2a8-334ff3d11792/app/0197653c-a671-7006-8804-4c569c560481/latest)



## Challenges
```
- I was new to dbt so I was learning and implementing almost at the same time.
- I made it a goal to implement best practices so I was always thinking of how best I can do this.
- Encountered issues with conflicting dbt-utils packages due to VS Code extensions
- Switching from MySQL to PostgreSQL introduced a learning curve in SQL syntax and management
```

## 📌 Learnings & Next Steps

This project helped me practice:
```
- Designing end-to-end ELT pipelines
- Navigating PostgreSQL. I've been used to MySQL.
- Working with dbt core. (I feel I would have an easy time adapting to dbt cloud)
- Ensuring data quality with dbt Core
- Implementing dbt best practices (naming convention, sources, staging, testing, structure, documentation)
- Connecting to GitHub for version control analytics
- Using Hex to bridge insights and storytelling
- Installing a cloud storage on PgAdmin
```

## 🔮 Future Improvements
```
- Automate scraping on a schedule
- Add NLP on video titles/descriptions for topic clustering
- Leverage dbt source freshness 
- Deploy on Airbyte + dbt Cloud
```

## 🙏 Acknowledgments

> "Thanks to my mentor whose guidance helped me structure my dbt models and think critically about metric definitions.”


## 🔗 Useful Links

- [Hex Dashboard](https://app.hex.tech/your-dashboard-link)
- [Project Walkthrough on Medium (if available)](https://medium.com/your-link)





### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
