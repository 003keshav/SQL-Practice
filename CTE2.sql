-- 23/March/2026


-- RECURSIVE CTE
create database ctedb;
use ctedb;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    manager_id INT
);

INSERT INTO employees (emp_id, emp_name, manager_id) VALUES
(1, 'CEO', NULL),
(2, 'Manager A', 1),
(3, 'Manager B', 1),
(4, 'Team Lead A1', 2),
(5, 'Team Lead A2', 2),
(6, 'Developer A1', 4),
(7, 'Developer A2', 4),
(8, 'Developer B1', 3);

select * from employees;
select * from ctedb.employees
where manager_id is null;

select * from employees as emp
join employees as mng on emp.manager_id=mng.emp_id; 

with recursive cte as
(select emp_id, emp_name, manager_id, emp_name as hierachy
from employees where manager_id is null
union all
select e1.emp_id, e1.emp_name, e1.manager_id, concat(e1.emp_name, '->', cte.hierachy) as hierachy
from cte join employees as e1 
where e1.manager_id = cte.emp_id )
 select * from cte;
 
 
 -- what is tcl  1) commit   , rollback , start transection
 -- drop vs delete vs truncate
 -- with example normalization 1nf , 2nf, 3nf, bcl