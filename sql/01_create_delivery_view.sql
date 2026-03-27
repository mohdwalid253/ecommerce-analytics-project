CREATE OR REPLACE VIEW `sincere-abode-488813-c0.olistdataset.order_delivery_analysis` AS

SELECT
order_id,
customer_id,
order_purchase_timestamp,
order_delivered_customer_date,
order_estimated_delivery_date,

DATE_DIFF(
DATE(order_delivered_customer_date),
DATE(order_estimated_delivery_date),
DAY
) AS delivery_delay_days,

CASE
WHEN DATE(order_delivered_customer_date) <= DATE(order_estimated_delivery_date)
THEN 'On Time'
WHEN DATE_DIFF(DATE(order_delivered_customer_date), DATE(order_estimated_delivery_date), DAY) BETWEEN 1 AND 3
THEN 'Slight Delay'
ELSE 'Major Delay'
END AS delivery_status

FROM `sincere-abode-488813-c0.olistdataset.olist-orders-dataset`

WHERE order_status = 'delivered'