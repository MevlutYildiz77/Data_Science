use vgsales


select * from vgsales1
select Name from vgsales1
select Year from vgsales1

select Name, len(Name) from vgsales1 where len(Name) >90

alter table vgsales1 
alter column Year int    --year'da null veriler oldu�u i�in int'e d�n��t�r�lemedi. 

select Genre, count(Genre) each
from vgsales1
group by Genre




