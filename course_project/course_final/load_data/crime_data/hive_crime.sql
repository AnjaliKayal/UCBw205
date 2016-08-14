DROP TABLE boston_crime_data;
CREATE EXTERNAL TABLE boston_crime_data
(compNo string, natureCode string, incidentType string, mainCrimeCode string, reptDist string, reportingArea string, fromDate date, weaponType string, Shooting string, domestic string, shift string, year string, month string, day_week string, coordinate1 string, coordinate2 string, streetName string, secondStreetName string, latitude string, longitude string )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/crime_data';

DROP TABLE philly_crime_data;

CREATE EXTERNAL TABLE philly_crime_data
(dcDist string, dist string,  dispatchDateAndTime string, dispatchDate date, dispatchTime string, hourCount string, dcKey string, location string, ucrGeneral string, incidentType string, shape string, policeDistricts string )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/crime_data';

DROP TABLE nyc_violations;
CREATE EXTERNAL TABLE nyc_violations
(offense string, year2000 string, year2001 string, year2002 string, year2003 string, year2004 string, year2005 string, year2006 string, year2007 string, year2008 string, year2009 string, year2010 string, year2011 string )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/crime_data/nyc';


DROP TABLE nyc_misdemeanors;
CREATE EXTERNAL TABLE nyc_misdemeanors
(offense string, year2000 string, year2001 string, year2002 string, year2003 string, year2004 string, year2005 string, year2006 string, year2007 string, year2008 string, year2009 string, year2010 string, year2011 string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/crime_data/nyc';


DROP TABLE nyc_non_major_offenses;
CREATE EXTERNAL TABLE nyc_non_major_offenses 
(offense string, year2000 string, year2001 string, year2002 string, year2003 string, year2004 string, year2005 string, year2006 string, year2007 string, year2008 string, year2009 string, year2010 string, year2011 string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/crime_data/nyc';



DROP TABLE nyc_major_offenses;
CREATE EXTERNAL TABLE nyc_major_offenses 
(offense string, year2000 string, year2001 string, year2002 string, year2003 string, year2004 string, year2005 string, year2006 string, year2007 string, year2008 string, year2009 string, year2010 string, year2011 string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/crime_data/nyc';

