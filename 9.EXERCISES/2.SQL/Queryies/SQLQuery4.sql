use SampleSales


--1. Tüm bisikletler arasýnda en ucuz bisikletin adý (FIRST_VALUE fonksiyonunu kullanýnýz)

SELECT DISTINCT FIRST_VALUE(product_name) OVER(ORDER BY list_price) AS F_V
FROM product.product


SELECT DISTINCT category_id 
			FIRST_VALUE(product_name) OVER(PARTITION BY list_price) AS F_V
FROM product.product









