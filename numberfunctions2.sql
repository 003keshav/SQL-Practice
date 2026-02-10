-- 5/Feb/2026
-- String and Number functions
-- substr, trim, licate, char_length, lpad/rpad
-- round, truncate, floor, ceil --> mod, pow, sqrt

-- date function
select curdate(), current_time(), current_timestamp(), now(); 
select now(), adddate(now(),2);   -- use with current time
use sakila;
select payment_date, adddate(payment_date, 2) from payment; -- use where already date given
select now(), adddate(now(), interval 2 year); -- current time ke saath
select now(), subdate(now(), interval 2 year);

-- extract function
select now(), extract(month from now());
select now(), extract(hour from now());
select now(), extract(week from now()); 
select now(), extract(quarter from now());

select paymemt_date, month(payment_date),
date_format(payment_date,'current month is %c') from payment;

select *, month(payment_date) from payment
where month(payment_date)=5;


-- multi row functions (aggregate functions --> which will be used for calculation)
-- sum()  count(), max(), min(), avg()
select sum(amount), count(amount), max(amount) from payment;
select count(*) from payment
where month(payment_date) in (5,6);

-- total amount and number of transection done for amount >5$ and after march month
select sum(amount), count(amount) from payment
where amount>5 and month(payment_date) >3;
-- we cannot select non aggregate column with aggregate column

select distinct customer_id, amount from payment; 
select distinct amount, staff_id from payment; -- combination of amount and staff_id should be unique
-- we cannot choose any column before distinct function it will give an error
-- distinct colum1, colum2 --> combination of 2 columns
-- colum1 distinct colum2 --> give an error


-- find total customer and total unique customer  done the payment in the last day of month where amount >0.5
select count(customer_id), count(distinct(customer_id)) from payment
where date(payment_date)=last_day(payment_date) and amount>0.5;

-- 1. what is group by   2. difference in group by and distinct keyword