DROP TABLE boston_economic_2015;
CREATE EXTERNAL TABLE boston_economic_2015
(name string, departmentName string, title string, regular string, retro string, other string, overtime string, injured string, details string, edIncentive string, totalEarnings string, postal string )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/other_data';

DROP TABLE boston_economic_2014;
CREATE EXTERNAL TABLE boston_economic_2014
(name string, title string, departmentName string,  regular string, retro string, other string, overtime string, injured string, details string, quinn string, totalEarnings string, postal string )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/other_data';


DROP TABLE philly_economic;
CREATE EXTERNAL TABLE philly_economic
(lastName string, firstName string, title string, department string, annualSalary string, ytdOvertime string )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/other_data';

DROP TABLE nyc_economic;
CREATE EXTERNAL TABLE nyc_economic
(jobId string, agency string, postingType string, positions string, title string, civilServiceTitle string, titleCode string, level string, salaryRangeLow string, salaryRangeHigh string, salaryFrequency string, location string, division string, jobDescript string, additionalInfo string, application string, shift string, location_second string, recruitmentContact string, requirements string, postingDate date, postUntil date, postingUpdate date, processDate date )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/other_data';