-- 7/March/2026
use windowdb;
show tables;

-- create statement
create table test (sno int);

-- insert statement (DML)
insert into test values(1000); -- only 1 row insert
insert into test values (89), (95); -- 2 row insert 


describe test; -- It tell the structure/ column name and datatypes
select * from test; -- access all the columns of test table

-- tinyint (1byte) 2^8 = 256 range(-128 to 127)
create table test2 (sno tinyint); -- it not allow less than -128 and more than 127
insert into test2 values (-122), (15);
insert into test2 values (true), (false);

select * from test2;

create table test3 (sno tinyint unsigned); -- It allows me from 0 to 255
insert into test3 values  (255);
select * from test3;

-- smallint 2 byte 2^16
-- mideum int 3 byte
-- int 4 byte 2^32
-- bigint 8 byte  2^64

create table test4 (sno int unsigned); -- It allows me from 0 to 255
insert into test4 values (4294967295);
select sno, sno+20 from test4;

create table test6 (ranks float, population double);
insert into test6 values (27.56784321), (27.56784321);
select * from test6;

-- M, D --> M= total digit, D= decimal digit
create table test7(amount double(5,3));
insert into test7 values(5.6789123);

select * from test7;


create table test8(city char(6));
insert into test8 values('isha');
insert into test8 values('aus');
insert into test8 values('is                ');
-- insert into test8 values('United States of America'); not tanken as length is more than 6 
select *, char_length(city) from test8;

-- difference in char and varchar  (interview question)

create table test9(city varchar(6));
insert into test9 values('isha');
insert into test9 values('aus');
insert into test9 values('is                ');
-- insert into test8 values('United States of America'); -- not tanken as length is more than 6 
select *, char_length(city) from test9;

-- constraint , primary, foreign, super key