

DROP TABLE philly_health_count;

CREATE TABLE philly_health_count AS SELECT count(*) FROM philly_hospital_locations;

DROP TABLE nyc_health_count;

CREATE TABLE nyc_health_count AS SELECT count(*) FROM nyc_hospital_locations;

DROP TABLE boston_health_count;

CREATE TABLE boston_health_count AS SELECT count(*) FROM boston_hospital_locations;

DROP TABLE philly_airquality_counts;

CREATE TABLE philly_airquality_counts AS SELECT  sum(CASE WHEN blackcarbon = 'Y' THEN 1 ELSE 0 END) as a,  
       	    	SUM(CASE WHEN ultrafineparticulate = 'Y' THEN 1 ELSE 0 END) as b,
		 SUM(CASE WHEN co = 'Y' THEN 1 ELSE 0 END) as c,
		 SUM(CASE WHEN so2 = 'Y' THEN 1 ELSE 0 END) as d,
		 SUM(CASE WHEN ozone ='Y' THEN 1 ELSE 0 END) as e,
		 SUM(CASE WHEN no2 = 'Y' THEN 1 ELSE 0 END) as f,
		 SUM(CASE WHEN noyno =  'Y' THEN 1 ELSE 0 END) as g,
		 SUM(CASE WHEN pm10 ='Y' THEN 1 ELSE 0 END)as h,
		 SUM(CASE WHEN pm25 = 'Y' THEN 1 ELSE 0 END) as i,
		 SUM(CASE WHEN speciated25 = 'Y' THEN 1 ELSE 0 END) as j,
		 SUM(CASE WHEN pmcourse = 'Y' THEN 1 ELSE 0 END) as k,
		 SUM(CASE WHEN carbonyls = 'Y' THEN 1 ELSE 0 END) as l,
		 SUM(CASE WHEN pamsvoc = 'Y' THEN 1 ELSE 0 END) as n,
		 SUM(CASE WHEN tsp11101 = 'Y' THEN 1 ELSE 0 END)as o,
		 SUM(CASE WHEN tsmetals ='Y' THEN 1 ELSE 0 END)as p,
		 SUM(CASE WHEN tsplead = 'Y' THEN 1 ELSE 0 END) as q,
		 SUM(CASE WHEN toxicsto15 ='Y' THEN 1 ELSE 0 END) as r,
		 SUM(CASE WHEN met = 'Y' THEN 1  ELSE 0 END) as s,
		 SUM(CASE WHEN communityairtoxics = 'Y' THEN 1 ELSE 0 END) as t
FROM philly_airquality;

DROP TABLE philly_airquality_score;

CREATE TABLE philly_airquality_score AS SELECT (a + b + c + d + e + f + g + h + i + j + k + l + n + o + p + q + r + s + t)/19 as score FROM philly_airquality_counts;

DROP TABLE nyc_airquality_fix;

CREATE TABLE nyc_airquality_fix  AS SELECT dataid, testvalue FROM nyc_airquality WHERE testvalue < 2000;

DROP TABLE nyc_airquality_score;

CREATE TABLE nyc_airquality_score AS SELECT AVG(testvalue) FROM nyc_airquality_fix;

DROP TABLE nyc_restaurant_grades;

CREATE TABLE nyc_restaurant_grades AS SELECT 1-SUM(CASE WHEN grade='F'OR grade = 'D'  THEN 1 ELSE 0 end)/count(grade) FROM nyc_restaurants;

DROP TABLE boston_restaurant_grades;

CREATE TABLE boston_restaurant_grades AS SELECT SUM(CASE WHEN violstatus = 'Pass' THEN 1 ELSE 0  END) / count(violstatus) FROM boston_restaurants;
