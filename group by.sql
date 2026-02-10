-- 6/Feb/2026
use sakila;
select sum(amount) from payment;
select count(amount) from payment;
select max(amount) from payment;
select min(amount) from payment;
select avg(amount) from payment;

select sum(amount), count(customer_id) from payment
where customer_id=2 or customer_id=3;

-- GROUP BY :--
-- it is statement to group semilar values 
-- groups will be created on basis of unique values
-- we can select only columns on which column group by is applied
select distinct customer_id, sum(amount), count(customer_id) from payment 
group by customer_id;

select count(*), sum(amount) from payment where payment_id=3;
select * from payment;
-- 1. find how many time each amount is visible
select amount, count(amount) from payment
group by amount;
-- 2. try to get total amount, max amount and total transections done by each customer
select distinct customer_id, sum(amount), max(amount), count(amount) from payment
group by customer_id;
-- 3. find out total amount spend by each staff along with the number of customer they served only after the payment id 9
select distinct staff_id, sum(amount), max(amount), count(customer_id) from payment
where payment_id>9 group by staff_id;
-- 4. find the total amount spend, avg amount, total transection done in each month
select month(payment_date), sum(amount), avg(amount), count(payment_id) from payment
 group by month(payment_date);
 -- 5. get total, max, avg amount for 2st week of each month for may,june,july
 select month(payment_date), sum(amount), max(amount), avg(amount) from payment
 where month(payment_date) in (5,6,7) and day(payment_date) between 7 and 14 
 group by month(payment_date);