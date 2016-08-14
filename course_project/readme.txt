

To run this project you must run the following files:

For the crime results:
in load_data/crime_data

sh load_crime_data.sh - to load in crime data and put in hadoop
hive -f hive_crime.sql - to create crime tables in hive

in transforming_data/

hive -f transform_crime_data.sql - to transform data into queriable form

in investigations/

hive -f total_crime_comparison.sql - to get totals to compare

emacs crime_results.txt

The results have the ranking of cities for crime scores as philly, nyc, boston

For the health results:
in load_data/health_data

sh load_crime_data.sh - to load in heath data and put in hadoop
hive -f hive_health.sql - to create health tables in hive

in transforming_data/

hive -f transform_health_data.sql - to transform data into queriable form

in investigations/

hive -f health_comparison.sql - to get totals to compare

emacs health_results.txt

The results have the ranking of cities for health scores as boston, philadelphia, nyc.

For the education results:
in load_data/ed_data

sh load_ed_data.sh - to load in ed data and put in hadoop
hive -f hive_ed.sql - to create education tables in hive

in transforming_data/

hive -f transform_ed_data.sql - to transform data into queriable form

in investigations/

hive -f ed_comparison.sql - to get totals to compare

emacs ed_results.txt

The results have the ranking of cities for education scores as nyc, boston, philadelphia.



For the other results:
in load_data/other_data

sh load_other_data.sh - to load in other data and put in hadoop
hive -f hive_health.sql - to create other tables in hive

in transforming_data/

hive -f transform_other_data.sql - to transform data into queriable form

in investigations/

hive -f other_comparison.sql - to get totals to compare

emacs other_results.txt

The results have the ranking of cities for other scores as boston, philadelphia, nyc.

Boston was first twice, second once, and third once
Philadephia was first once, second twice, and third once
NYC was first once, second once, and third twice.

So the final ranking is boston, philadelphia, and then NYC.

