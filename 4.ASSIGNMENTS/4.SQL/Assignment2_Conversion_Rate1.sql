use SampleSales

CREATE VIEW Total_info
AS SELECT Adv_Type, COUNT(CASE WHEN Action = 'Order' then 1 ELSE NULL END) as "total_order", COUNT(Action) as "total_action"
FROM  Actions											
GROUP BY Adv_Type
-------------------------------------------------------------------------------
SELECT Adv_Type, ROUND((CAST(total_order AS Float)/total_action), 2) as conversion_rate
FROM Total_info;