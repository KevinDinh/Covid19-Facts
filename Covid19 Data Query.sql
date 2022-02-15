----Explore dataset
SELECT * FROM COVID19
WHERE continent IS not NULL


--- Total case, total deaths and death percentage at global scale ---------------
select SUM(cast(new_cases as int)) as TotalCases, sum(cast(new_deaths as int)) as TotalDeaths 
	,sum(cast(new_deaths as decimal))/sum(cast(new_cases as int))*100 as DeathPercentage
from COVID19
where continent is not null

--- Total cases and total Deaths Per Continent ---------------
select continent, SUM(cast(new_cases as int)) as TotalCases, sum(cast(new_deaths as int)) as TotalDeaths
      ,sum(cast(new_deaths as decimal))/sum(cast(new_cases as int))*100 as DeathPercentage
from COVID19
where continent is not null
group by continent
order by 4 desc


--- Percent Population Infected Per Country ---------
select location, max(population) as Population, max(total_cases) as InfectedPopulation, (max(total_cases)/ max(population))*100 as InfectedPercent
from COVID19
where continent is not null
group by location
order by 1

---- Percent Population Infected Per Country Over Time --------------
select location,date, max(population) as Population, max(total_cases) as InfectedPopulation, (max(total_cases)/ max(population))*100 as InfectedPercent
from COVID19
where continent is not null
group by location,date
order by 1,2

--- Fully Vaccination Rate Per Country Over Time ---------
select 
	location,date, 
	max(people_fully_vaccinated) as FullyVaccinatedPeople, 
	max(population) as Population,
	(max(people_fully_vaccinated)/ max(population))*100 as FullyVacciatedRate
from COVID19
where continent is not null
group by location,date
order by 1,2
