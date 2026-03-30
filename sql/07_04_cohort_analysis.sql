WITH first_purchase AS (
  SELECT 
  customer_id,
  DATE_TRUNC(MIN(order_date),MONTH) AS cohort_month
  FROM `sincere-abode-488813-c0.olistdataset.master_orders_features`
  GROUP BY customer_id
),
customer_orders AS (
  SELECT
  customer_id,
  DATE_TRUNC(order_date,MONTH) AS order_month
  FROM `sincere-abode-488813-c0.olistdataset.master_orders_features`
)
SELECT 
cohort_month,
order_month,
DATE_DIFF(order_month,cohort_month,MONTH) AS months_since_first_purchase,
COUNT(DISTINCT customer_id) AS customers
FROM customer_orders
JOIN first_purchase USING(customer_id)
GROUP BY cohort_month, order_month
ORDER BY cohort_month, order_month