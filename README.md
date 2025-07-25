# 📊 YouTube Analytics Engineering Pipeline – From Scraping to Storytelling 
> *An end-to-end analytics engineering pipeline that scrapes, stores, models, and visualises YouTube video data related to analytics engineering content — with real engagement metrics, dbt transformations, and data-driven storytelling in Hex.*  

## 🚀 Project Overview

This project showcases a full-stack analytics engineering pipeline that begins with YouTube data ingestion and ends with insights delivered through interactive dashboards.

It demonstrates my ability to build and manage modern ELT workflows using Python, PostgreSQL, dbt Core, Aiven and Hex — with version control, testing, and best practices embedded throughout the pipeline.

## 🔍 Project Preview

The dashboard reveals how content creators in the analytics engineering space perform on YouTube — with metrics like engagement rate, virality, and topic breakdowns.

If you want to skip the technical details and jump straight to the insights:

[🎯 View the Final Visualization](https://app.hex.tech/01975268-573e-700f-b2a8-334ff3d11792/app/0197653c-a671-7006-8804-4c569c560481/latest)


## 🧰 Tech Stack

- **🐍 Python** – Web scraping via YouTube Data API
- **🐘 PostgreSQL** – Raw + transformed data storage
- **🛠️ dbt Core** – Data cleaning, transformation, testing, documentation
- **🔁 Git + GitHub** – Version control for dbt models
- **☁️ Aiven** – Managed PostgreSQL for Hex connection
- **📊 Hex** – Data visualization and storytelling
- **📈 Mermaid** - Diagram for workflow visualization
- **🤖 Github Actions** - Orchestration and Deployment into Production

## 🔄 Pipeline Architecture

Below is the full pipeline flow from raw ingestion to data-driven storytelling:

![Full Pipeline Flow showing ingestion, transformation, and visualization stages](https://github.com/N3zzar/End_to_end_Analytics_Engineering_Project/blob/main/images/Pipeline%20Flow.svg)


## 🧬 dbt lineage

The dbt DAG illustrates the flow of transformations - From raw staging to final business-ready marts: ![here](https://github.com/N3zzar/End_to_end_Analytics_Engineering_Project/blob/main/images/dbt-dag.png)


## ⚙️ Pipeline Breakdown

### 1️⃣ Data Extraction
- Development done in Visual Studio Code
- Used the YouTube Data API via Python to search and retrieve videos related to dbt, SQL, Airflow, Power BI, Hex, etc.
- Extracted video and channel metadata including title, view count, like count, comment count, and publish date.
- Saved initial results to CSV.

🗂️ [Here is a detailed documentation for the ingestion process](https://github.com/N3zzar/Youtube_data_extraction_project)  
📜 [Here is the Scraping Script](https://github.com/N3zzar/Youtube_data_project/blob/main/Code)  
📄 [Here is the Raw CSV Sample](https://github.com/N3zzar/End_to_end_Analytics_Engineering_Project/blob/main/Files/Nezzar_results_cleaned.csv)


### 2️⃣ Data storage and loading
- Wrote a schema-matching sql script to create a PostgreSQL table schema that matches the columns with the accompanying datatype I have in my CSV file
- Imported the raw CSV I downloaded into aiven (a managed cloud PostgreSQL instance) database I created
- My raw data was configured to be stored in another schema within my aiven database. This was to allow that I could go back to it anytime and also that the public doesnt have access to it.

### 3️⃣ Data Transformation with dbt Core
To ensure clean, reliable, and testable data transformations, I used **dbt Core** to build out a modular analytics workflow.

Here's how dbt added value to the pipeline:
- ✅ I installed and configured dbt core in my Virtual studio code, installing the necessary extensions.
- ✅ I connected dbt core to my aiven PostgreSQL instance using my aiven credentials.
- ✅ I used `dbt debug` to ensure my connection and configuration was successful.
- ✅ **Model structure**: I separated logic into `staging`, `intermediate`, and `marts` layers using the modern ELT pattern to support modularity, testing and long-term scalability.
- ✅ My `staging` layer and `intermediate` layer went to my `public` schema and my marts layer went to my `analytics` schema`
- ✅ **Testing**: Applied built-in dbt tests (e.g. `not_null`, `unique`, `accepted values` and `relationship integrity`) to enforce data quality rules in my `schema.yml` file.
      I also wrote custom singular test in my `tests` folder where I ensured my published date was not in the future and checked for overly long video titles.
- ✅ **Documentation**: Used `schema.yml` to provide column-level descriptions in my final table, provide documentation at the model and source level. Used `dbt docs generate` and `dbt docs serve` to generate model lineage for better transparency. Included a separate documentation for unique values in my date column as an `md` file, which was then referenced in my `schema.yml` file.
- ✅ Exposure: This was to document where and how my models were consumed.
- ✅ **Reusability**: Built Jinja-powered macros in my `macros` folder that identified viral videos based on engagement rate thresholds, which was an application of the DRY(don't repeat yourself) principles.
- ✅ In order to do adhoc analysis, I created a CSV file in my `seeds` folder that contained some static benchmark data that I can evaluate against.
- ✅ In order to test what I had created in my `seeds` folder, I had to create a .sql file in my `analyses` folder that selects videos that were greater than the engagement rate threshold. This was a prototype SQL logic to ensure it works before using it in dbt models.
- ✅ **Version control**: Integrated with GitHub for full change tracking across the entire dbt project.
- ✅ I hosted my documentation on `Netlify` App for public access.

📂 Explore the dbt project:
- [`models/staging/`](./models/staging) – Raw cleaning + formatting (This was materialized as a view)
- [`models/intermediate/`](./models/intermediate)- Joins and enrichment (This was materialised as a view)
- [`models/marts/`](./models/marts) – Business-ready table  (This was materialised as a table)
- [`schema.yml`](./models/schema.yml) – Tests + documentation
- [`exposure`](./models/exposure.yml) - Defined downstream dashboard dependencies for data governance and impact tracking purposes.
- [`date_column documentation`](./models/date_documentation.md)
- [`tests`](./tests) - for singular testing
- [`macros`](./macros) – Custom and reusable logic like `is_viral()`
- [`seeds`](./seeds) - Reference threshold
- [`analyses`](./analyses) - Exploratory SQL and adhoc analysis

🌐 [Hosted documentation on netlify](https://luxury-pixie-36f938.netlify.app/)

### 4️⃣ Cloud-Native Database with Aiven

- All dbt models read from and write directly to Aiven — eliminating local storage and making the pipeline production-ready.
- This enabled easier deployment, better collaboration, and integration with other tools like Hex for visualization.

### 5️⃣ Data Storytelling
Used Hex to build interactive visuals and tell the story behind the data.

📈 [View Final Hex Dashboard](https://app.hex.tech/01975268-573e-700f-b2a8-334ff3d11792/app/0197653c-a671-7006-8804-4c569c560481/latest)

### 6️⃣ Production Orchestration with GitHub Actions

To automate production deployment and ensure continuous data freshness, I implemented a CI/CD pipeline using GitHub Actions. This workflow resolute dependency, runs dbt transformations, generates documentation, and deploys artifacts on every push, pull request, manual run and scheduled run — fully integrated with `Aiven` and `Netlify`.

🔑 Key Features of the Workflow:

- 🛎 Triggers:

      - On push to `main`

      - On pull requests to main

      - Scheduled run every day at midnight UTC (cron: '0 0 * * *')

      - Manual trigger via workflow_dispatch

- 🧱 Environment Setup:

      - Installs Python 3.11, dbt Core, and dbt-postgres

      - Installs Netlify CLI for deploying dbt docs

      - Sets up a secure ~/.dbt/profiles.yml using GitHub Secrets to connect to Aiven PostgreSQL

- 🚀 Workflow Steps:

      - ✅ dbt deps: Pulls project dependencies

      - ✅ dbt build: Runs all models and tests in one command

      - ✅ dbt test: Executes standalone test suite (unit tests, schema tests, custom tests)

      - ✅ dbt docs generate: Builds interactive model documentation

      - ✅ Deploys docs to Netlify using site ID and auth token

      - ✅ Uploads logs and the entire target/ directory as artifacts for traceability
  
      - ✅ Sends real-time Slack notifications on workflow status with commit metadata

📂 [View the GitHub Actions Workflow](./.github/workflows/dbt-deploy.yml)
📸 [View the workflow diagram](https://github.com/N3zzar/End_to_end_Analytics_Engineering_Project/blob/main/images/dbt%20Config%20Workflow.png)

> 💡 Why This Matters:  
> Switching to Aiven and adding GitHub Actions moved the pipeline from a local prototype to a cloud-native, automated, and production-grade workflow.


## 💡 Key Insights

  - Identified top-performing educational content on analytics engineering
  - Discovered that videos with high engagement often feature [e.g. dbt vs Airflow comparisons]
  - Found that engagement rate (likes + comments / views) was a more reliable indicator of virality than view count alone.

Here are some snippets:

![YtChannels](https://github.com/N3zzar/End_to_end_Analytics_Engineering_Project/blob/main/images/Youtube%20Channels.png)
![WordCloud](https://github.com/N3zzar/End_to_end_Analytics_Engineering_Project/blob/main/images/Word%20cloud%20screenshot.png)


📊 See full breakdown available in the [Hex dashboard](https://app.hex.tech/01975268-573e-700f-b2a8-334ff3d11792/app/0197653c-a671-7006-8804-4c569c560481/latest)


## 🧗 Challenges Faced
```
- This was my first time working with dbt so I was learning and implementing almost at the same time.
- I made it a goal to implement best practices so I was always thinking of how best I can do this.
- Encountered issues with conflicting dbt-utils packages due to VS Code extensions
- Switching from MySQL to PostgreSQL introduced a learning curve in SQL syntax and management
- Took me multiple failed workflow runs before I could arrive at the correct workflow file
```

## 📌 Learnings

This project helped me practice:
```
- Designing end-to-end ELT pipelines
- Navigating PostgreSQL. I've been used to MySQL.
- Working with dbt core. (I feel I would have an easy time adapting to dbt cloud)
- Ensuring data quality with dbt Core
- Implementing dbt best practices (naming convention, sources, staging, testing, structure, documentation)
- Advanced dbt Core usage (docs, tests, macros, exposures)
- Connecting to GitHub for version control
- Using Hex to bridge insights and storytelling
- Installing a cloud storage on PgAdmin
- Working within Aiven cloud
- Using GitHub Actions for CI/CD orchestration, deployment into production environment and notification.
```

## 🔮 Future Improvements
```
- Automate scraping on a schedule via Airflow or Github actions
- Add NLP on video titles/descriptions for topic clustering
- Add a cron-based freshness test in dbt for source staleness
- Deploy on Airbyte + dbt Cloud
```

## 🙏 Acknowledgments

Thanks to my mentor, whose guidance and motivation helped me structure my dbt models, implement best practices, and deploy into production.


## 🔗 Useful Links

- 🔍 [Hex Dashboard](https://app.hex.tech/01975268-573e-700f-b2a8-334ff3d11792/app/0197653c-a671-7006-8804-4c569c560481/latest)
- ✍️ [Project Walkthrough on Medium](https://medium.com/@ebenezertomoye/hex-in-action-data-storytelling-from-scraped-analytical-engineering-related-youtube-videos-to-006495655a70)



### 📚 Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
