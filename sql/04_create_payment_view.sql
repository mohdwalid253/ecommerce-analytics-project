CREATE OR REPLACE VIEW `sincere-abode-488813-c0.olistdataset.payment_analysis` AS

SELECT
order_id,
payment_type,
payment_installments,
payment_value

FROM `sincere-abode-488813-c0.olistdataset.olist-order-payments-dataset`