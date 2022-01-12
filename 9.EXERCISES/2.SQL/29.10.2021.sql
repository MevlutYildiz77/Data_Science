use SampleSales

-----------SUBQUERIES-----------

--IN SELECT CLAUSE-----

SELECT  order_id, list_price, (SELECT AVG(list_price) FROM sale.order_item) AS avg_price
FROM sale.order_item



SELECT  order_id,
		list_price
FROM sale.order_item;

---IN WHERE CLAUSE---

SELECT order_id, order_date
FROM sale.orders
WHERE order_date IN (
					SELECT TOP 5 order_date
					FROM sale.orders
					ORDER BY order_date DESC
					);


SELECT TOP 5 order_id, order_date
FROM sale.orders
ORDER BY order_date DESC;


---IN FROM CLAUSE---
SELECT order_id, order_date
FROM	(
		SELECT TOP 5
		FROM sale.orders
		ORDER BY order_date DESC
		); A

		---WRITE A QUERY THAT RETURNS THE TOTAL LIST PRICE BY EACH ORDER IDS

SELECT order_id, SUM(list_price) AS total_price
FROM sale.order_item
GROUP BY order_id


SELECT order_id, (SELECT SUM(list_price)FROM sale.order_item B)
FROM sale.order_item A


SELECT order_id, (SELECT SUM(list_price)FROM sale.order_item B)
FROM sale.order_item A





-----correlated subquerry ile çözümü (Bir alt sorgu dýþ sorgudaki sütunlara baþvuruyorsa veya baþka bir deyiþle, bir alt sorgu dýþ sorgudaki deðerleri kullanýyorsa, bu alt sorguya iliþkili alt sorgu denir.)
SELECT DISTINCT order_id,
		(SELECT SUM(list_price) FROM sale.order_item B WHERE A.order_id=B.order_id) total_price
		FROM sale.order_item A




--------WRÝTE A QUERY THAT BRINGS THE STAFF FROM THE STORE THAT MARIA CUSSONA WORKS

SELECT *
FROM sale.staff
WHERE store_id = 1


SELECT *
FROM sale.staff
WHERE first_name= 'Maria' AND last_name = 'Cussona'


SELECT store_id
FROM sale.staff
WHERE first_name= 'Maria' AND last_name = 'Cussona'

veya
SELECT *
FROM sale.staff
WHERE store_id  IN     (
					SELECT TOP 1 store_id
					FROM    sale.staff
					ORDER BY store_id
					);

veya
SELECT *
FROM sale.staff
WHERE store_id =    (
					SELECT store_id
FROM sale.staff
WHERE first_name= 'Maria' AND last_name = 'Cussona'
					);

-----WRITE A QUERRY THAT JANE DESTREY IS THE MANAGER OF 

SELECT *
FROM sale.staff


SELECT staff_id
FROM sale.staff
WHERE first_name= 'Jane' AND  last_name = 'Destrey'




SELECT *
FROM sale.staff
WHERE manager_id = 5

VEYA

SELECT *
FROM sale.staff
WHERE staff_id  IN      (
					SELECT staff_id
					FROM sale.staff
					WHERE manager_id = 5
					) ;

VEYA( BU 2 TANE ÝÇ ÝÇE SUBQUERY OLAN ÇÖZÜM VE BU YOL BÝZE ÖÐRETÝLMEDÝ SANIRIM)
SELECT *
FROM sale.staff
WHERE staff_id  IN      (
					SELECT staff_id
					FROM sale.staff
					WHERE manager_id IN
					( SELECT staff_id
					FROM sale.staff
					WHERE first_name= 'Jane' AND  last_name = 'Destrey'
					));


VEYA 

SELECT *
FROM sale.staff
WHERE manager_id =  (
					SELECT staff_id
					FROM sale.staff
					WHERE first_name= 'Jane' AND  last_name = 'Destrey'
					) ;

----WRITE QUERY THAT RETURNS CUSTOMERS IN CITY WHERE THE "SACRAMENTO BIKES" STORE IS LOCATED

SELECT *
FROM sale.customer
WHERE city = 'Sacramento'



SELECT customer_id
FROM sale.customer
WHERE  customer_id  IN   (
							SELECT customer_id
							FROM sale.customer
							WHERE city = 'Sacramento'
						);



SELECT *
FROM sale.customer
WHERE  customer_id  IN   (
							SELECT customer_id
							FROM sale.customer
							WHERE city = 'Sacramento'
						);


---LIST BIKES THAT ARE MORE EXPENSIVE THAN THE'TREK CROSSRIP-2020' BIKE
(Session-3-slayt 19)


SELECT *
FROM product.product
WHERE product_name =  '%Trek%';


SELECT product_name
FROM product.product
WHERE  product_name IN    (
							SELECT product_name
							FROM product.product
							WHERE product_name =  'Trek CrossRip2- 2020'
							);




product_name =  'Trek CrossRip2-2020' ;       