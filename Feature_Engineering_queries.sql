-- FEATURE ENGINEERING
-- Creates Churn Flag
CREATE VIEW churn_flag_view AS
SELECT customer_id,
    CASE 
        WHEN customer_status = 'Churned' THEN 1 
        ELSE 0 
    END AS churn_flag
FROM telecom_churn;

-- Creates Tenure Groups
CREATE VIEW tenure_group_view AS
SELECT customer_id,
CASE 
    WHEN tenure <= 12 THEN '0-1 Year'
    WHEN tenure <= 24 THEN '1-2 Years'
    WHEN tenure <= 48 THEN '2-4 Years'
    ELSE '4+ Years'
END AS tenure_group
FROM telecom_churn

-- AVG_Revenue_Per_Month
CREATE VIEW customer_value AS
select customer_id,
(total_revenue / NULLIF(tenure,0)) AS avg_revenue_per_month
FROM telecom_churn

-- Service_Count
CREATE VIEW service_count_view AS
SELECT customer_id,
(
    CASE WHEN online_security = 'Yes' THEN 1 ELSE 0 END +
    CASE WHEN online_backup = 'Yes' THEN 1 ELSE 0 END +
    CASE WHEN device_protection = 'Yes' THEN 1 ELSE 0 END +
    CASE WHEN tech_support = 'Yes' THEN 1 ELSE 0 END +
    CASE WHEN streaming_tv = 'Yes' THEN 1 ELSE 0 END +
    CASE WHEN streaming_movies = 'Yes' THEN 1 ELSE 0 END
) AS service_count
FROM telecom_churn