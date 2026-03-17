-- 14/March/2026
-- constraint
-- foreign key:- constraints which is used to make the relationship
-- 1 table can have multiple foreign key
-- foreign key refers to primary key of another table
use testdb;
drop table cust;
drop table ord;
create table cust( id int unique key, name varchar(20));
insert into cust values(1, 'Tiger'), (2,'Yash');

delete from cust where id=2; -- step 2

select * from cust;

create table ord( id int, cid int, price int,
foreign key (cid) references cust(id) on delete cascade) ;

insert into ord values(100, 1, 2000), (101, 2 , 3999);
insert into ord values(100, 6, 5000) ;-- error

delete from ord where cid=2;  -- step 1

select * from ord;


drop table order1;
create table cu( id int unique key, name varchar(20));
insert into cu values(1, 'Lion'), (2,'Yashika');
select * from cu;

create table order1( id int, cid int, price int,
foreign key (cid) references cu(id) on delete set null); -- on delete cascade:- use to delete id and cid in both tables at once
 -- on delete set null:- helps to delete a single row from cu table while in order1 will show null at position on that foreign key
insert into order1 values(100, 1, 3000), (101, 2 , 4999);

delete from cu where id=2;
select * from order1;


-- data manupulation : create, insert, delete, update
drop table cust2;
create table cust2( id int primary key, name varchar(20));
insert into cust2 values(1, 'Tiger'), (2,'Yash');
insert into cust2 values(3, 'naina');
select * from cust2;
delete from cust2 where id=1;


create table cust3( id int, name varchar(20));
insert into cust3 values(1, 'Tiger'), (2,'Yash'), (3, 'Tiger');

select * from cust3;

select c1.id, c1.name, c2.id, c2.name from cust3 as c1 
join cust3 as c2 where c1.name=c2.name and c1.id < c2.id;

delete c2 from cust3 as c1 inner join cust3 as c2 
on c1.name=c2.name where c1.id < c2.id;
select * from cust3;

update cust3 set name= 'Heena', id=100 where name = 'yash';