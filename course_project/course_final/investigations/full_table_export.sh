hive -e "SELECT * from nyc_crimes" > nyc_crimes.csv

hive -e "SELECT * from philly_crime_count" > philly_crimes.csv

hive -e "SELECT * from boston_crime_count" > boston_crimes.csv