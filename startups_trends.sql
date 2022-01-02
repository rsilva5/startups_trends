-- take a look at the startups table:
SELECT *
FROM startups;
-- 10 total columns: name, locations, category, employees, raised, valuation, founded, stage, ceo, info

-- Calculate the total number of companies in the table.
SELECT COUNT(name)
FROM startups;
-- 70 total companies 

-- We want to know the total value of all companies in this table.
SELECT name, valuation
FROM startups
ORDER BY valuation;

SELECT SUM(valuation) AS total_value_of_all_companies
FROM startups;
-- Total value of all companies is 974455790000

-- What is the highest amount raised by a startup?
SELECT name, MAX(raised)
FROM startups;
-- The highest amount raised by a startup is 11500000000

-- Edit the query so that it returns the maximum amount of money raised, during ‘Seed’ stage.
SELECT name, MAX(raised) AS max_raised_at_seed_stage
FROM startups
WHERE stage = "Seed";
--The max amount of money raised during Seed stage is 1800000

-- Edit the query so that it returns the maximum amount of money raised, during ‘Seed’ stage.
SELECT name, MIN(founded)
FROM startups;
--The oldest company the list was founded in 1994

-- Return the average valuation.
SELECT AVG(valuation)
FROM startups;
-- The average valuation was 15974685081.9672

-- Return the average valuation, in each category.
SELECT category, ROUND(AVG(valuation),2)
FROM startups
GROUP BY category
ORDER BY AVG(valuation) DESC;
-- The category with the highest average valuation was Health Care

-- First, return the name of each category with the total number of companies that belong to it.
SELECT category, COUNT(*)
FROM startups 
GROUP BY category
ORDER BY COUNT(*);
-- Social has the most total companies 

-- Next, filter the result to only include categories that have more than three companies in them.
SELECT category, COUNT(*)
FROM startups 
GROUP BY category
HAVING COUNT(*) >3;
-- The most competitive markets are education, mobile, and social 

SELECT location, SUM(employees)
FROM startups 
GROUP BY location
ORDER BY SUM(employees);

-- What is the average size of a startup in each location?
SELECT location, ROUND(AVG(employees),2)
FROM startups 
GROUP BY location
ORDER BY AVG(employees);

-- What is the average size of a startup in each location, with average sizes above 500?
SELECT location, ROUND(AVG(employees),2)
FROM startups 
GROUP BY location
HAVING ROUND(AVG(employees),2) > 500;
