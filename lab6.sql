--Brian Jahnke

--1.)
select name, city 
from customers c
where c.city in (select city
		from products 
		group by city
		order by count(pid) desc
		limit 1);

--2.)
select name 
from products 
group by name, priceUSD
having (select avg(priceUSD)
	from products) < priceUSD;

--3.)
select c.name, o.pid, sum(o.dollars) as dollarsum
from orders o
inner join customers c on c.cid = o.cid
group by c.name, o.pid
order by dollarsum desc;

--4.)
select c.name, coalesce(sum(o.dollars), 0.00)
from orders o
full outer join customers c on c.cid = o.cid
group by c.name
order by c.name asc;

--5.)
select c.name, p.name, a.aid, a.name
from customers c
inner join orders o on c.cid = o.cid
inner join agents a on a.aid = o.aid
inner join products p on p.pid = o.pid
where o.cid in (select o.cid
		from orders 
		inner join customers on o.cid = c.cid 
		where o.aid = ( select aid 
				from agents 
				where city = 'Tokyo'));

--6.) 
select o.*, o.qty*p.priceUSD*(1-(discount/100)) as truetotal
from orders o
inner join products p on o.pid = p.pid
inner join customers c on o.cid = c.cid
where dollars not in (select o.qty*p.priceUSD*(1-(discount/100)) as truetotal
			from orders o
			inner join products p on o.pid = p.pid
			inner join customers c on o.cid = c.cid);

--7.)
--A left outer join will use the first table stated called the "left" table
--as the main reference table while also including elements that the right 
--and left table share. A right outer join will use the second table stated 
--or the "right" table as the main reference table while including elements 
--shared by both right and left tables. For example if a left table includes 
--(apple, orange, banana) and a right table includes (apple, peach, mango),
--left outer join would include(apple, orange, banana), but right join 
--would yield (apple, peach, mango).    







