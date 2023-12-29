# World Life Expectancy
## Project Overview

### Introduction

The World Life Expectancy Project focuses on cleaning and analyzing data related to life expectancy across various countries using MySQL. The dataset used for this analysis is 'world_life_expectancy.csv' and can be downloaded from this repository. The project aims to uncover insights into life expectancy trends, explore correlations with other factors such as GDP, BMI, and Adult Mortality, and provide a comprehensive overview of the dataset.

### Data Cleaning

The Data Cleaning phase of the World Life Expectancy Project focuses on preparing the 'world_life_expectancy' dataset for analysis by addressing duplicates, missing values in "Status," and imputing missing values in "Life Expectancy."

#### Key Steps

<b/>1. Identifying Duplicates</b>
- Concatenated Country and Year for duplicate identification.
- Deleted duplicates using the row_number() function.

<b/>2. Handling Missing Values in "Status"</b>
- Identified and updated missing "Status" values based on existing data.
- Categorized countries as "Developing" or "Developed."

<b/>3. Handling Missing Values in "Life Expectancy"</b>
- Identified and imputed missing "Life Expectancy" values by averaging neighboring years.

### Data Analysis

- Countries with the highest increases in life expectancy over 15 years are highlighted.
- Average life expectancy for each year is calculated, providing insights into overall trends over time.
- The analysis explores the correlation between life expectancy and Gross Domestic Product (GDP) for each country.
- Countries are categorized based on GDP levels (above or below 1500) and analyzes life expectancy in each category.
- Average life expectancy based on the "Status" of each country, distinguishing between developed and developing nations.
- Relationship between life expectancy and Body Mass Index (BMI) for each country is explored.
- Relationship between life expectancy and Adult Mortality rates, with a focus on rolling totals for each country over the years is calculated.

### Conclusion

The Data Cleaning script ensures the integrity of the dataset by eliminating duplicates and addressing missing values in critical fields. This sets the stage for accurate and reliable analysis in subsequent phases of the World Life Expectancy Project. Utilizing SQL queries, this project provides concise insights into global life expectancy patterns, correlations with GDP, BMI, and Adult Mortality, aiding a comprehensive understanding of health trends worldwide.


