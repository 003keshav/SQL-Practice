-- 24/Feb/2026
-- corelated is an type of subquery which is executed again & again for each row of outer query
-- corelated is maye be an alternative of joins
select * from world.city;
create database regex2;
use regex2;
CREATE TABLE employee (
    eid INT PRIMARY KEY,
    name VARCHAR(50),
    dept VARCHAR(50),
    salary DECIMAL(10,2)
);


INSERT INTO employee (eid, name, dept, salary) VALUES
(101, 'Amit', 'HR', 40000),
(102, 'Neha', 'HR', 45000),
(103, 'Raj', 'IT', 60000),
(104, 'Priya', 'IT', 75000),
(105, 'Suresh', 'IT', 50000),
(106, 'Anita', 'Finance', 55000),
(107, 'Vikram', 'Finance', 65000),
(108, 'Kavita', 'Finance', 48000),
(109, 'Rohit', 'Marketing', 52000),
(110, 'Sneha', 'Marketing', 58000);

select * from regex2.employee;  -- avg salary 54800
select avg(salary) from regex2.employee;

select * from regex2.employee as e1 where salary > 
(select avg(salary) from regex2.employee where dept=e1.dept);

select * from regex2.employee as e1 where salary =all
(select max(salary) from regex2.employee where dept=e1.dept);

select * from regex2.employee as e1 where salary = 
(select min(salary) from regex2.employee where dept=e1.dept);

select * from regex2.employee as e1 where salary >any
(select salary from regex2.employee where dept=e1.dept);

select * from regex2.employee e1 where salary >=
(select max(salary) from regex2.employee where dept=e1.dept);