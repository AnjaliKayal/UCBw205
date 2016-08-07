#!/bin/bash  

#download hospital locations                                                                                                                    

wget https://data.cityofnewyork.us/api/views/f9bf-2cp4/rows.csv

tail -n +2 rows.csv > nyc_hospital_locations.csv

rm rows.csv

wget https://data.cityofboston.gov/api/views/46f7-2snz/rows.csv

tail -n +2 rows.csv > boston_hospital_locations.csv

rm rows.csv

wget http://data.phl.opendata.arcgis.com/datasets/f87c257e1039470a8a472694c2cd2e4f_0.csv

tail -n +2 f87c257e1039470a8a472694c2cd2e4f_0.csv > philly_hospital_locations.csv

rm f87c257e1039470a8a472694c2cd2e4f_0.csv



#download restaurant inspections

wget https://data.cityofnewyork.us/api/views/xx67-kt59/rows.csv

tail -n +2 rows.csv > nyc_restaurants.csv

rm rows.csv



wget https://data.cityofboston.gov/api/views/qndu-wx8w/rows.csv

tail -n +2 rows.csv > boston_restaurants.csv

rm rows.csv



#download air quality data

wget https://data.cityofnewyork.us/api/views/c3uy-2p5r/rows.csv

tail -n +2 rows.csv > nyc_airquality.csv

rm rows.csv

wget http://data.phl.opendata.arcgis.com/datasets/1839b35258604422b0b520cbb668df0d_0.csv

tail -n +2 1839b35258604422b0b520cbb668df0d_0.csv > philly_airquality.csv

rm 1839b35258604422b0b520cbb668df0d_0.csv



# Make hdfs directory for loading data if it doesn't already exist
hdfs dfs -test -d /user/w205/health_data
if [[ $? -eq 0 ]]
   then
      echo "Directory /user/w205/health_data already exists"
   else
      echo "Creating hdfs directory /user/w205/health_data"
      hdfs dfs -mkdir /user/w205/health_data
fi



echo "Loading data files into hdfs"
hdfs dfs -put nyc_hospital_locations.csv /user/w205/health_data
hdfs dfs -put boston_hospital_locations.csv /user/w205/health_data
hdfs dfs -put philly_hospital_locations.csv /user/w205/health_data
hdfs dfs -put nyc_restaurants.csv /user/w205/health_data

hdfs dfs -put boston_restaurants.csv /user/w205/health_data
hdfs dfs -put nyc_airquality.csv /user/w205/health_data
hdfs dfs -put philly_airquality.csv /user/w205/health_data
