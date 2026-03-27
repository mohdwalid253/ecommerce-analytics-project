CREATE OR REPLACE VIEW `sincere-abode-488813-c0.olistdataset.revenue_analysis` AS

SELECT
o.order_id,
o.customer_id,
DATE(o.order_purchase_timestamp) AS order_date,

SUM(i.price) AS order_value,
SUM(i.freight_value) AS freight_value,
SUM(i.price + i.freight_value) AS total_order_value

FROM `sincere-abode-488813-c0.olistdataset.olist-orders-dataset` o

JOIN `sincere-abode-488813-c0.olistdataset.olist-order-items-dataset` i
ON o.order_id = i.order_id

WHERE o.order_status = 'delivered'

GROUP BY
o.order_id,
o.customer_id,
order_date