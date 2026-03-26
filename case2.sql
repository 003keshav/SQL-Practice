-- 17/March/2026

-- find continent , total countries and print msg large continent if total countries int that continent >5
-- print mid-size continenet if total countries >3  : else small continent
select * from world.country;

select continent, count(Name),
case
    when count(Name)>5 then 'Large continent'
    when count(Name)>3 then 'Mid-size continent'
else 'small continent'
end as Size
 from world.country
 group by continent; 


use regex2;
show tables;
select * from employee;

-- CTE (Comman Table Expressions)

with test as (
              select dept, avg(salary) as avgsalary from employee
              group by dept)
-- join both table print name, dept, employee_salary and dept_avg_salary
select e.name, e.dept, e.salary, t.avgsalary from employee as e
join test as t on e.dept=t.dept
where e.salary>t.avgsalary;

with cte as
        ( select *, dense_rank() over(order by salary desc) as rnk from employee)
        select * from cte where rnk=2;
        
-- or
select * from(
             select *, dense_rank() over(order by salary desc) as rnk from employee) as temp
             where rnk=2;
             
             
