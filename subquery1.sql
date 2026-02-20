-- 19/Feb/2026
-- subquery: Query within a Query

-- get city name and district where district is same as of amesterdam
select district from world.city where name='amsterdam'; 
select name, district from world.city where district='Noord-Holland';

-- select city name & country code where contry code should be same as haag city
select countrycode from world.city where name='haag' ;
select name, countrycode from world.city where countrycode='nld';

select name, countrycode from world.city 
where countrycode=(select countrycode from world.city where name='haag');

-- multirow and (imp.)corelated sub Query