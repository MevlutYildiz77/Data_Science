use SampleSales


SELECT	c.order_id, category_name,
		CASE WHEN A.category_name = 'Comfort Bicycles' THEN 1 ELSE 0 END AS comfort_bike,
		CASE WHEN A.category_name = 'Children Bicycles' THEN 1 ELSE 0 END AS children_bike
FROM	product.category A, product.product B, sale.order_item C
WHERE	category_name IN ('Children Bicycles' , 'Comfort Bicycles')
AND		A.category_id = B.category_id
AND		B.product_id = C.product_id 
having Sum(CASE WHEN A.category_name = 'Comfort Bicycles' THEN 1 ELSE 0 END) >=1 AND
SUM(CASE WHEN A.category_name = 'Children Bicycles' THEN 1 ELSE 0 END) >= 1

VEYA

SELECT	SELECT c.order_id,
		Sum(CASE WHEN A.category_name = 'Comfort Bicycles' THEN 1 ELSE 0 END) AS comfort_bike,
		SUM(CASE WHEN A.category_name = 'Children Bicycles' THEN 1 ELSE 0 END) AS children_bike
FROM	product.category A, product.product B, sale.order_item C
WHERE	category_name IN ('Children Bicycles' , 'Comfort Bicycles')
AND		A.category_id = B.category_id
AND		B.product_id = C.product_id
GROUP BY c.order_id
HAVING
		Sum(CASE WHEN A.category_name = 'Comfort Bicycles' THEN 1 ELSE 0 END) >= 1
AND		SUM(CASE WHEN A.category_name = 'Children Bicycles' THEN 1 ELSE 0 END) >= 1


VEYA


WITH T1 AS(
SELECT	c.order_id,
		sum(CASE WHEN A.category_name = 'Comfort Bicycles' THEN 1 ELSE 0 END) AS comfort_bike,
		sum(CASE WHEN A.category_name = 'Children Bicycles' THEN 1 ELSE 0 END) AS children_bike
FROM	product.category A, product.product B, sale.order_item C
WHERE	category_name IN ('Children Bicycles' , 'Comfort Bicycles')
AND		A.category_id = B.category_id
AND		B.product_id = C.product_id
GROUP BY c.order_id)
select *
from T1
where comfort_bike != 0 and children_bike != 0




