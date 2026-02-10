-- 9/Feb/2026
show databases;
use world;
show tables;
select * from country;

select sum(population) from country;

select sum(population) from country 
where continent ='Asia';

select continent, sum(population) from country group by continent;

select region, sum(population) from country group by region;

select continent, region, sum(population) from country group by continent, region;

select continent, count(name) from country group by continent;

select IndepYear, count(name)   from country group by IndepYear;

-- find country get Indep. for each year in  each continet
select continent, IndepYear, count(name) from country group by continent, IndepYear;

select continent, count(name) as totalcountry from country 
group by continent having totalcountry>=30;
-- 1. where is use before group by
-- 2. where clause filter only column which exist in original table
-- 3. where clause generally are not used on aggeragate functions
-- 4. having clause is use to filter rows based on aggeragate function
-- 5. having clause cannot be used without group by
-- 6. having clause will use after group by


-- find continent name and avg populationonly for where avg population > 1/2 million
select continent, avg(population) as popul from country group by continent having popul>500000;

select * from country;
-- get avg population total country for each govt form only country get indep after 1890 and have atleast 4 countries
select Governmentform, avg(population), count(name) as count from country
where IndepYear>1890 group by Governmentform having count>=4;

-- primary key , foregin key 
--  what is normalization
--  what is first nf and 2 nf 