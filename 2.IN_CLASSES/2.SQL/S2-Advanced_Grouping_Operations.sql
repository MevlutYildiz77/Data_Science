use SampleSales

SELECT A.staff_id, A.first_name, A.last_name, B.order_id
FROM sale.staff A
INNER JOIN sale.orders B
ON A.staff_id=B.staff_id
ORDER BY B.staff_id


SELECT A.staff_id, A.first_name, A.last_name, B.order_id
FROM sale.staff A
LEFT JOIN sale.orders B
ON A.staff_id=B.staff_id
ORDER BY B.order_id

SELECT COUNT(A.staff_id), COUNT(B.staff_id)
FROM sale.staff A INNER JOIN sale.orders B ON A.staff_id=B.staff_id


SELECT COUNT(DISTINCT A.staff_id), COUNT(DISTINCT B.staff_id)
FROM sale.staff A INNER JOIN sale.orders B ON A.staff_id=B.staff_id

SELECT * FROM sale.staff


SELECT A.category_name, B.brand_name
FROM product.category A
CROSS JOIN product.brand B

----WR�TE QUERY THAT RETURNS ALL BRND X CATEGORY POSSIBILITIES

SELECT A.brand_id, A.brand_name, C.category_id, C.category_name
FROM product.brand A
LEFT JOIN product.product B
ON A.brand_id=B.brand_id
INNER JOIN product.category C
ON B.category_id=C.category_id 
ORDER BY A.brand_id, A.brand_name, C.category_id;

--SELF JOIN

---GRUPLANDIRMA T�RLER�
	1. GROUPING SETS,
	2. ROLLUP,
	3. CUBE,
	4. PIVOT

-----------
SELECT category_name, COUNT(product_id) AS cnt_product
FROM product.product A, product.category B
WHERE A.category_id = B.category_id
GROUP BY
		category_name;

SELECT *
FROM product.product

SELECT *
FROM product.category

----------------------- hav�ng--------
HAVING_  GROUT BY ile kullan�l�r. Filtreme yapmak i�in kullan�l�r.

SELECT brand_name, AVG(list_price) AS avg_list_price
FROM product.product A, product.brand B
WHERE A.brand_id = b.brand_id
AND A.model_year > 2016
GROUP BY brand_name
HAVING AVG(list_price) > 1000
ORDER BY 
		AVG(list_price);


SELECT brand_name, AVG(list_price) AS avg_list_price
FROM product.product A, product.brand B
WHERE A.brand_id = b.brand_id
AND A.model_year > 2016
GROUP BY brand_name
HAVING AVG(list_price) > 1000
ORDER BY 
		AVG(list_price) DESC;



SELECT brand_name, AVG(list_price) AS avg_list_price
FROM product.product A, product.brand B
WHERE A.brand_id = b.brand_id
AND A.model_year > 2016
GROUP BY brand_name
HAVING AVG(list_price) > 1000
ORDER BY 
		brand_name;


SELECT brand_name, AVG(list_price) AS avg_list_price
FROM product.product A, product.brand B
WHERE A.brand_id = b.brand_id
AND A.model_year > 2016
GROUP BY brand_name
HAVING AVG(list_price) > 1000
ORDER BY 
		brand_name DESC;



---wr�te a query that checks �f any product �s repeated �n more than one row �n the products table-----

SELECT *
FROM product.product

SELECT product_id, SUM(product_id) AS num_of_rows
FROM product.product
GROUP BY product_id


SELECT product_id, COUNT(product_id) AS num_of_rows
FROM product.product
GROUP BY product_id



SELECT product_id, COUNT(product_id) AS num_of_rows
FROM product.product
GROUP BY product_id
HAVING COUNT(*) > 1



SELECT product_id, COUNT(*) AS num_of_rows
FROM product.product
GROUP BY product_id


---WRITE A QUERY THAT RETURNS CATEGORY IDS A MAXIMU MLIST PRICE ABOVE 4000 OR A MINIMUN LIST PRICE BELOW 500---

SELECT category_id, MAX(list_price) AS max_price, MIN(list_price) AS min_price
FROM product.product 
GROUP BY A.category_id

SELECT category_id, MAX(list_price) AS max_price, MIN(list_price) AS min_price
FROM product.product 
GROUP BY A.category_id
HAVING MAX(list_price) > 4000 OR MIN(list_price) <500


SELECT category_id, MAX(list_price) AS max_price, MIN(list_price) AS min_price
FROM product.product 
ORDER BY category_id
HAVING  MAX(list_price) > 4000 OR MIN(list_price) < 500

