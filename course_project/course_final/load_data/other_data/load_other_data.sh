#!/bin/bash  


#download boston economic data                                                 


wget https://data.cityofboston.gov/api/views/ah28-sywy/rows.csv

tail -n +2 rows.csv > boston_economic_2015_v1.csv

rm rows.csv

sed 's/$//g' boston_economic_2015_v1.csv > boston_economic_2015.csv

rm boston_economic_2015_v1.csv

wget https://data.cityofboston.gov/api/views/4swk-wcg8/rows.csv

tail -n +2 rows.csv > boston_economic_2014_v1.csv

rm rows.csv

sed's/$//g' boston_economic_2014_v1.csv > boston_economic_2014.csv

rm boston_economic_2014_v1.csv

#download philly economic data        

wget https://data.cityofboston.gov/api/views/4swk-wcg8/rows.csv

tail -n +2 rows.csv > philly_economic_v1.csv

rm rows.csv

sed 's/$//g' philly_economic_v1.csv > philly_economic.csv

rm philly_economic_v1.csv

#download NYC economic data        

wget https://data.cityofnewyork.us/api/views/kpav-sd4t/rows.csv

tail -n +2 rows.csv > nyc_economic.csv

rm rows.csv



#load into hdfs create other data director



# Make hdfs directory for loading data if it doesnt already exist
hdfs dfs -test -d /user/w205/other_data
if [[ $? -eq 0 ]]
   then
      echo "Directory /user/w205/other_data already exists"
   else
      echo "Creating hdfs directory /user/w205/other_data"
      hdfs dfs -mkdir /user/w205/other_data
fi

echo "Loading data files into hdfs"
hdfs dfs -put boston_economic_2015.csv /user/w205/other_data
hdfs dfs -put boston_economic_2014.csv /user/w205/other_data
hdfs dfs -put philly_economic.csv /user/w205/other_data

hdfs dfs -put nyc_economic.csv /user/w205/other_data