-- 11/Feb/2026
show databases;
use testdb;
select * from customers;
select * from orders;

select o.orderid, o.pname, o.price, o.customerid from orders as o;
select c.customerid, c.name from customers as c;

select o.orderid, o.pname, o.price, o.customerid,
c.customerid, c.name from orders as o
join customers as c where o.customerid=c.customerid;

use world;
select * from country;
select * from city;

-- get city id, name and country code for city
-- get country code, name, continent, population for each country
-- get ciyt id, name, country name for each city present in table


select cty.id, cty.name, cty.countrycode from city as cty;
select cy.code, cy.name, cy.continent, cy.population from country as cy;

select ci.id, ci.name, ci.countrycode, cy.name, cy.population from city as cty
 join country as cy where ci.countrycode=cy.code
 where ci.countrycode=cy.code and cy.name='South Africa';
 
-- country table and langyage
--  find country name and all languages spoken in that country
select * from country;
select * from countrylanguage;

select cl.language, coy.name from country  as coy
join countrylanguage as cl
where coy.code=cl.countrycode;

-- using new syntax   it is inner-join
select cl.language, coy.name from country  as coy
join countrylanguage as cl
on coy.code=cl.countrycode where cl.language='English';

-- 1. types of joins:- (imp.) inner, (imp.) left, right, full outer, (imp. for interviews) self-join 