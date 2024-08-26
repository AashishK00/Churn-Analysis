create table stg_churn (
	Customer_ID Varchar(50) primary key,
	Gender varchar(50),	
	Age int,
	Married	varchar(50),
	State varchar(50),
	Number_of_Referrals int, 
	Tenure_in_Months	int,
	Value_Deal	varchar(50),
	Phone_Service	varchar(50),
	Multiple_Lines varchar(50),
	Internet_Service varchar(50),
	Internet_Type varchar(50),	
	Online_Security varchar(50),
	Online_Backup varchar (50),
	Device_Protection_Plan	varchar(50),
	Premium_Support varchar(50),	
	Streaming_TV	varchar(50),
	Streaming_Movies varchar(50),
	Streaming_Music	varchar(50),
	Unlimited_Data	varchar(50),
	Contract	varchar(50),
	Paperless_Billing	varchar(50),
	Payment_Method	varchar(50),
	Monthly_Charge	decimal(10,2),
	Total_Charges	decimal(10,2),
	Total_Refunds	decimal(10,2),
	Total_Extra_Data_Charges	decimal(10,2),
	Total_Long_Distance_Charges	decimal(10,2),
	Total_Revenue	decimal(10,2),
	Customer_Status	varchar(50),
	Churn_Category	varchar(50),
	Churn_Reason varchar(50)
);

copy stg_churn
from 'C:\Users\Public\PROJECT SQL\Customer Churn Project\Customer_Data.csv'
delimiter ','
csv header;
select * from stg_churn

select gender, count (gender) as Totalcount,
(count (gender) / sum(count(*)) over())*100 as Populationpercent
from stg_churn
Group by gender

select distinct internet_type
from stg_churn

select distinct gender
from stg_churn

select customer_status, count (customer_status) as Totalcount,
sum (total_revenue) as revenue,
(sum(total_revenue)/(select(sum(total_revenue))from stg_churn) *100)as revenue_percent
from stg_churn
group by customer_status

select contract, count(contract) as total_contract,
count(contract)/ (sum(count(contract)) over()) *100 as percent
from stg_churn
group by contract

select state,
	count (state) as states,
	count(state)/(sum(count(state)) over ()) *100 as percent
	from stg_churn
group by state 
order by count(state) desc

select distinct internet_type,
	count(internet_type)
from stg_churn
group by internet_type
order by count(internet_type) Asc

select
sum(case when customer_id is null then 1 else 0 end) as customer_id,
sum(case when gender is null then 1 else 0 end) as gender,
sum(case when age is null then 1 else 0 end) as age,
sum(case when married is null then 1 else 0 end) as married,
sum(case when state is null then 1 else 0 end) as state,
sum(case when number_of_referrals is null then 1 else 0 end) as number_of_referrals,
sum(case when tenure_in_months is null then 1 else 0 end) as tenure_in_months,
sum(case when value_deal is null then 1 else 0 end) as value_deal,
sum(case when phone_service is null then 1 else 0 end) as phone_service,
sum(case when multiple_lines is null then 1 else 0 end) as multiple_lines,
sum(case when internet_service is null then 1 else 0 end) as internet_service,
sum(case when internet_type is null then 1 else 0 end) as internet_type
from stg_churn

CREATE TABLE prod_churn AS
SELECT
    Customer_ID,
    Gender,
    Age,
    Married,
    State,
    Number_of_Referrals,
    Tenure_in_Months,
    CASE WHEN Value_Deal IS NULL THEN 'None' ELSE Value_Deal END AS Value_Deal,
    CASE WHEN Phone_Service IS NULL THEN 'None' ELSE Phone_Service END AS Phone_Service,
    CASE WHEN Multiple_Lines IS NULL THEN 'No' ELSE Multiple_Lines END AS Multiple_Lines,
    Internet_Service,
    CASE WHEN Internet_Type IS NULL THEN 'None' ELSE Internet_Type END AS Internet_Type,
    CASE WHEN Online_Security IS NULL THEN 'No' ELSE Online_Security END AS Online_Security,
    CASE WHEN Online_Backup IS NULL THEN 'No' ELSE Online_Backup END AS Online_Backup,
    CASE WHEN Device_Protection_Plan IS NULL THEN 'No' ELSE Device_Protection_Plan END AS Device_Protection_Plan,
    CASE WHEN Premium_Support IS NULL THEN 'No' ELSE Premium_Support END AS Premium_Support,
    CASE WHEN Streaming_TV IS NULL THEN 'No' ELSE Streaming_TV END AS Streaming_TV,
    CASE WHEN Streaming_Movies IS NULL THEN 'No' ELSE Streaming_Movies END AS Streaming_Movies,
    CASE WHEN Streaming_Music IS NULL THEN 'No' ELSE Streaming_Music END AS Streaming_Music,
    CASE WHEN Unlimited_Data IS NULL THEN 'No' ELSE Unlimited_Data END AS Unlimited_Data,
    Contract,
    Paperless_Billing,
    Payment_Method,
    Monthly_Charge,
    Total_Charges,
    Total_Refunds,
    Total_Extra_Data_Charges,
    Total_Long_Distance_Charges,
    Total_Revenue,
    Customer_Status,
    CASE WHEN Churn_Category IS NULL THEN 'Others' ELSE Churn_Category END AS Churn_Category,
    CASE WHEN Churn_Reason IS NULL THEN 'Others' ELSE Churn_Reason END AS Churn_Reason
