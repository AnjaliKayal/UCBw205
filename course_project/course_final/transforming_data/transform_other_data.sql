
DROP TABLE philly_economic_fixed;

CREATE TABLE philly_economic_fixed AS SELECT lastname, firstname, SUBSTRING(department,2) AS ann_sal, SUBSTRING(ytdovertime,2) as otd FROM philly_economic;

DROP TABLE philly_salaries;

CREATE TABLE philly_salaries AS SELECT AVG(ann_sal) as avg_salary, AVG(otd) as avg_overtime FROM philly_economic_fixed;

DROP TABLE boston_economic_total;

CREATE TABLE boston_economic_total AS SELECT title, SUBSTRING(totalearnings,2) AS salary from boston_economic_2014
       UNION ALL 
       SELECT title, SUBSTRING(totalearnings,2) as salary from boston_economic_2015;

DROP TABLE boston_salaries;

CREATE TABLE boston_salaries AS  SELECT AVG(salary) from  boston_economic_total;

DROP TABLE nyc_economic_fixed;

CREATE TABLE nyc_economic_fixed  AS SELECT jobid, SUBSTRING(salaryfrequency, 2) as salary from nyc_economic;

DROP TABLE nyc_salaries;

CREATE TABLE nyc_salaries AS SELECT AVG(salary) FROM nyc_economic_fixed;