----------FIND AVERAGE PRODUCT PRICES OF THE BRANDS. THE AVERAGE PRICE SHOULD BE DISPLAYED IN DESCENDING ORDER.
NOT:
FROM product.brand A, product.product B
WHERE A.brand_id = B.brand_id
i�lemi bir join i�lemidir.


SELECT A.brand_name, AVG(B.list_price) avg_list_price
FROM product.brand A, product.product B
WHERE A.brand_id = B.brand_id
GROUP BY A.brand_id, A.brand_name
ORDER BY avg_list_price DESC;

-Genel ortalama
SELECT AVG(B.list_price) avg_list_price
FROM product.brand A, product.product B
WHERE A.brand_id = B.brand_id

--Ortalama �r�n fiyat� 1000'den �ok olan markalar� getiriniz.

SELECT A.brand_name, AVG(B.list_price) avg_list_price
FROM product.brand A, product.product B
WHERE A.brand_id = B.brand_id
GROUP BY A.brand_id, A.brand_name
HAVING AVG(B.list_price) > 1000
ORDER BY avg_list_price DESC;


---WRITE A QUERY THAT RETURNS NET PRICE PAID BY CUSTOMER FOR EACH ORDER. (DON'T FORGET NEGLECT DISCOUNTS AND QUANTITIES)

SELECT A.order_id,  SUM(B.list_price -(B.list_price * (B.discount * B.quantity))) AS net_price
FROM sale.orders A, sale.order_item B
WHERE A.order_id = B.order_id
GROUP BY A.order_id
ORDER BY A.order_id


SELECT A.order_id,  SUM(B.list_price -(B.discount * B.quantity)) AS net_price
FROM sale.orders A, sale.order_item B
WHERE A.order_id = B.order_id
GROUP BY A.order_id
ORDER BY A.order_id


SELECT *
FROM sale.order_item


-------GROUPING SETS---------
hangi s�tunlara g�re gruplam yapmaya karar veremediyseniz veya b�t�n gruplara g�re sonu�lar� g�rmek istiyorsan�z kullan�l�r.
SELECT
	column1, 
	column2,
	aggregate_function(column3)
FROM
table_name
GROUP BY
GROUPING SETS (
		(column1, column2),
		(column1),
		(column2),
		()
);
	
	-----------------------------------YEN� �ALI�MA SORGUSU----------------------

	SELECT	C.brand_name as Brand, D.category_name as Category, B.model_year as Model_Year, 
		ROUND (SUM (A.quantity * A.list_price * (1 - A.discount)), 0) total_sales_price
INTO	sale.sales_summary

FROM	sale.order_item A, product.product B, product.brand C, product.category D
WHERE	A.product_id = B.product_id
AND		B.brand_id = C.brand_id
AND		B.category_id = D.category_id
GROUP BY
		C.brand_name, D.category_name, B.model_year


----1. Toplam sales miktar�n� hesaplay�n�z.

SELECT SUM(total_sales_price)
FROM sale.sales_summary


SELECT *
FROM sale.sales_summary


--2. Markalar�n toplam sales miktar�n� hesaplay�n�z

SELECT  brand, SUM(total_sales_price)
FROM sale.sales_summary
GROUP BY brand

--3. Kategori baz�nda yap�lan toplam sales miktar�n� hesaplay�n�z

SELECT Category, SUM(total_sales_price)
FROM sale.sales_summary
GROUP BY Category


--4. Marka ve kategori k�r�l�m�ndaki toplam sales miktar�n� hesaplay�n�z

SELECT brand, Category, SUM(total_sales_price)
FROM sale.sales_summary
GROUP BY brand, Category
ORDER BY brand


SELECT brand, Category, SUM(total_sales_price)
FROM sale.sales_summary
GROUP BY brand, Category


SELECT brand, Category, SUM(total_sales_price)
FROM sale.sales_summary
GROUP BY
		GROUPING SETS (
					(brand, Category),
					(brand),
					(Category),
					()
					)
ORDER BY brand, Category;



SELECT brand, Category, SUM(total_sales_price)
FROM sale.sales_summary
GROUP BY
		GROUPING SETS (
					(brand, Category),
					(brand),
					(Category),
					()
					)
;


-------ROLL UP-------
NOT: s�ralama �nemli, �nce d1,d2,d3, sonra d1,d2, sonra d1, sonra () olarak gruplar.
SELECT 
	d1,
	d2,
	d3,
	aggregate_function(c4)
FROM
	table_name
GROUP BY
	ROLLUP(d1,d2,d3);













