#!/bin/bash  

                                                                                                                                                               

#download NYC ed data  do crime data first to download converter                                                                                                                     

wget https://data.cityofnewyork.us/api/views/f9bf-2cp4/rows.csv

tail -n +2 rows.csv > nyc_ed_data.csv

rm rows.csv



#download philly ed data                                                                                                                        

wget http://www.education.pa.gov/Documents/K-12/Assessment%20and%20Accountability/SAT-ACT/2015%20SAT%20Scores%20for%20Public%20Schools.xlsx

xlsx2csv 2015\ SAT\ Scores\ for\ Public\ Schools.xlsx philly_ed_2015.csv

rm 2015\ SAT\ Scores\ for\ Public\ Schools.xlsx
 
tail -n +9 philly_ed_2015.csv > philly_ed_2015.csv
wget http://www.education.pa.gov/Documents/K-12/Assessment%20and%20Accountability/SAT-ACT/2014%20SAT%20Scores%20for%20Public%20Schools.xlsx

xlsx2csv 2014\ SAT\ Scores\ for\ Public\ Schools.xlsx philly_ed_2014.csv

rm 2014\ SAT\ Scores\ for\ Public\ Schools.xlsx 

tail -n +9 philly_ed_2014.csv > philly_ed_2014.csv

wget http://www.education.pa.gov/Documents/K-12/Assessment%20and%20Accountability/SAT-ACT/2013%20SAT%20Scores%20for%20Public%20Schools.xlsx

xlsx2csv 2013\ SAT\ Scores\ for\ Public\ Schools.xlsx philly_ed_2013.csv

rm 2013\ SAT\ Scores\ for\ Public\ Schools.xlsx 

tail -n +9 philly_ed_2014.csv > philly_ed_2013.csv





#download overall ed data                                                                                                                        

wget https://inventory.data.gov/dataset/d78fbf42-64ed-4988-ba19-c8b9d83a960e/resource/d684f5ca-fe78-40b5-93d3-71ba940f13b0/download/achvmntrsltsstateassmtsmathssy201011.csv

tail -n +2 achvmntrsltsstateassmtsmathssy201011.csv > overall_math_2010_11.csv

rm achvmntrsltsstateassmtsmathssy201011.csv



wget https://inventory.data.gov/dataset/24675c4c-b470-4c34-94d5-02fe9a661767/resource/c733eb3a-4c39-4b3a-8b19-44fb0334001a/download/userssharedsdfachvmntrsltsstateassmtsmathssy200910.csv

tail -n +2 userssharedsdfachvmntrsltsstateassmtsmathssy200910.csv > overall_math_2009_10.csv

rm userssharedsdfachvmntrsltsstateassmtsmathssy200910.csv



wget https://inventory.data.gov/dataset/47620f0a-dd76-4fcc-915a-88cfdb2e32cf/resource/ede08664-bd3a-4f05-92ed-3caefc5c3584/download/userssharedsdfachvmntrsltsstateassmtsrlasy200910.csv

tail -n +2 userssharedsdfachvmntrsltsstateassmtsrlasy200910.csv > overall_read_2009_10.csv

rm userssharedsdfachvmntrsltsstateassmtsrlasy200910.csv



wget https://inventory.data.gov/dataset/d1f40ea1-0cda-49e1-8d12-3128c115db20/resource/b8160d45-b9b9-443c-8157-f381d6b90e42/download/achvmntrsltsstateassmtsrlasy201011.csv


tail -n +2 achvmntrsltsstateassmtsrlasy201011.csv > overall_read_2010_11.csv

rm achvmntrsltsstateassmtsrlasy201011.csv



# Make hdfs directory for loading data if it doesn't already exist
hdfs dfs -test -d /user/w205/ed_data
if [[ $? -eq 0 ]]
   then
      echo "Directory /user/w205/ed_data already exists"
   else
      echo "Creating hdfs directory /user/w205/ed_data"
      hdfs dfs -mkdir /user/w205/ed_data
fi

echo "Loading data files into hdfs"
hdfs dfs -put nyc_ed_data.csv /user/w205/ed_data
hdfs dfs -put philly_ed_2015.csv /user/w205/ed_data
hdfs dfs -put philly_ed_2014.csv /user/w205/ed_data
hdfs dfs -put philly_ed_2013.csv /user/w205/ed_data
hdfs dfs -put overall_math_2010_11.csv /user/w205/ed_data
hdfs dfs -put overall_math_2009_11.csv /user/w205/ed_data
hdfs dfs -put overall_read_2010_11.csv /user/w205/ed_data
hdfs dfs -put overall_read_2009_11.csv /user/w205/ed_data