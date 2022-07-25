
USE ECOMMERCE.RAW;
CREATE OR REPLACE STAGE ECOMMERCE.RAW.ecommerce_stage;


CREATE OR REPLACE FILE FORMAT ECOMMERCE.RAW.CSV_ECOMMERCE
 COMPRESSION = 'AUTO' 
 FIELD_DELIMITER = ',' 
 RECORD_DELIMITER = '\n' 
 FIELD_OPTIONALLY_ENCLOSED_BY = '\042' 
 TRIM_SPACE = FALSE 
 ERROR_ON_COLUMN_COUNT_MISMATCH = FALSE
 ESCAPE = 'NONE' 
 ESCAPE_UNENCLOSED_FIELD = '\134' 
 DATE_FORMAT = 'mm/dd/yyyy' 
 TIMESTAMP_FORMAT = 'AUTO' 
 NULL_IF = ('NULL', 'null', '\N') 
 COMMENT = 'parse comma-delimited, double-quoted data';

-- Commands done by CLI snowsql
put file://C:\Users\dpire\Desktop\archive\Stores.csv @ECOMMERCE.RAW.ecommerce_stage;




put file:///home/dpiresunix/Coursedbt/Datasets/Ecommerce/Ecommerce.csv @ecommerce_stage;
 
SELECT 
  c.$1, 
  c.$2, 
  c.$3,
  c.$4
FROM @ecommerce_stage (file_format => CSV_ECOMMERCE ) c LIMIT 10;
------------------------------------------

-- Creating table into Supermarket data in Schema Raw, table named Stores
-- It could be any tool for Data Integration such as Fivetran, ADF and so on.
USE ECOMMERCE.RAW;

CREATE OR REPLACE TABLE ECOMMERCE_RAW (
ID DOUBLE,
Warehouse_block VARCHAR,
Mode_of_Shipment VARCHAR,
Customer_care_calls INTEGER,
Customer_rating DOUBLE,
Cost_of_the_Product VARCHAR,
Prior_Purchases INTEGER,
Product_importance VARCHAR,
GENDER VARCHAR,
Discount_offered DOUBLE,
Weight_in_gms DOUBLE,
Reached_on_Time_Y_N INTEGER
) ;

COPY INTO ECOMMERCE FROM @ECOMMERCE.RAW.ecommerce_stage
FILE_FORMAT = (type = 'CSV' skip_header = 1
FIELD_OPTIONALLY_ENCLOSED_BY = '"')
ON_ERROR = 'skip_file';


 
