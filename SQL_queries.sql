-- DATA CLEANING
-- Fixes Incorrect values 
UPDATE telecom_churn  
SET monthly_charge = NULL  
WHERE monthly_charge < 0;

--Handles Missing Values
UPDATE telecom_churn
SET total_charges = 0
WHERE total_charges IS NULL;


