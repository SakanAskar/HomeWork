Ќаписать следующие запросы, использу€ базу данных Books (многотабличную). ѕри этом использовать создание представлений:


use booksDB


1.	¬ыбрать издательство, которое издало наибольшее кол-во книг по программированию. 
create view maxBookProramm as
select p.name, count(b.n) cntBookProgramm 
from themes t, books b, press p
where t.name = 'ѕрограммирование' and b.Id_press = p.id
group by p.Name

2.	ѕоказать тематику, по которой издано наименьшее кол-во страниц. 
create view PagesSum as
select t.name, sum(b.Pages) summ
from books b, themes t
where b.Id_theme = t.id group by t.name

select *
from PagesSum
where summ = (select min(summ) from PagesSum)

3.	¬ыбрать самую дорогую книгу издательства BHV. 
create view maxPriceBHV as
select b.Name, b.Price
from books b
where b.Price = (select max(Price) from books)

4.	¬ыбрать книги, у которых кол-во страниц больше, чем среднее.

create view sumPagesForAVG as
select b.Name, sum(b.Pages) sumPages
from books b
group by b.Name

select *
from sumPagesForAVG
where sumPages > (select avg(sumPages) from sumPagesForAVG) 
