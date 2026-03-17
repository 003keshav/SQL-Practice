-- 16/March/2026
-- case, if-else
use world;
select count(indepyear), count(ifnull(indepyear,0)) from world.country;

-- coalesce will written first value given in any necessary column
select name, IndepYear, LifeExpectancy, GNPOld, coalesce(IndepYear, LifeExpectancy, GNPOld) from world.country;

-- general functions
-- if
select name, population, if(population>10000, 'Large Population', if(population>5000, 'Medium P', 'Small P')) from country;

-- in case if the population >20000 & name start with 'a' then print verey large country otherwise if population>25000 then print small country
select name, Population, if(
population>20000 and name like 'A%', 'very large country', if(
population>25000, 'small country','medium country')) 
from world.country;

/*
select column,
case
	when condition then expression
    when condition then expression
end from table
*/


select name, population,
case
    when population>25000 then 'V L population'
    when population>15000 then 'Large population'
else 'Normal population'
end    from world.country;

select * from country;
-- select name, continent, population if indp is from 1600-1850 then print early independence if indyear is from 1800-1900 then print normal independence
-- if independence is even then print even year independence else late/early independence
select name, continent, population, IndepYear,
case
    when IndepYear between '1600' and'1850' and IndepYear%2=0 then 'early indep/even indep'
    when IndepYear between '1600' and'1850' then 'early indep'
    when IndepYear between '1800' and '1900' and IndepYear%2=0 then 'normal indep/even indep'
    when IndepYear between '1800' and '1900' then 'normal indep'
    else 'late/early indep'
end
from world.country;