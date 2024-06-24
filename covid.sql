/*this showcase the total cases and deaths around the world

SELECT 
    SUM(total_cases) AS total_cases_globally,
    SUM(total_deaths) AS total_deaths_globally
FROM Covid_deaths;*/
SELECT 
    SUM(total_cases) AS total_cases_globally,
    SUM(total_deaths) AS total_deaths_globally
FROM
    Covid_deaths;
/*this showcase the total number of cases and deaths by continent
SELECT 
    continent,
    SUM(total_cases) AS total_cases,
    SUM(total_deaths) AS total_deaths
FROM Covid_deaths
GROUP BY continent;*/
SELECT 
    continent,
    SUM(total_cases) AS total_cases,
    SUM(total_deaths) AS total_deaths
FROM
    Covid_deaths
GROUP BY continent;
/* Daily New Cases and Deaths for a Specific Country (e.g., United States)
SELECT 
    date,
    new_cases,
    new_deaths
FROM Covid_deaths
WHERE location = 'United States'
ORDER BY date;*/
SELECT 
    date, new_cases, new_deaths
FROM
    Covid_deaths
WHERE
    location = 'United States'
ORDER BY date;
/* Countries with the Highest Number of Cases and Deaths
SELECT 
    location,
    total_cases,
    total_deaths
FROM Covid_deaths
WHERE date = (SELECT MAX(date) FROM Covid_deaths)
ORDER BY total_cases DESC, total_deaths DESC
LIMIT 10;*/
SELECT 
    location, total_cases, total_deaths
FROM
    Covid_deaths
WHERE
    date = (SELECT 
            MAX(date)
        FROM
            Covid_deaths)
ORDER BY total_cases DESC , total_deaths DESC
LIMIT 10;
/*Trends in New Cases and Deaths Over Time Globally
SELECT 
    date,
    SUM(new_cases) AS new_cases,
    SUM(new_deaths) AS new_deaths
FROM Covid_deaths
GROUP BY date
ORDER BY date;*/
SELECT 
    date,
    SUM(new_cases) AS new_cases,
    SUM(new_deaths) AS new_deaths
FROM
    Covid_deaths
GROUP BY date
ORDER BY date;
/*Case Fatality Rate (CFR) by Country
SELECT 
    location,
    (SUM(total_deaths) / SUM(total_cases)) * 100 AS case_fatality_rate
FROM Covid_deaths
GROUP BY location
ORDER BY case_fatality_rate DESC
LIMIT 10;*/
SELECT 
    location,
    (SUM(total_deaths) / SUM(total_cases)) * 100 AS case_fatality_rate
FROM Covid_deaths
GROUP BY location
ORDER BY case_fatality_rate DESC;

/*SELECT 
    location,
    (SUM(total_deaths) / SUM(total_cases)) * 100 AS case_fatality_rate
FROM
    Covid_deaths
GROUP BY location
ORDER BY case_fatality_rate DESC;
Identify Countries with the Highest Increase in Cases Over the Last Month*/
SELECT 
    location,
    (SUM(total_deaths) / SUM(total_cases)) * 100 AS case_fatality_rate
FROM
    Covid_deaths
GROUP BY location
ORDER BY case_fatality_rate DESC;

/*Calculate the Rolling 7-Day Average of New Cases for Each Country
SELECT 
    location,
    date,
    new_cases,
    AVG(new_cases) OVER (PARTITION BY location ORDER BY date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS rolling_avg_new_cases
FROM Covid_deaths;*/
SELECT 
    location,
    date,
    new_cases,
    AVG(new_cases) OVER (PARTITION BY location ORDER BY date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS rolling_avg_new_cases
FROM Covid_deaths;
/*Determine the Continent with the Highest Case Fatality Rate
SELECT 
    continent,
    SUM(total_deaths) / SUM(total_cases) * 100 AS case_fatality_rate
FROM Covid_deaths
GROUP BY continent
ORDER BY case_fatality_rate DESC
LIMIT 1;*/
SELECT 
    continent,
    SUM(total_deaths) / SUM(total_cases) * 100 AS case_fatality_rate
FROM Covid_deaths
GROUP BY continent
ORDER BY case_fatality_rate DESC
LIMIT 1;
/*Find the Date with the Highest Number of New Cases Globally
SELECT 
    date,
    SUM(new_cases) AS total_new_cases
FROM Covid_deaths
GROUP BY date
ORDER BY total_new_cases DESC
LIMIT 1;*/
SELECT 
    date,
    SUM(new_cases) AS total_new_cases
FROM Covid_deaths
GROUP BY date
ORDER BY total_new_cases DESC
LIMIT 1;
/*Analyze the Relationship Between Population and Total Cases
SELECT 
    location,
    population,
    MAX(total_cases) AS total_cases,
    (MAX(total_cases) / population) * 100 AS cases_per_population_percentage
FROM Covid_deaths
GROUP BY location
ORDER BY cases_per_population_percentage DESC;*/
SELECT 
    location,
    population,
    MAX(total_cases) AS total_cases,
    (MAX(total_cases) / population) * 100 AS cases_per_population_percentage
FROM Covid_deaths
GROUP BY location
ORDER BY cases_per_population_percentage DESC;
SELECT 
    location,
    population,
    MAX(total_cases) AS total_cases,
    (MAX(total_cases) / population) * 100 AS cases_per_population_percentage
FROM Covid_deaths
GROUP BY location
ORDER BY cases_per_population_percentage DESC;
SELECT 
    location,
    DATE_FORMAT(date, '%Y-%U') AS week,
    SUM(weekly_hosp_admissions) AS total_weekly_hosp_admissions
FROM Covid_deaths
GROUP BY location, week
ORDER BY week DESC, total_weekly_hosp_admissions DESC;


