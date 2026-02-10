-- date:- 3/Feb/2026
show databases;
use sakila;
-- functions
-- block of code which is readable and reuseable
-- pre-defined and user defined functions
-- pre-defined are scalar function which apply on each row and result will be given for each row
-- string (character), number, date related functions
-- string relsted function (today at 3rd feb)

SELECT 
    first_name, LOWER(first_name), last_name, UPPER(last_name)
FROM
    actor;

-- concat "hey" + "hello" concat('hey','hello')
-- var="regex"    var+"software"
SELECT 
    first_name,
    last_name,
    CONCAT('Mr.', ' ', first_name, ' ', last_name)
FROM
    actor;

-- extract all data first_name+last_name='EDCHASE'
SELECT 
    *
FROM
    actor
WHERE
    CONCAT(first_name, last_name) = 'EDCHASE';
-- combine where concat(coll1,coll2)='EDCHASE'
SELECT 
    *, CONCAT(first_name, last_name)
FROM
    actor
WHERE
    CONCAT(first_name, last_name) LIKE '%a%a%';

-- concat with a seperator
SELECT 
    first_name,
    last_name,
    CONCAT('Mr.', ' ', first_name, ' ', last_name),
    CONCAT_WS('_', 'Mr.', first_name, last_name)
FROM
    actor;

-- sub-string -> extract a postion of data (extract data basis of position)
SELECT 
    first_name, last_name, SUBSTR(last_name, 2, 5)
FROM
    actor;

SELECT 
    *
FROM
    actor
WHERE
    first_name LIKE 'a%'
        OR first_name LIKE 'e%';

SELECT 
    *, SUBSTR(first_name, 1, 1)
FROM
    actor
WHERE
    SUBSTR(first_name, 1, 1) = 'a'
        OR SUBSTR(first_name, 1, 1) = 'e';

-- replace : it replace a character or value
SELECT 
    first_name, REPLACE(first_name, 'A', '@')
FROM
    actor;
-- Assignment 1. trim function  2. locate or INSTR   3. what is my_sql  