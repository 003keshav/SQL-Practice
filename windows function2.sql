-- 5/March/2026
-- windows function
select * from windowdb.sales;

select *, row_number() over(partition by customer_name) from windowdb.sales;

select *, rank() over(order by amount),
dense_rank() over(order by amount) from windowdb.sales;

-- find 2nd higest amount
select * from
(select *, dense_rank() over(order by amount desc) as rankings from windowdb.sales) as tab
where rankings=3;

-- lag function
select *, lag(amount,1,0) over(partition by customer_name) from windowdb.sales;

select *, lag(sale_date,1) over() as prevdate, datediff(sale_date, lag(sale_date,1) over()) from windowdb.sales

-- ROW BETWEEN it is a clause which is use to define a window frame and it is use to perform the calculation like (running sum) and moving avg
-- running sum of data 
select *, sum(amount) over(order by amount rows between unbounded preceding and current row) from windowdb.sales;
select *, sum(amunt) over(order by amount rows between unbounded preceding and current row) from windowdb.sales;


-- running avg
select *, avg(amount) over(order by amount rows between unbounded preceding and current row) from windowdb.sales;

select *, avg(amount) over(order by amount rows between 2 preceding and current row) from windowdb.sales;

-- Assignment (1.) N-tie  2). data types:- int, tiny-int, small-int, big-int, var-char and char
-- how to create and insert an element in table