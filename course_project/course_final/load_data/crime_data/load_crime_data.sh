#!/bin/bash  



#install xls2csv for later

pip install xlrd

sudo easy_install xlsx2csv                                                                                                                                                                   
#download boston crime data and adjust misspellings                            

wget https://data.cityofboston.gov/api/views/7cdf-6fgx/rows.csv


tail -n +2 rows.csv > boston_crime_unadjusted.csv


#changing unknown criminal charges to other and saving over to save space                                                                                     sed 's/07RV/other misdemeanor/g' boston_crime_unadjusted.csv > boston_fixed.csv

rm boston_crime_unadjusted.csv

rm rows.csv

sed 's/32GUN/other misdemeanor/g' boston_fixed.csv > boston_fixed.csv

sed 's/Auto Theft Recovery/AUTO THEFT/g' boston_fixed.csv > boston_fixed.csv

sed 's/Ballist/Ballistics/g' boston_fixed.csv > boston_fixed.csv

sed 's/BENoProp/Breaking and Entering/g' boston_fixed.csv > boston_fixed.csv

sed 's/BurgTools/BURGLARY/g' boston_fixed.csv > boston_fixed.csv

sed 's/Explos/Explosives/g' boston_fixed.csv > boston_fixed.csv

sed 's/Harbor/Harbor Related Incidents/g' boston_fixed.csv > boston_fixed.csv

sed 's/InvPer/Investigate Person/g' boston_fixed.csv > boston_fixed.csv

sed 's/InvProp/Investigate Property/g' boston_fixed.csv > boston_fixed.csv

sed 's/InvVeh/Investigate Vehicle/g' boston_fixed.csv > boston_fixed.csv

sed 's/LICViol/License Violation/g' boston_fixed.csv > boston_fixed.csv

sed 's/MedAssist/Medical Assistance/g' boston_fixed.csv > boston_fixed.csv

sed 's/MVAcc/Murder/g' boston_fixed.csv > boston_fixed.csv

sed 's/OPERATING UNDER INFLUENCE/Operating Under the Influence/g' boston_fixed.csv > boston_fixed.csv

sed 's/PropDam/Property Related Damage/g' boston_fixed.csv > boston_fixed.csv

sed 's/PropFound/Property Found/g' boston_fixed.csv > boston_fixed.csv

sed 's/PropLost/Property Lost/g' boston_fixed.csv > boston_fixed.csv

sed 's/PROSTITUTION CHARGES/Prostitution/g' boston_fixed.csv > boston_fixed.csv

sed 's/PROSTITUTION CHARGES/Prostitution/g' boston_fixed.csv > boston_fixed.csv

sed 's/PubDrink/Public Drunkenness/g' boston_fixed.csv > boston_fixed.csv

sed 's/Restrain/Restraining Order Violations/g' boston_fixed.csv > boston_fixed.csv

sed 's/SearchWarr/Search Warrants/g' boston_fixed.csv > boston_fixed.csv

sed 's/SexReg/Sex Offender Registration/g' boston_fixed.csv > boston_fixed.csv

sed 's/VAL/Vagrancy and Loitering/g' boston_fixed.csv > boston_fixed.csv

sed 's/VIOLATION OF LIQUOR LAWS/Liquor Law Violations/g' boston_fixed.csv > boston_crime_data.csv

rm boston_fixed.csv

#load in philadephia crime data and remove headers                                                                           
wget https://data.phila.gov/api/views/sspu-uyfa/rows.csv

tail -n +2 rows.csv > philly_crime_unadjusted.csv

#changing unknown criminal charges to other, standardizing some language, and saving over to save space                      

sed 's/Rape and Attempted/Rape/g' philly_crime_unadjusted.csv > philly_fixed.csv

rm rows.csv
rm philly_crime_unadjusted.csv

sed 's/RAPE/Rape/g' philly_fixed.csv > philly_fixed.csv

sed 's/Prostitution and Commercialized Vice/Prostitution/g' philly_fixed.csv > philly_fixed.csv

sed 's/Prostitution and Commercialized Vice/Prostitution/g' philly_fixed.csv > philly_crime_data.csv

rm philly_fixed.csv

#load in NYC crime data and change to cdv
                                                                  
wget http://www.nyc.gov/html/nypd/downloads/zip/analysis_and_planning/citywide_historical_crime_complaint_data_2000_2015.zip

