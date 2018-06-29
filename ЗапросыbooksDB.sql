�������� ��������� �������, ��������� ���� ������ Books (��������������). ��� ���� ������������ �������� �������������:


use booksDB


1.	������� ������������, ������� ������ ���������� ���-�� ���� �� ����������������. 
create view maxBookProramm as
select p.name, count(b.n) cntBookProgramm 
from themes t, books b, press p
where t.name = '����������������' and b.Id_press = p.id
group by p.Name

2.	�������� ��������, �� ������� ������ ���������� ���-�� �������. 
create view PagesSum as
select t.name, sum(b.Pages) summ
from books b, themes t
where b.Id_theme = t.id group by t.name

select *
from PagesSum
where summ = (select min(summ) from PagesSum)

3.	������� ����� ������� ����� ������������ BHV. 
create view maxPriceBHV as
select b.Name, b.Price
from books b
where b.Price = (select max(Price) from books)

4.	������� �����, � ������� ���-�� ������� ������, ��� �������.

create view sumPagesForAVG as
select b.Name, sum(b.Pages) sumPages
from books b
group by b.Name

select *
from sumPagesForAVG
where sumPages > (select avg(sumPages) from sumPagesForAVG) 
