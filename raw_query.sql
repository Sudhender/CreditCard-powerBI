--Creating tables> importing files from credit_card.csv
CREATE TABLE credit_card_details (
    Client_Num BIGINT,
    Card_Category VARCHAR(50),
    Annual_Fees INT,
    Activation_30_Days INT,
    Customer_Acq_Cost INT,
    Week_Start_Date DATE,
    Week_Num VARCHAR(20),
    Qtr VARCHAR(20),
    current_year INTEGER,
    Credit_Limit DECIMAl(10,2),
    Total_Revolving_Bal INT,
    Total_Trans_Amt INT,
    Total_Trans_Vol INTEGER,
    Avg_Utilization_Ratio DECIMAl(10,3),
    Use_Chip VARCHAR(10),
    Exp_Type VARCHAR(50),
    Interest_Earned DECIMAl(10,3),
    Delinquent_Acc VARCHAR(5)
);
--Importing data from credit_card.csv
COPY credit_card_details
FROM 'D:\Power_BI_Project 2\Credit card_project_2/credit_card.csv'
DELIMITER ',' 
CSV HEADER;
--Selecting data
Select count(*)
From credit_card_details;
--Creating table 2 > customer_details> importing files from customer.csv
CREATE TABLE customer_detail (
    Client_Num INT,
    Customer_Age INT,
    Gender VARCHAR(5),
    Dependent_Count INT,
    Education_Level VARCHAR(50),
    Marital_Status VARCHAR(20),
    State_cd VARCHAR(50),
    Zipcode VARCHAR(20),
    Car_Owner VARCHAR(5),
    House_Owner VARCHAR(5),
    Personal_Loan VARCHAR(5),
    Contact VARCHAR(50),
    Customer_Job VARCHAR(50),
    Income INT,
    Cust_Satisfaction_Score INT
);
--Importing data from customer.csv
COPY customer_detail
FROM 'D:\Power_BI_Project 2\Credit card_project_2\customer.csv' 
DELIMITER ',' 
CSV HEADER;
--selecting data
select *
from customer_detail;
