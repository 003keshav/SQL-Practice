-- 24/March/2026
/* TCL(Transaction Control Language): Transaction means group of multiple statements that execute together
4 ACID properties
A - Atomicity         All or Nothing
C - Consistency       Valid State Always
I - Isolation         Transection Seperate
D - Durability        Saved Permanently
*/
select @@autocommit;
-- create table as select (CTAS)
create table ctedb.test1000 as
select actor_id, first_name from sakila.actor
where actor_id between 1 and 4;

select * from ctedb.test1000;

update ctedb.test1000 set first_name='Sam' where actor_id=2;
select * from ctedb.test1000;

-- to start the transection there are 2 ways
-- 1. Start Transection (start keyword)
-- 2. 
select @@autocommit;
start transaction;
update ctedb.test1000 set first_name='RAJ' where actor_id=1;
select * from ctedb.test1000;

-- To End Transaction
/* commit
   rollback
   DDL statement(implicit)
   Session Ends/Crash               */
start transaction;
update ctedb.test1000 set first_name='RAJ' where actor_id=1;
commit;
select * from ctedb.test1000;
   


start transaction;
update ctedb.test1000 set first_name='RAJ06' where actor_id=3;
select * from ctedb.test1000;
rollback;


start transaction;   -- (or) set autocommit=0
delete from ctedb.test1000 where actor_id=1;
select * from ctedb.test1000;
create table ctedb.tablee(emp_name int);


start transaction;
update ctedb.test1000 set first_name='Raju' where actor_id=2;
insert into ctedb.test1000 values(10,'ujjwal');

savepoint checkpoint;
delete from ctedb.test1000 where actor_id=3;
rollback to checkpoint;  -- revert to specific checkpoint
select * from ctedb.test1000;
commit;


start transaction;
update ctedb.test1000 set first_name='sbdhhu' where actor_id=2;
insert into ctedb.test1000 values(11,'ubfvuhe');

savepoint checkpoint2;
delete from ctedb.test1000 where actor_id=1;
select * from ctedb.test1000;

release savepoint checkpoint2;
commit;
