-- 19/March/2026
-- set operations : union, union all, except, intersect
select code, name, continent from world.country where continent='Europe'
union 
select code, name, population from world.country where continent='Asia';


select code, name, continent from world.country where code in ('ALB', 'AND')
union all 
select code, name, population from world.country where code in ('ALB', 'BIH');


select code, name, continent from world.country where code in ('ALB', 'AND')
except
select code, name, continent from world.country where code in ('ALB', 'BIH');


select code, name, continent from world.country where code in ('ALB', 'BIH')
intersect
select code, name, continent from world.country where code in ('ALB', 'AND');

-- Assignment : Recursive cte