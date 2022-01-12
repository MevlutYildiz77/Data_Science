use vgsales


select * from vgsales1
select Name from vgsales1
select Year from vgsales1

select Name, len(Name) from vgsales1 where len(Name) >90

alter table vgsales1 
alter column Year int    --year'da null veriler olduðu için int'e dönüþtürülemedi. 

select Genre, count(Genre) each
from vgsales1
group by Genre




