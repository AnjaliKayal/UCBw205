SELECT SUM(year2000), SUM(year2001), SUM(year2002), SUM(year2003), SUM(year2004), SUM(year2005), SUM(year2006), SUM(year2007), SUM(year2008), sum(year2009), sum(year2010), sum(year2011) FROM nyc_crimes;

SELECT crimeYear, SUM(offensesCount) FROM philly_crime_count GROUP BY crimeYear;

SELECT year, SUM(offensesCount) FROM boston_crime_count GROUP BY year;