-- 25/Feb/2026
-- difference in exist and in keyword
-- corelated with group by
-- 25/Feb/2026
select * from world.city;
select * from world.country;

-- show city whose population is higher than avg city population of their country
select name, c.Population, c.CountryCode from world.city as c where Population>
(select avg(Population) from city where CountryCode=c.CountryCode);

-- find city which have max population within their country
select * from world.city as c where Population =
(select max(Population) from city where CountryCode=c.CountryCode); 

-- find all city and countryname whose population is greater than the avg population of city in same country
select c.Name, wc.Name  from world.city as c join world.country as wc where population >
 (select avg(population) from world.city where CountryCode=c.CountryCode);
 
-- get continent name who have total countries greater than total num of countries in south america
select count(name) from world.country where continent='South America';

select continent, count(Name) from world.country as co group by continent having count(Name)>
(select count(name) from world.country where continent='South America');

-- window function 
-- difference in window and group by 
-- advantages and disadvantages of windows function 