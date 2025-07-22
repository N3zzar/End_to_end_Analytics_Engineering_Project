
Transformation schema for raw data - Done
Github actions for deploying into production environment (how to use github action to orchestrate dbt runs)
Add CI and deployment jobs.
workflow folder within dbt folder
use variables within dbt_project.yml to set up different environments
Cron within dbt project to schedule the dbt runs


Create schema (custom macro) to create schema if it does not exist




So I have been able to figure out that it does get the raw data in the source in my schema.yml (schema and table, not sure about the name)
The materialization destination works but it is prefixing it with public_ (maybe it is the schema mentioned in my profile.yml file)


Name: public, schema:public yields public_public and public_analytics
Change the name and see what happens
Try changing the schema to analytics in the profiles.yml file


The source (where it is getting the raw data) is been configured in the schema.yml file
The source in the schema.yml must actually point to the name of the schema in my warehouse
The name in the schema.yml can be the same thing with the source but if it is different, it must be reflected in the {{  source('name', 'table_name') }}
What you specify for destination for your materialization in your project.yml will be created itself if it was not in your warehouse before.
If you want your layers to exist in multiple schema then you have to use generate_schema_name, but if it is just one, then there is no need for +schema in your project.dbt_yml (your schema in your profiles.yml is enough)




I learnt how to override default materialization
How to use generate_schema_name


