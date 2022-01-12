use SampleSales


select *  from sale.staff

create view staff  as
select staff_id, first_name, last_name, store_id
from sale.staff

select * from staff

-- kullan�m amac�
--1. sorgular� kolayla�t�rmak, 2. Gizlilik-G�r�nmesi istenmeyen bilgileri ��kartmak 3. AGG functionlar� otomatikle�tirmek i�in
--view �zerinde update yaparsdasn orijinal tablo da de�i�ir.

alter view staff  as
select staff_id, first_name, last_name, store_id, email
from sale.staff 

select * from staff

update staff set first_name ='Fabian' where staff_id = 1

select * from staff

delete from staff where staff_id = 1



----------------
create view personel as
select staff_id, first_name, last_name, store_name
from sale.staff a
left join sale.store b
on a.store_id = b.store_id


select * from personel

update personel set store_name ='Buffalo Bikes' where staff_id =5


select * from sale.store

update personel set first_name ='Fabian' where staff_id = 1

drop view if exists personel   --silme




