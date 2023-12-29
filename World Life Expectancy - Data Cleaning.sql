# World Life Expectancy Project 
# Data Cleaning

select *
from world_life_expectancy
;

#Identifying duplicates

select Country, Year, concat(Country, Year), count(concat(Country, Year))
from world_life_expectancy
group by Country, Year, (concat(Country, Year))
having count(concat(Country, Year)) > 1
;

#Deleting duplicates using row_num

delete from world_life_expectancy
where Row_ID in (
				select Row_ID
				from (
					select Row_ID,
					concat(Country, Year),
					row_number() over (partition by concat(Country, Year) order by concat(Country, Year)) as Row_Num
					from world_life_expectancy
					) as row_table
				where Row_Num > 1
                )
;

#Checking for missing values in status and updating

select *
from world_life_expectancy
where Status = ''
;

select distinct(status)
from world_life_expectancy
where Status <> ''
;

update world_life_expectancy t1
join world_life_expectancy t2
	on t1.Country = t2.Country
set t1.status = 'Developing'
where t1.status = ''
and t2.status <> ''
and t2.status = 'Developing'
;

update world_life_expectancy t1
join world_life_expectancy t2
	on t1.Country = t2.Country
set t1.status = 'Developed'
where t1.status = ''
and t2.status <> ''
and t2.status = 'Developed'
;

select *
from world_life_expectancy
where Status is null
;

# Checking for missing values in Life Expectancy and updating

select *
from world_life_expectancy
where `Life expectancy` = ''
;

select t1.Country, t1.Year, t1.`Life expectancy`, 
t2.Country, t2.Year, t2.`Life expectancy`, 
t3.Country, t3.Year, t3.`Life expectancy`,
round((t2.`Life expectancy` + t3.`Life expectancy`)/2,1)
from world_life_expectancy t1
join world_life_expectancy t2
	on t1.Country = t2.Country
    and t1.Year = t2.Year + 1
join world_life_expectancy t3
	on t1.Country = t3.Country
    and t1.Year = t3.Year - 1
where t1.`Life expectancy` = ''
;

update world_life_expectancy t1
join world_life_expectancy t2
	on t1.Country = t2.Country
    and t1.Year = t2.Year + 1
join world_life_expectancy t3
	on t1.Country = t3.Country
    and t1.Year = t3.Year - 1
set t1.`Life expectancy` = round((t2.`Life expectancy` + t3.`Life expectancy`)/2,1)
where t1.`Life expectancy` = ''
;





