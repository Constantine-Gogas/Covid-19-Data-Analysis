--[1]--Global Numbers------------------------------------------------------------------------

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths,
	   SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as deathPercentage
From Covid19..CovidDeaths
where continent is not null
order by 1,2

------------------------------------------------------------------------------------
--[2]--Total Death Count per Continent------------------------------------------------
Select location, SUM(cast(new_deaths as int)) as TotalDeathCount
From Covid19..CovidDeaths
Where continent is null 
and location not in ('World', 'European Union', 'International', 'Upper middle income'
, 'High income', 'Lower middle income', 'Low income')
Group by location
order by TotalDeathCount desc

------------------------------------------------------------------------------------------
--[3]--Total Infection per Country ----------------------------------------------------
Select location, population, MAX(total_cases) as HighestInfectionCount, 
	   MAX((total_cases/population))*100 as PercentPopulationInfected
From Covid19..CovidDeaths
Group by location, population
order by PercentPopulationInfected desc

-------------------------------------------------------------------------------------------
--[4]--Percent Population Infected ----------------------------------------------------

Select location, population,date, MAX(total_cases) as HighestInfectionCount,
	   MAX((total_cases/population))*100 as PercentPopulationInfected
From Covid19..CovidDeaths
Group by location, population, date
order by PercentPopulationInfected desc

-----------------------------------------------------------------------------------------------