SELECT
  CASE
    WHEN order_count = 1 THEN 'One-Time Customer'
    ELSE 'Returning Customer'
  END AS customer_type,
  COUNT(*) AS customers
FROM (
  SELECT
  customer_id,
  COUNT(order_id) AS order_count
  FROM `sincere-abode-488813-c0.olistdataset.master_orders_features`
  GROUP BY customer_id
)
GROUP BY customer_type