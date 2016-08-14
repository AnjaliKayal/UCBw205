DROP TABLE nyc_hospital_locations;
CREATE EXTERNAL TABLE nyc_hospital_locations
(facility string, borough string, hospitalName string, crossStreet string, phone string, address string )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/health_data/nyc_hospital';

DROP TABLE boston_hospital_locations;
CREATE EXTERNAL TABLE boston_hospital_locations
(hospitalName string, address string, zip string, neighborhood string, xCoordinate string, yCoordinate string, locationFull string )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/health_data/boston_hospital';

DROP TABLE philly_hospital_locations;
CREATE EXTERNAL TABLE philly_hospital_locations
(xCoordinate string, yCoordinate string, objectId string, hospitalName string, facility string, zip string, phone string, website string, dental string, address string )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/health_data/philly_hospital';

DROP TABLE 
nyc_airquality;
CREATE EXTERNAL TABLE nyc_airquality
(dataID string, indicatorID string, testName string, measure string, geo string, geoID string, borough string, year string, testValue string )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/health_data/nyc_airquality';

DROP TABLE 
philly_airquality;
CREATE EXTERNAL TABLE philly_airquality
( xCoor string, yCoor string, objectID string, siteName string, address string, blackCarbon string, ultrafineParticulate string, co string, so2 string, ozone string, no2 string, noyNo string, pm10 string, pm25 string, speciated25 string, pmCourse string, carbonyls string, pamsVoc string, tsp11101 string, tsMetals string, tspLead string, toxicsTO15 string, met string, communityAirToxics string )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/health_data/philly_airquality';

DROP TABLE 
nyc_restaurants;
CREATE EXTERNAL TABLE nyc_restaurants
( resID string, restaurantName string, borough string, buildingNo string, street string, zip string, phone string, cuisine string, inspectionDate date, action string, violationCode string, violationDesc string, criticalFlag string, score string, grade string, gradeDate date, recordDate date, inspectionType string )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/health_data/nyc_restaurant';

DROP TABLE 
boston_restaurants;
CREATE EXTERNAL TABLE boston_restaurants
( restaurantName string, dbaName string, owner string, lastName string, firstName string, licenseNo string, issdttm string, expdttm string, licstatus string, licensecat string, descript string, result string, resultdttm string, violation string, violLevel string, violDesc string, violDttm string, violStatus string, statusDate date, comments string, address string, city string, state string, zip string, propertyID string, location string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/health_data/boston_restaurant';