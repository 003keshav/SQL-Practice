-- 12/Feb/2026
create database rmd;
use rmd;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_amount DECIMAL(10,2)
);


INSERT INTO customers VALUES
(1, 'John', 'New York'),
(2, 'Alice', 'Los Angeles'),
(3, 'Bob', 'Chicago'),
(4, 'Emma', 'Houston'),
(5, 'Michael', 'Phoenix'),
(6, 'Sophia', 'Dallas'),
(7, 'David', 'Seattle'),
(8, 'Olivia', 'Boston'),
(9, 'James', 'Denver'),
(10, 'Isabella', 'Miami');


INSERT INTO orders VALUES
(101, 1, 250.00),
(102, 2, 300.00),
(103, 1, 150.00),
(104, 3, 400.00),
(105, 5, 500.00),
(106, 7, 700.00),
(107, 7, 200.00),
(108, 9, 350.00),
(109, 11, 600.00),  -- No matching customer
(110, 12, 800.00);  -- No matching customer

select * from customers;
select * from orders;

select * from customers as c  -- Inner join
inner join orders as o
 on c.customer_id=o.customer_id;

select * from customers as c  -- left join
 left join orders as o
 on c.customer_id=o.customer_id;
 
select * from orders as o  -- give same result of right join
 left join customers as c
 on c.customer_id=o.customer_id;
 
select * from customers as c   -- right join
 right join orders as o
 on c.customer_id=o.customer_id;
 
 
select * from customers as c  -- left join
 left join orders as o
 on c.customer_id=o.customer_id
 where o.order_id is null;
 
-- total amount spend for order placed by customer
select sum(o.order_amount) from customers as c  -- Inner join
inner join orders as o
 on c.customer_id=o.customer_id;
 
-- get total number of orders which are not places by customers
select count(o.order_id) from customers as c  
 right join orders as o
 on c.customer_id=o.customer_id where c.customer_id is null;
 
 
-- get total amount and avg amount spend for orders placed by customerid 3 and more than that
select sum(o.order_amount), avg(o.order_amount) from customers as c  
inner join orders as o
 on c.customer_id=o.customer_id where c.customer_id>=3;
 
-- self join:- 
CREATE TABLE employees (
    eid INT PRIMARY KEY,
    ename VARCHAR(100),
    salary DECIMAL(10,2),
    manager_id INT
);



INSERT INTO employees VALUES
(1, 'John', 90000, NULL),   -- Top-level manager (CEO)
(2, 'Alice', 75000, 1),
(3, 'Bob', 70000, 1),
(4, 'Emma', 65000, 2),
(5, 'Michael', 60000, 2),
(6, 'Sophia', 62000, 2),
(7, 'David', 58000, 3),
(8, 'Olivia', 55000, 3),
(9, 'James', 50000, 4),
(10, 'Isabella', 52000, 4);


select * from employees;

select eid, ename, manager_id, manager.eid from employees
join employees as manager 
where manager_id=manager.eid;
-- complete hacker rank upto 3 star