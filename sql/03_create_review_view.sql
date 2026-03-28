CREATE OR REPLACE VIEW `sincere-abode-488813-c0.olistdataset.review_analysis` AS

SELECT
o.order_id,
o.customer_id,
r.review_score,
DATE(r.review_creation_date) AS review_date

FROM `sincere-abode-488813-c0.olistdataset.olist-orders-dataset` o

JOIN `sincere-abode-488813-c0.olistdataset.olist-order-reviews-dataset` r
ON o.order_id = r.order_id