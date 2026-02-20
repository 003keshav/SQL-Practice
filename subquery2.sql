-- 20/Feb/2026
use sakila;

select * from sakila.payment;
-- get all columns with lowest payment_id
select min(payment_id) from sakila.payment;
select * from sakila.payment where payment_id=
(select max(payment_id) from sakila.payment);

-- get all payment info with highest rental id
select * from sakila.payment where rental_id=
(select max(rental_id) from sakila.payment);


-- get all payment info for earliest payment date
select * from sakila.payment where payment_date=
(select min(payment_date) from sakila.payment);

-- get all payment info where amount is same as of payment_id 5 
select * from sakila.payment where amount=
(select amount from sakila.payment where payment_id=5);


-- get all payment info where amount is greater than the avg amount of payment table
select * from sakila.payment where amount>
(select avg(amount) from sakila.payment);


-- get all payment info where amount is greater than the max amount of customer_id 1
select * from sakila.payment where amount>
(select max(amount) from sakila.payment where customer_id=1);

-- find payment_id staff_id and amount only for payment where month= month of payment_id 4
select payment_id, staff_id, amount from sakila.payment where month(payment_date)=
(select month(payment_date) from sakila.payment where payment_id=4);

-- get highest payment_id from table where amount is same of payment_id 11 & customer_id 1
select max(payment_id) from sakila.payment where amount=
(select amount from sakila.payment where payment_id=11 and customer_id=1);

-- 1.single row 
-- 2. multi row single column
-- 3. multi row multi column
-- 4. corelated


-- we cannot use operators like > , < , <= , >= , != in multi row sub queries
-- in / =any both works same
select * from sakila.payment where amount in
(select amount from sakila.payment where payment_id=3 or payment_id=6);

-- get all payment info where customer_id is same as customer_id of payment_id 3 or 250
select * from sakila.payment where customer_id in
(select customer_id from sakila.payment where payment_id=3 or payment_id=250);

select customer_id from sakila.payment where payment_id=3 or payment_id=250;
select * from sakila.payment where customer_id=1 or customer_id=9; 

select * from sakila.payment where customer_id >any
(select customer_id from sakila.payment where payment_id=3 or payment_id=250);
-- =all will not work
-- >all 
select * from sakila.payment where amount >all
(select amount from sakila.payment where payment_id=3 or payment_id=6);
-- <all
-- <=all
-- >=all


-- get all payment info where the amount > any amount of payment_id 1 and 3
select * from sakila.payment where amount >any
(select amount from sakila.payment where payment_id=1 or payment_id=3);

--  get all the payment info where amount > among all the payment of customer_id 1
select* from sakila.payment where amount >all
(select amount from sakila.payment where customer_id=1);