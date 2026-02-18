-- 17/Feb/2026
use rmd;
show tables;
select * from employees;

select emp.eid, emp.ename, emp.manager_id from employees as emp; -- employee table

select mgr.eid, mgr.ename from employees as mgr; -- manager information

-- self join is when we find value in column in same  table
-- here we are finding manager id value same in same table of eid value  
select emp.eid, emp.ename, emp.manager_id, mgr.eid, mgr.ename from employees as emp
join employees as mgr
where emp.manager_id=mgr.eid;

select * from customers;
select * from orders;

-- cross join/cartesian join where every row of t1 to every row of t1 formula (M*N). 
-- table1 3 rows , table2 5 rows =15 rows
select * from customers
cross join orders;

-- natural join act like inner join when we have a common colunm otherwise it act like cross join
-- natural join automatically combine two table based on same column name 
-- natural join har ek same column name pe condition lagayega
select * from customers
natural join orders;


select * from world.city;
select * from world.country;
select * from world.city natural join world.country;
