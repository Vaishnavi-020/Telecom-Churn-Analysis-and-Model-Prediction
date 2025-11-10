create database Telecom_Churn;

use Telecom_Churn;

SET SQL_SAFE_UPDATES = 0;
ALTER TABLE telecom_users ADD COLUMN heavy_user BOOLEAN;
UPDATE telecom_users SET heavy_user = (`Total Minutes` > 500);

Alter Table telecom_users
Drop Column heavy_user;

alter table telecom_users
Drop Column total_minutes;

select * from telecom_users;

-- Overall churn KPI view
CREATE VIEW v_churn_kpis AS
SELECT
  COUNT(*) AS total_customers,
  SUM(CASE WHEN `Churn`='True' THEN 1 ELSE 0 END) AS churned_customers,
  ROUND(100.0 * SUM(CASE WHEN `Churn`='True' THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate_percent
FROM telecom_users;

-- Show full tables
-- where table_type='View';

select * from v_churn_kpis;

-- Churn by segment (international plan, voice mail plan)

CREATE VIEW v_churn_by_plan AS
SELECT
  `International plan`,
  `Voice mail plan`,
  COUNT(*) AS customers,
  SUM(CASE WHEN `Churn`='True' THEN 1 ELSE 0 END) AS churned_customers,
  ROUND(100.0 * SUM(CASE WHEN `Churn`='True' THEN 1 ELSE 0 END) / COUNT(*),2) AS churn_rate_percent
FROM telecom_users
GROUP BY `International plan`, `Voice mail plan`;

-- select * from churn_by_plan;

-- Churn by area code and state

CREATE VIEW v_churn_by_geo AS
SELECT
  `Area code`,
  `State`,
  COUNT(*) AS customers,
  SUM(CASE WHEN `Churn`='True' THEN 1 ELSE 0 END) AS churned_customers,
  ROUND(100.0 * SUM(CASE WHEN `Churn`='True' THEN 1 ELSE 0 END) / COUNT(*),2) AS churn_rate_percent
FROM telecom_users
GROUP BY `Area code`, `State`;

select * from churn_by_geo;

-- Drivers: customer service calls vs churn

CREATE VIEW v_custsvc_churn AS
SELECT
  `Customer service calls`,
  COUNT(*) AS customers,
  SUM(CASE WHEN `Churn`='True' THEN 1 ELSE 0 END) AS churned_customers,
  ROUND(100.0 * SUM(CASE WHEN `Churn`='True' THEN 1 ELSE 0 END) / COUNT(*),2) AS churn_rate_percent
FROM telecom_users
GROUP BY `Customer service calls`
ORDER BY `Customer service calls`;

-- Top features per-customer / per-segment for scatter & correlation charts

CREATE VIEW v_customer_metrics AS
SELECT
 `State`,
  `Account length`,
  `Area code`,
  `International plan`,
  `Voice mail plan`,
  `Number vmail messages`,
  `Total day minutes`,
  `Total day calls`,
  `Total night minutes`,
  `Total night calls`,
  `Total eve minutes`,
  `Total eve calls`,
  `Total intl minutes`,
  `Total intl calls`,
  `Total minutes`,
  `Customer service calls`,
  `Churn`
FROM telecom_users;
