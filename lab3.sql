--1.)
select ordno, dollars
From Orders;

--2.)
select name, city
from agents WHERE name = 'Smith';

--3.)
select pid, name, priceUSD 
From products
where quantity > 208000;

--4.)
select name, city
from customers
Where city = 'Dallas';

--5.)
select name
from agents
where city NOT IN('New York', 'Tokyo');

--6.)
select *
from products
where city NOT IN('Dallas', 'Duluth')
and priceUSD >= 1;

--7.)
select * 
from orders
where mon IN('jan', 'mar');

--8.)
select *
from orders
where mon = 'feb'
and dollars < 500;

--9.)
select *
from orders 
where cid = 'C005';
