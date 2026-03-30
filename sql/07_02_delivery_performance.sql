SELECT
delivery_status,
COUNT(*) AS total_orders
FROM `sincere-abode-488813-c0.olistdataset.master_orders_features`
GROUP BY delivery_status