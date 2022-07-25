-- DBA Or Admin to give access
-- Use an admin role to do the STEPS.
USE ROLE ACCOUNTADMIN;

-- Create ROLE transform
CREATE ROLE IF NOT EXISTS TRANSFORM;

-- Create a USER to manipulate this data
CREATE USER IF NOT EXISTS DevDouglas
PASSWORD= '##'
LOGIN_NAME= 'DevDouglas' -- Login to connect with CLI
MUST_CHANGE_PASSWORD=FALSE
DEFAULT_WAREHOUSE='COMPUTE_WH'
DEFAULT_ROLE='transform'
DEFAULT_NAMESPACE='ECOMMERCE.RAW'
COMMENT='Dev Douglas Pires used for data transformation';

-- Grant the role transform for the Dev
GRANT ROLE TRANSFORM TO USER DevDouglas;

-- Create our database and schemas for the Supermarket
CREATE DATABASE IF NOT EXISTS ECOMMERCE;
CREATE SCHEMA IF NOT EXISTS ECOMMERCE.RAW;


-- Set up permissions to role `transform`
GRANT ALL ON WAREHOUSE COMPUTE_WH TO ROLE transform; 
GRANT ALL ON DATABASE ECOMMERCE to ROLE transform;
GRANT ALL ON ALL SCHEMAS IN DATABASE ECOMMERCE to ROLE transform;
GRANT ALL ON FUTURE SCHEMAS IN DATABASE ECOMMERCE to ROLE transform;
GRANT ALL ON ALL TABLES IN SCHEMA ECOMMERCE.RAW to ROLE transform;
GRANT ALL ON FUTURE TABLES IN SCHEMA ECOMMERCE.RAW to ROLE transform;


