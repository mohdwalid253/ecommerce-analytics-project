CREATE OR REPLACE TABLE `sincere-abode-488813-c0.olistdataset.master_orders_features` AS

SELECT
*,

CASE
WHEN delivery_delay_days > 0 THEN 1
ELSE 0
END AS late_delivery_flag,

CASE
WHEN total_order_value >
(
SELECT APPROX_QUANTILES(total_order_value, 4)[OFFSET(3)]
FROM `sincere-abode-488813-c0.olistdataset.master_orders_table`
)
THEN 1
ELSE 0
END AS high_value_order,

EXTRACT(MONTH FROM order_date) AS order_month

FROM `sincere-abode-488813-c0.olistdataset.master_orders_table`