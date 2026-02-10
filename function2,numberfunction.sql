show databases;
use sakila;
select first_name , concat('Mr.', first_name), substr(first_name, -2) from actor;

select first_name , substr(first_name, -2), substr(first_name, -4,2) from actor;

-- trim (select values) only for testing purpose
select 'abhishek';
select char_length(trim('abhis  ')); -- char_length() use to count characters
select char_length(trim('    abhis'));  
select char_length('abhis  h e k'); -- trim not remove the spaces between the value

-- naman
select trim(both 'a' from 'aaanaman');

-- apply on column
select first_name, trim(both 'E' from first_name) from actor;

--  lpad/ rpad (left padding / right padding)
select lpad('1094', '6','@');

-- functions mostly used concat, lpad, trim, char_length, substr

-- Number functions --> round() 
select round(22.48); -- convert to 22 check 0.4
select round(25.45,1); -- convert to 25.5 check 0.05
select round(25.48,-1); -- contert to 30 check 5

select round(14.678,2), truncate(26.678,-1);-- truncate print values 
select floor(5.99999), ceil(5.0000001); 

-- distinct remove dublicate values
select distinct(amount) from payment;

-- count(rows)
select count(first_name) from actor;
select count(distinct(first_name)) from actor;