
DROP TABLE hospitals;
CREATE EXTERNAL TABLE hospitals (providerID string, hospitalName string, address string, city string, state string, zipCode string, countyName string, phoneNumber string, hospitalType string, hospitalOwnership string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare';

DROP TABLE effective_care;
CREATE EXTERNAL TABLE effective_care (providerID string, hospitalName string, address string, city string, state string, zipCode string, countyName string, phoneNumber string, condition string, measureID string, measureName string, score string, sample string, footnote string, measureStartDate date, measureEndDate date)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare';

DROP TABLE readmissions;
CREATE EXTERNAL TABLE readmissions (providerID string, hospitalName string, address string, city string, state string, zipCode string, countyName string, phoneNumber string, measureName string, measureID string, comparedToNational string, denominator string, score string, lowerEstimate string, higherEstimate string, footnote string, measureStartDate date, measureEndDate date )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare';

DROP TABLE Measures;
CREATE EXTERNAL TABLE Measures (measureName string, measureID string, measureStartQuarter string, measureStartDate date, measureEndQuarter string, measureEndDate date)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare';

DROP TABLE surveys_responses;
CREATE EXTERNAL TABLE surveys_responses (providerID string, hospitalName string, address string, city string, state string, zipCode string, countyName string, communicationWithNurseAchievement string, communicationWithNurseImprovement string, communicationWithNurseDimension string, communicationWithDoctorsAchievement string, communicationWithDoctorsImprovement string, communicationWithDoctorsDimension string, responsivenessOfStaffAchievement string, responsivenessOfStaffImprovement string, responsivenessOfStaffDimension string, painManagementAchievement string, painManagementImprovement string, painManagementDimension string, communcationAboutMedsAchievement string, communicationAboutMedsImprovement string, communicationAboutMedsDimension string, cleanAndQuietnessAchievement string, cleanAndQuietnessImprovement string, cleanAndQuietnessDimension string, dischargeInformationAchievement string, dischargeInformationImprovement string, dischargeInformationDimension string, overallRatingAchievement string, overallRatingImprovement string, overallRatingDimension string, hcahpsBaseScore string, hcahpsConsistencyScore string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare';