SELECT Location,date,total_cases,new_cases,total_deaths,population 
FROM [Portfolio Project]..[Covid_deaths]
ORDER BY 1,2

--Looking at total_case vs Total_deaths

SELECT location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 AS Death_Percentage FROM Covid_deaths
ORDER BY 1,2

-- Death percentage country wise

SELECT Location,SUM(total_cases),SUM(total_deaths),(SUM(total_deaths)/SUM(total_cases))*100 AS death_percentage FROM Covid_deaths
GROUP BY location
ORDER BY death_percentage DESC

-- Looking at total case vs population

SELECT location,MAX(total_cases),AVG(population),(MAX(total_cases)/AVG(population))*100 AS Covid_percentage FROM Covid_deaths
GROUP BY location
ORDER BY Covid_percentage DESC

--Countries with high death count per population.

SELECT TOP 10 location,MAX(total_deaths) AS total_deaths_,AVG(population) AS Total_population ,(MAX(total_deaths)/AVG(population))*100 AS Percentage_deaths FROM Covid_deaths
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY total_deaths_ DESC

-- Contintents data 

SELECT continent,MAX(total_deaths) AS total_deaths_,AVG(population) AS population_,(MAX(total_deaths)/AVG(population))*100 AS Percentage_deaths
FROM Covid_deaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY Percentage_deaths DESC

--Global Data

SELECT SUM(new_cases) AS total_cases,SUM(CAST(new_deaths AS INT)) AS Total_deaths,
SUM(CAST(new_deaths AS INT))/SUM(new_cases)*100 AS Death_Percentage
FROM Covid_deaths
WHERE continent IS NOT NULL

SELECT TOP 5 * FROM Covid_deaths
