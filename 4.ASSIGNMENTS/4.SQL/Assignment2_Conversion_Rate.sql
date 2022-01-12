use Assignment2_Advertisement

a. 
CREATE TABLE Actions
(
Visitor_ID INT NOT NULL,
Adv_Type VARCHAR(10) NOT NULL,
Action VARCHAR(20) NOT NULL,
);

INSERT INTO Actions (Visitor_ID, Adv_Type, Action)
VALUES

(1, 'A', 'Left'),
(2, 'A', 'Order'),
(3, 'B', 'Left'),
(4, 'A', 'Order'),
(5, 'A', 'Review'),
(6, 'A', 'Left'),
(7, 'B', 'Left'),
(8, 'B', 'Order'),
(9, 'B', 'Review'),
(10, 'A', 'Review');

b.
SELECT Adv_Type,
SUM(CASE WHEN Action like 'Order' THEN 1 ELSE 0 END) as Orders,
SUM(CASE WHEN Action like 'Left' THEN 1 ELSE 0 END) as Lefts,
SUM(CASE WHEN Action like 'Review' THEN 1 ELSE 0 END) as Reviews,
SUM(CASE WHEN Action like '%%' THEN 1 ELSE 0 END) as Total_Order
INTO rates
FROM Actions
GROUP BY Adv_Type;

SELECT * FROM rates

c. 

SELECT Adv_Type,
		ROUND((CAST(Orders AS FLOAT) / CAST(Orders + Lefts + Reviews AS FLOAT)),2) AS Conversation_rate
FROM rates
ORDER BY Adv_Type;