FROM stg_churn;
select * from prod_churn




create table stg_churn (
	Customer_ID Varchar(50) primary key,
	Gender varchar(50),	
	Age int,
	Married	varchar(50),
	State varchar(50),
	Number_of_Referrals int, 
	Tenure_in_Months	int,
	Value_Deal	varchar(50),
	Phone_Service	varchar(50),
	Multiple_Lines varchar(50),
	Internet_Service varchar(50),
	Internet_Type varchar(50),	
	Online_Security varchar(50),
	Online_Backup varchar (50),
	Device_Protection_Plan	varchar(50),
	Premium_Support varchar(50),	
	Streaming_TV	varchar(50),
	Streaming_Movies varchar(50),
	Streaming_Music	varchar(50),
	Unlimited_Data	varchar(50),
	Contract	varchar(50),
	Paperless_Billing	varchar(50),
	Payment_Method	varchar(50),
	Monthly_Charge	decimal(10,2),
	Total_Charges	decimal(10,2),
	Total_Refunds	decimal(10,2),
	Total_Extra_Data_Charges	decimal(10,2),
	Total_Long_Distance_Charges	decimal(10,2),
	Total_Revenue	decimal(10,2),
	Customer_Status	varchar(50),
	Churn_Category	varchar(50),
	Churn_Reason varchar(50)
);

copy stg_churn
from 'C:\Users\Public\PROJECT SQL\Customer Churn Project\Customer_Data.csv'
delimiter ','
csv header;
select * from stg_churn

select gender, count (gender) as Totalcount,
(count (gender) / sum(count(*)) over())*100 as Populationpercent
from stg_churn
Group by gender

select distinct internet_type
from stg_churn

select distinct gender
from stg_churn

select customer_status, count (customer_status) as Totalcount,
sum (total_revenue) as revenue,
(sum(total_revenue)/(select(sum(total_revenue))from stg_churn) *100)as revenue_percent
from stg_churn
group by customer_status

select contract, count(contract) as total_contract,
count(contract)/ (sum(count(contract)) over()) *100 as percent
from stg_churn
group by contract

select state,
	count (state) as states,
	count(state)/(sum(count(state)) over ()) *100 as percent
	from stg_churn
group by state 
order by count(state) desc

select distinct internet_type,
	count(internet_type)
from stg_churn
group by internet_type
order by count(internet_type) Asc

select
sum(case when customer_id is null then 1 else 0 end) as customer_id,
sum(case when gender is null then 1 else 0 end) as gender,
sum(case when age is null then 1 else 0 end) as age,
sum(case when married is null then 1 else 0 end) as married,
sum(case when state is null then 1 else 0 end) as state,
sum(case when number_of_referrals is null then 1 else 0 end) as number_of_referrals,
sum(case when tenure_in_months is null then 1 else 0 end) as tenure_in_months,
sum(case when value_deal is null then 1 else 0 end) as value_deal,
sum(case when phone_service is null then 1 else 0 end) as phone_service,
sum(case when multiple_lines is null then 1 else 0 end) as multiple_lines,
sum(case when internet_service is null then 1 else 0 end) as internet_service,
sum(case when internet_type is null then 1 else 0 end) as internet_type
from stg_churn

CREATE TABLE prod_churn AS
SELECT
    Customer_ID,
    Gender,
    Age,
    Married,
    State,
    Number_of_Referrals,
    Tenure_in_Months,
    CASE WHEN Value_Deal IS NULL THEN 'None' ELSE Value_Deal END AS Value_Deal,
    CASE WHEN Phone_Service IS NULL THEN 'None' ELSE Phone_Service END AS Phone_Service,
    CASE WHEN Multiple_Lines IS NULL THEN 'No' ELSE Multiple_Lines END AS Multiple_Lines,
    Internet_Service,
    CASE WHEN Internet_Type IS NULL THEN 'None' ELSE Internet_Type END AS Internet_Type,
    CASE WHEN Online_Security IS NULL THEN 'No' ELSE Online_Security END AS Online_Security,
    CASE WHEN Online_Backup IS NULL THEN 'No' ELSE Online_Backup END AS Online_Backup,
    CASE WHEN Device_Protection_Plan IS NULL THEN 'No' ELSE Device_Protection_Plan END AS Device_Protection_Plan,
    CASE WHEN Premium_Support IS NULL THEN 'No' ELSE Premium_Support END AS Premium_Support,
    CASE WHEN Streaming_TV IS NULL THEN 'No' ELSE Streaming_TV END AS Streaming_TV,
    CASE WHEN Streaming_Movies IS NULL THEN 'No' ELSE Streaming_Movies END AS Streaming_Movies,
    CASE WHEN Streaming_Music IS NULL THEN 'No' ELSE Streaming_Music END AS Streaming_Music,
    CASE WHEN Unlimited_Data IS NULL THEN 'No' ELSE Unlimited_Data END AS Unlimited_Data,
    Contract,
    Paperless_Billing,
    Payment_Method,
    Monthly_Charge,
    Total_Charges,
    Total_Refunds,
    Total_Extra_Data_Charges,
    Total_Long_Distance_Charges,
    Total_Revenue,
    Customer_Status,
    CASE WHEN Churn_Category IS NULL THEN 'Others' ELSE Churn_Category END AS Churn_Category,
    CASE WHEN Churn_Reason IS NULL THEN 'Others' ELSE Churn_Reason END AS Churn_Reason
FROM stg_churn;
select * from prod_churn






