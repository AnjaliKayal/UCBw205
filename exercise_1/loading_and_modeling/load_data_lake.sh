#!/bin/bash
# Remove Headers
echo "Removing headers from files"
tail -n +2 Hospital\ General\ Information.csv > hospitals.csv
tail -n +2 Timely\ and\ Effective\ Care\ -\ Hospital.csv > effective_care.csv
tail -n +2 Readmissions\ and\ Deaths\ -\ Hospital.csv > readmissions.csv
tail -n +2 Measure\ Dates.csv > Measures.csv
tail -n +2 hvbp_hcahps_05_28_2015.csv > surveys_responses.csv

# Make hdfs directory for loading data if it doesn't already exist
hdfs dfs -test -d /user/w205/hospital_compare
if [[ $? -eq 0 ]]
  then
    echo "Directory /user/w205/hospital_compare already exists"
  else
    echo "Creating hdfs directory /user/w205/hospital_compare"
    hdfs dfs -mkdir /user/w205/hospital_compare
fi

HCOMP=/user/w205/hospital_compare

echo "Loading data files into hdfs"
hdfs dfs -put hospitals.csv $HCOMP
hdfs dfs -put effective_care.csv $HCOMP
hdfs dfs -put readmissions.csv $HCOMP
hdfs dfs -put Measures.csv $HCOMP
hdfs dfs -put surveys_responses.csv $HCOMP

