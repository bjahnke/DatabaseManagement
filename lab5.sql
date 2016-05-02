--Brian Jahnke 
--Lab 5
--1.)
select a.city
from agents a
inner join orders o on a.aid = o.aid
where o.cid = 'c002';

--2.)
select o.pid
from agents a
inner join orders o on a.aid = o.aid 
inner join customers c on o.cid = c.cid
where c.city = 'Dallas'
order by o.pid DESC;

--3.)
select name 
from customers  
where cid not in(select cid
		from orders);

--4.)
select c.name
from customers c
full outer join orders o on c.cid = o.cid
where c.cid is Null 
or o.cid is Null;

--5.) 
select c.name, a.name
from customers c, agents a
where c.city = a.city;


--6.) 
Select c.name, a.name, c.city
from customers c, agents a
where c.city = a.city;

--7.)
select name, city
from customers c 
where c.city IN(select city
		from products p
		group by city
		Limit 1);






