--Brian Jahnke

--1.)
select city
from agents
where aid in( select aid 
		from orders
		where cid = 'c002');

--2.)
select pid 
from orders
where aid in( select aid 
		from orders
		where cid in( select cid
				from customers 
				where city = 'Dallas'))

order by pid DESC; 

--3.)
select cid, name
from customers 
where cid not in( select cid
		from orders
		where aid = 'a01');

--4.)
select cid 
from orders 
where pid = 'p01'
	intersect
select cid
from orders
where pid = 'p07';

--5.)
select distinct pid
from orders 
where cid not in( select cid
			from orders 
			where aid = 'a07')
order by pid DESC;

--6.)
select name, discount, city
from customers
where cid in( select cid 
		from orders
		where aid in( select aid 
				from agents 
				where city in ('London', 'New York')));

--7.)
select name
from customers
where discount in( select discount
			from customers 
			where city in('Dallas', 'London'));

--8.)

-- A check constraint is a requirement that may be set to one or multiple columns.
-- A value must meet the criteria of a given check constrain of a column before
-- it can be set as a value to that column. Check constrains are usefull for
-- preventing unintended cases from occuring in the database that would otherwise 
-- reduse its usefullnes or even break it. An example of a good check constraint 
-- would be a value can not equal one that already exists in the column if that 
-- column is meant to have unique values. This is a good constraint because if 
-- someone wants to search a table for information about a specific customer,
-- the constraint will prevent confusing cases such as 2 different customers 
-- with different data having the same name. A bad constraint would be making 
-- it so the city a customer is located in must be unique. This is a bad 
-- constraint because, unlike the first case, it is reasonable to have multiple
-- customers being located in the same city and preventing this would only
-- reduce the amount of data a database should be able to hold.   





