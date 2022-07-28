# dbt-Project-Ecommerce
## A **portfolio** to transform data using **dbt**. I used dbt core with Snowflake.
All process was made thinking about the best practices, using virtual enviroment, sources, CTE, and other things.
[Dataset](https://www.kaggle.com/datasets/surajjha101/stores-area-and-sales-data) is from Kaggle.  I uploaded the CSV file into Snowflake using the **snowsql CLI**. This was made to mimic an integration with other tools, such as Fivetran, ADF, etc.
Then I kicked off the transformation, setting up the snowflake, creating roles, users and granting specific permissions. Later, I connected dbt core into Snowflake and did the following outcomes.
* Models with each correct materialization
* Two Macros made by me
* ![image](https://user-images.githubusercontent.com/62630272/181628958-b40e937b-0aae-443c-b0ee-a43cdb603c2d.png)
* One singular test  made by me and others were **generic tests**
![image](https://user-images.githubusercontent.com/62630272/181629216-40a468a8-a11c-4aa4-a291-33f8deafa591.png)
* Created Source yml file.
* Parametrized my dimension of date, to pick what year I'd like to start and end. Adding parameters vars in yml file dbt_project and utilizing it in data_spine SQL Generator from dbtutils package.
* ![image](https://user-images.githubusercontent.com/62630272/181629635-fd78affa-411b-4b03-bc49-a4dcc578182b.png)
Ending the process I put this data into a schema DEV, but I could be another schema in PRODUCTION.
I consumed this Data using Power BI.
* ![Portfolio](https://user-images.githubusercontent.com/62630272/181629732-e54320c2-4f0f-4d19-ab40-9d45e36d2ae0.png)

>All commit was done in the main branch, I did not create another branch to commit the code
