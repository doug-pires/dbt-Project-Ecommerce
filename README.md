# dbt-Project-Ecommerce
## A **portfolio** to transform data using **dbt**. I used dbt core with Snowflake.
All process was made thinking about the best practices, using virtual enviroment, sources, CTE, and other things.
[Dataset](https://www.kaggle.com/datasets/surajjha101/stores-area-and-sales-data) is from Kaggle.  I uploaded the CSV file into Snowflake using the **snowsql CLI**. This was made to mimic an integration with other tools, such as Fivetran, ADF, etc.
Then I kicked off the transformation, setting up the snowflake, creating roles, users and granting specific permissions. Later, I connected dbt core into Snowflake and did the following outcomes.
* Models with each correct materialization
* Two Macros made by me
* One singular test  made by me and others were **generic tests**
* Created Source yml file.
* Parametrized my dimension of date, to pick what year I'd like to start and end. Adding parameters vars in yml file dbt_project and utilizing it in data_spine SQL Generator from dbtutils package.

Ending the process I put this data into a schema DEV, but I could be another schema in PRODUCTION.
I consumed this Data using Power BI.

>All commit was done in the main branch, I did not create another branch to commit the code
