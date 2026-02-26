-- 21/Feb/2026
select * from world.country;

select continent from world.country where name='Armenia';

select * from world.country where continent=
(select continent from world.country where name='Armenia');

-- country info where region same as all region of europe
select * from world.country where region in
(select region from world.country where continent='Europe');

-- get all country name whose population = highest population of europe
select name from world.country where population=
(select max(population) from world.country where continent='Europe');

-- get all country info where population > among all population of africa
select * from world.country where population >all 
(select population from world.country where continent='Africa');

