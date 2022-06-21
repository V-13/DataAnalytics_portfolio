-- Joining death and vaccination details

SELECT * FROM Covid_deaths AS dea
JOIN Covid_vaccinations AS vac
ON dea.location =vac.location AND dea.date = vac.date

--looking at total population vs Vaccination

SELECT dea.continent,dea.location,dea.date,dea.population,vac.new_vaccinations,
SUM(CONVERT(FLOAT,vac.new_vaccinations)) OVER(PARTITION BY dea.location ORDER BY dea.location,dea.date) AS Rolling_people_vaccinated
FROM Covid_deaths AS dea
JOIN Covid_vaccinations AS vac
ON dea.location =vac.location AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
ORDER BY location,date


--USING CTE to enhance above query

WITH popvac (Continent,Location,date,Population,new_vaccination,Rolling_vacc) AS
(
SELECT dea.continent,dea.location,dea.date,dea.population,vac.new_vaccinations,
SUM(CONVERT(FLOAT,vac.new_vaccinations)) OVER(PARTITION BY dea.location ORDER BY dea.location,dea.date) AS Rolling_people_vaccinated
FROM Covid_deaths AS dea
JOIN Covid_vaccinations AS vac
ON dea.location =vac.location AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
)
SELECT *,(Rolling_vacc/Population)*100 FROM popvac

--TEMP TABLE

DROP TABLE IF EXISTS #people_vacc

CREATE TABLE #people_vacc
(
Continent VARCHAR(50),
Location VARCHAR(50),
Date datetime,
Population FLOAT,
New_vaccination FLOAT,
Rolling_vaccination FLOAT
)

INSERT INTO #people_vacc
SELECT dea.continent,dea.location,dea.date,dea.population,vac.new_vaccinations,
SUM(CONVERT(FLOAT,vac.new_vaccinations)) OVER(PARTITION BY dea.location ORDER BY dea.location,dea.date) AS Rolling_people_vaccinated
FROM Covid_deaths AS dea
JOIN Covid_vaccinations AS vac
ON dea.location =vac.location AND dea.date = vac.date
WHERE dea.continent IS NOT NULL


SELECT *,(Rolling_vaccination/Population)*100 FROM #people_vacc
ORDER BY Location

-- creating views

CREATE VIEW PercentPopulationVaccinated AS
SELECT dea.continent,dea.location,dea.date,dea.population,vac.new_vaccinations,
SUM(CONVERT(FLOAT,vac.new_vaccinations)) OVER(PARTITION BY dea.location ORDER BY dea.location,dea.date) AS Rolling_people_vaccinated
FROM Covid_deaths AS dea
JOIN Covid_vaccinations AS vac
ON dea.location =vac.location AND dea.date = vac.date
WHERE dea.continent IS NOT NULL

SELECT * FROM PercentPopulationVaccinated
