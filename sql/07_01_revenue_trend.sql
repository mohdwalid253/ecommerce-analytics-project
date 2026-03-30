SELECT
FORMAT_DATE('%Y-%m', order_date) AS month,
SUM(total_order_value) AS revenue
FROM `sincere-abode-488813-c0.olistdataset.master_orders_features`
GROUP BY month
ORDER BY month