unzip citywide_historical_crime_complaint_data_2000_2015.zip 

rm citywide_historical_crime_complaint_data_2000_2015.zip  

python xls2csv.py "violation_offenses_2000_2015.xls" "Violation Offenses" "violations.csv"

rm violation_offenses_2000_2015.xls

tail -n +5 violations.csv > violations1.csv

head -n +2 violations1.csv > violations2.csv

sed 's/ 2//g' violations2.csv > violations3.csv

sed 's/ (1)//g' violations3.csv > nyc_violations.csv

rm violations.csv
rm violations1.csv
rm violations2.csv
rm violations3.csv


python xls2csv.py "seven_major_felony_offenses_2000_2015.xls" "Sheet1" "major_offenses.csv"

rm seven_major_felony_offenses_2000_2015.xls

tail -n +6 major_offenses.csv > major_offenses1.csv

head -n +7 major_offenses1.csv > nyc_major_offenses.csv

rm major_offenses.csv
rm major_offenses1.csv

python xls2csv.py "non_seven_major_felony_offenses_2000_2015.xls" "Non-Seven Major Felony Offenses" "non_major_offenses.csv"

rm non_seven_major_felony_offenses_2000_2015.xls

tail -n +6 non_major_offenses.csv > non_major_offenses1.csv

head -n +8 non_major_offenses1.csv > non_major_offenses2.csv

sed 's/ (3)//g' non_major_offenses2.csv > non_major_offenses3.csv
sed 's/ (1)//g' non_major_offenses3.csv > non_major_offenses4.csv
sed 's/ (2)//g' non_major_offenses4.csv > non_major_offenses5.csv
sed 's/ (4)//g' non_major_offenses5.csv > nyc_non_major_offenses.csv

rm non_major_offenses.csv
rm non_major_offenses1.csv
rm non_major_offenses2.csv
rm non_major_offenses3.csv
rm non_major_offenses4.csv
rm non_major_offenses5.csv 

python xls2csv.py "misdemeanor_offenses_2000_2015.xls" "Misdemeanor Offenses" "misdemeanors.csv"

rm misdemeanor_offenses_2000_2015.xls

tail -n +5 misdemeanors.csv > misdemeanors1.csv

head -n +17 misdemeanors1.csv > misdemeanors2.csv

sed 's/ (4)//g' misdemeanors2.csv > misdemeanors3.csv
sed 's/ (1)//g' misdemeanors3.csv > misdemeanors4.csv
sed 's/ (5)//g' misdemeanors4.csv > misdemeanors5.csv
sed 's/ 3//g' misdemeanors5.csv > misdemeanors6.csv
sed 's/ (7)//g' misdemeanors6.csv > misdemeanors7.csv
sed 's/ (2)//g' misdemeanors7.csv > misdemeanors8.csv
sed 's/ (3)//g' misdemeanors8.csv > misdemeanors9.csv
sed 's/ (8)//g' misdemeanors9.csv > misdemeanors10.csv
sed 's/ 2//g' misdemeanors10.csv > nyc_misdemeanors.csv

rm misdemeanors.csv
rm misdemeanors1.csv
rm misdemeanors2.csv
rm misdemeanors3.csv
rm misdemeanors4.csv
rm misdemeanors5.csv
rm misdemeanors6.csv
rm misdemeanors7.csv
rm misdemeanors8.csv
rm misdemeanors9.csv
rm misdemeanors10.csv


# Make hdfs directory for loading data if it doesn't already exist
hdfs dfs -test -d /user/w205/crime_data
if [[ $? -eq 0 ]]
   then
     echo "Directory /user/w205/crime_data already exists"
   else
     echo "Creating hdfs directory /user/w205/crime_data"
     hdfs dfs -mkdir /user/w205/crime_data
fi

echo "Loading data files into hdfs"
hdfs dfs -put boston_crime_data.csv /user/w205/crime_data
hdfs dfs -put philly_crime_data.csv /user/w205/crime_data
hdfs dfs -put nyc_major_felonies.csv /user/w205/crime_data

hdfs dfs -put nyc_non_major_felonies.csv /user/w205/crime_data
hdfs dfs -put nyc_misdemeanor.csv /user/w205/crime_data
hdfs dfs -put nyc_violations.csv /user/w205/crime_data





