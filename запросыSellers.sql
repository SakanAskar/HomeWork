
--1.	�������� ��� ���������� � ��������. 
select slrs.Name, CD.id, CD.name, count(CD.id)numberOfSoldCD
from Selling slng
join CD on CD.id = slng.id_cd
join Sellers slrs on slrs.id = slng.id_seller
group by slrs.Name, CD.id, CD.name

--2.	�������� ���-�� ��������� ������ �� ������ �� �����. 
select b.name, count(CD.id) Sold
from Bands b
join CD on CD.id_band = b.id
join Selling slng on slng.id_cd = cd.id
group by b.name

--3.	�������� ����� ���������� ������. 
create view Solds as
select b.name, count(CD.id) Sold
from Bands b
join CD on CD.id_band = b.id
join Selling slng on slng.id_cd = cd.id
group by b.name

select name, Sold
from Solds
where Sold = (select max(sold) from Solds)
