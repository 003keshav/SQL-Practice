-- 9/March/2026
-- ddl , datatypes

use windowdb;
show tables;
create table test_date( dob date);
insert into test_date values('2026-08-22'); -- yyyy-mm-dd otherwise give an error

select * from test_date;

-- save an image in sql database
-- which data type, how it will be stored
-- make foreign key (should have reffered table whith primary key)
   
   
   
-- constraints:- are set of  rules to apply on the table column to avoid invalid data entry
-- not null
create table test10(salary int , age int not null );
insert into test10 values(1000,18), (2000,30), (null,50000);
select * from test10;

-- default
create table test101(salary int default 2000, age int not null default 21);
insert into test101(salary) values(50000);
insert into test101(age) values(50);
select * from test101;

-- unique:- it can have multiple null value but not use default for another time
create table test1001(salary int unique default 2000, age int);
insert into test1001 values(null,23);
insert into test1001 values(30000,50);
insert into test1001 values(30500,null);

select * from test1001;

-- check
drop table test20;
create table test20(salary int, age int 
                      constraint windowd_test20_age_21 check (age>21));
insert into test20 values(40000,13);
select * from test20;


-- primary key: can't be dublicate and null
drop table test201;
create table test201(a int primary key, b int); 
insert into test201 values(1,100);
insert into test201 values(2,500);

select * from test201;

drop table test202;
create table test202(a int, b int,
                     primary key(a,b)); -- single values can be same in this but pair cannot be same
insert into test202 values(1,100);
insert into test202 values(1,10);
insert into test202 values(3,100);
insert into test202 values(2,100);

select * from test202;

