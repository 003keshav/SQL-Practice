-- 25/March/2026

/* DCL (Data Control Language)
It is use to give control acces right or permission on the data base
have 2 Commands
1. Grant:    Give permission to a user
2. Revoke:   To take permission from user
*/
create table ctedb.test11 as
select actor_id, first_name from sakila.actor
where actor_id between 1 and 4;
select * from ctedb.test11;

select current_user();


-- query to see the permissions
show grants for root@localhost;

-- to create user
create user sam identified by 'samp';
show grants for sam;

-- grant privilege(column_name) on db.object_name to user 
grant select on ctedb.test11 to sam;  -- (ctedb.*) for giving permission to show all tables in ctedb database
show grants for sam;

grant insert, update on ctedb.* to sam;
show grants for sam;

grant select(first_name) on ctedb.test11 to sam;
show grants for sam;

grant all privileges on ctedb.* to sam;
show grants for sam;

-- flush privileges    -- Apply changes immedietly

revoke insert, update on ctedb.test11 from sam;
show grants for sam;

revoke all privileges  on ctedb.* from sam;
show grants for sam;

select current_user();
create user test identified by 'test';
grant all privileges on ctedb.* to test
   with grant option;
  with grant option;
  
  
  
-- create a role in mysql
-- create 2 user naman and adersh
-- check permission for both users
-- assign role to user adersh 
-- check grants for adersh
-- assign select privilege to the role
-- verify select statement


create user naman identified by 'naman';
create user adersh identified by 'adersh';

create role 'role1';
grant all privileges on ctedb.* to 'role1'
   with grant option;
grant 'role1' to adersh;
grant 'role1' to naman;
show grants for naman;
show grants for adersh;

show grants for role1;