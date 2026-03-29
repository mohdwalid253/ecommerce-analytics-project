CREATE OR REPLACE TABLE `sincere-abode-488813-c0.olistdataset.master_orders_table` AS

SELECT
d.order_id,
d.customer_id,
d.order_purchase_timestamp,
rev.order_date,

d.delivery_delay_days,
d.delivery_status,

r.review_score,

rev.order_value,
rev.freight_value,
rev.total_order_value,

p.payment_type,
p.payment_installments,
p.payment_value

FROM `sincere-abode-488813-c0.olistdataset.order_delivery_analysis` d

LEFT JOIN `sincere-abode-488813-c0.olistdataset.review_analysis` r
ON d.order_id = r.order_id

LEFT JOIN `sincere-abode-488813-c0.olistdataset.revenue_analysis` rev
ON d.order_id = rev.order_id

LEFT JOIN `sincere-abode-488813-c0.olistdataset.payment_analysis` p
ON d.order_id = p.order_id