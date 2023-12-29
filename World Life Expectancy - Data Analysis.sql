# World Life Expectancy Project 
# Data Analysis

SELECT *
FROM world_life_expectancy;

SELECT MIN(Year), Max(Year)
FROM world_life_expectancy;

# Min and Max Life Expectancy by Country

SELECT  Country, 
MIN(`Life expectancy`), 
MAX(`Life expectancy`),
ROUND((MAX(`Life expectancy`) - MIN(`Life expectancy`)),1) as Life_Increase_15_Years
FROM world_life_expectancy
GROUP BY Country
HAVING MIN(`Life expectancy`) <> 0 AND MAX(`Life expectancy`) <> 0
ORDER BY Life_Increase_15_Years DESC
;

# Life Expectancy by Year

SELECT Year, ROUND(AVG(`Life expectancy`),2)
FROM world_life_expectancy
GROUP BY Year
ORDER BY Year
;

# Exploring Correlation between life expectancy and GDP

SELECT Country, ROUND(AVG(`Life expectancy`),2) AS Life_Exp, ROUND(AVG(GDP),1) AS GDP
FROM world_life_expectancy
GROUP BY Country
HAVING Life_Exp > 0
AND GDP > 0
ORDER BY GDP DESC
;

SELECT 
SUM(CASE WHEN GDP >= 1500 tHEN 1 ELSE 0 END) HIgh_GDP_Count,
AVG(CASE WHEN GDP >= 1500 THEN `Life Expectancy` ELSE NULL END) High_GDP_Life_Exp,
SUM(CASE WHEN GDP <= 1500 tHEN 1 ELSE 0 END) Low_GDP_Count,
AVG(CASE WHEN GDP <= 1500 THEN `Life Expectancy` ELSE NULL END) Low_GDP_Life_Exp
FROM world_life_expectancy
;

# Average Life Expectancy by Status

SELECT Status, COUNT(DISTINCT Country), ROUND(AVG(`Life Expectancy`),1)
FROM world_life_expectancy
GROUP BY Status
;

# By BMI

SELECT Country, ROUND(AVG(`Life expectancy`),2) AS Life_Exp, ROUND(AVG(BMI),1) AS BMI
FROM world_life_expectancy
GROUP BY Country
HAVING Life_Exp > 0
AND BMI > 0
ORDER BY BMI DESC
;

# Life Expectancy and Adult Mortality Rates

SELECT Country,
Year,
`Life Expectancy`,
`Adult Mortality`,
SUM(`Adult Mortality`) OVER(PARTITION BY Country ORDER BY Year) AS Rolling_Total
FROM world_life_expectancy
;