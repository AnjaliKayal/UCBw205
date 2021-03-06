
DROP TABLE nyc_crimes;

CREATE TABLE nyc_crimes AS SELECT * from nyc_misdemeanors UNION ALL SELECT * from nyc_violations  UNION ALL SELECT * from nyc_major_offenses UNION ALL SELECT * from nyc_major_offenses;



DROP TABLE philly_crimes;

CREATE TABLE philly_crimes AS SELECT YEAR(dispatchDate) AS crimeYear,
CASE WHEN incidentType = "Aggravated Assault Firearm" THEN "Felony assault"
     WHEN incidentType = "Aggravated Assault No Firearm" THEN "Aggravated assault"
     WHEN incidentType = "All Other Offenses" THEN "Other"
     WHEN incidentType = "Burglary Non-Residential" Then "Burglary"
     WHEN incidentType = "Burglary Residential" THEN "Burglary"
     WHEN incidentType = "Disorderly Conduct" THEN "Other violations"
     WHEN incidentType = "DRIVING UNDER THE INFLUENCE" THEN "intoxicated, impaired driving"
     WHEN incidentType = "Embezzlement" THEN "criminal mischief"
     WHEN incidentType = "Forgery and Counterfeiting" THEN "forgery, theft fraud, identify theft"
     WHEN incidentType = "Gambling Violations" THEN "other violations"
     WHEN incidentType = "Homicide - Criminal" THEN "murder"
     WHEN incidentType = "Homicide - Gross Negligence" THEN "murder"
     WHEN incidentType = "Liquor Law Violations" THEN  "criminal mischief"
     WHEN incidentType = "Motor Vehicle Theft" THEN "grand larceny of motor vehicles"
     WHEN incidentType = "Narcotic / Drug Law Violations" THEN "felony dangerous drugs"
     WHEN incidentType = "Offenses Afainst Family and Children" THEN "Offenses afainst the person"
     WHEN incidentType = "Other Assaults" THEN "assault"
     WHEN incidentType = "Other Sex Offenses (Not Commercialized)" THEN "misdemeanor sex crimes"
     WHEN incidentType = "Prosititution and Commercialized Vice" THEN "felony sex crimes"
     WHEN incidentType = "Public Drunkenness" THEN "other violations"
     WHEN incidentType = "Receiving Stolen Property" THEN "Felony possesion of stolen property"
     WHEN incidentType = "Recovered Stolen Motor Vehicle" THEN "other felonies"
     WHEN incidentType = "Robbery Firearm" THEN "Robbery"
     WHEN incidentType = "Robbery No Firearm" THEN "Robbery"
     WHEN incidentType = "Theft from Vehicle" THEN "grand larceny of motor vehicles"
     WHEN incidentType = "Vagrancy/Loitering" THEN "criminal tresspass"
     WHEN incidentType = "Vandalism/Criminal Mischief" THEN "criminal mischief"
     WHEN incidentType = "Weapon Violations" THEN "misdemanor dangerous" 
END AS offenses
FROM philly_crime_data;


DROP TABLE philly_crime_count;
CREATE TABLE philly_crime_count AS SELECT crimeYear, offenses, count(offenses) AS offensesCount FROM philly_crimes GROUP BY offenses, crimeYear;
 

DROP TABLE boston_crimes;

CREATE TABLE boston_crimes AS SELECT year, 
CASE WHEN incidentType = "Aircraft" THEN "Vehicle and traffic laws"
     WHEN incidentType = "Argue" THEN "harrassment"
     WHEN incidentType = "Arrest" THEN "other felony"
     WHEN incidentType = "Assembly or Gathering Violations" THEN "other misdemeanor"
     WHEN incidentType = "AUTO THEFT" THEN "Grand larceny of motor vehicles"
     WHEN incidentType = "Ballistics" THEN "felony assault"
     WHEN incidentType = "Breaking and Entering" THEN "robbery"
     WHEN incidentType = "BioThreat" THEN "other felony"
     WHEN incidentType = "Bomb" THEN "felony dangerous weapons"
     WHEN incidentType = "Bomb Hoax" THEN "other felony"
     WHEN incidentType = "BurgTools" THEN "burglary"
     WHEN incidentType = "COMMERCIAL BURGLARY" THEN "burglary" 
     WHEN incidentType = "Confidence Games" THEN "fel crimincal mischief and other related offenses"
     WHEN incidentType = "Counterfeiting" THEN "forgery, theft fraud, identity theft"
     WHEN incidentType = "CRIMES AGAINST CHILDREN" THEN "other felony"
     WHEN incidentType = "Criminal Harassment" THEN "Aggravated Harrassment"
     WHEN incidentType = "DEATH INVESTIGATION" THEN "murder"
     WHEN incidentType = "DISORDERLY" THEN "other violations"
     WHEN incidentType = "Disorderly Conduct" THEN "other violations"
     WHEN incidentType = "DRUG CHARGES" THEN "misdemeanor dangerous drugs"
     WHEN incidentType = "Embezzlement" THEN "criminal mischief"
     WHEN incidentType = "Evading Fare" THEN "vehicle and traffic laws"
     WHEN incidentType = "Explosives" THEN "felony dangerous weapons"
     WHEN incidentType = "FIRE" THEN "Arson" 
     WHEN incidentType = "Fire Related Reports" THEN "Arson"
     WHEN incidentType = "Firearm Discovery" THEN "felony dangerous weapons"
     WHEN incidentType = "Firearm Violations" THEN "felony dangerous weapons"
     WHEN incidentType = "FORGERY" then "forgery, theft fraud, identity theft"
     WHEN incidentType = "GAMBLING OFFENSE" THEN "other misdemeanor"
     WHEN incidentType = "Other" THEN "other misdemanor"
     WHEN incidentType = "Gather" THEN "other misdemanor"
     WHEN incidentType = "Harass" THEN "harassment"
     WHEN incidentType = "Harbor Related Incidents" THEN "vehicle and traffic laws"
     WHEN incidentType = "HateCrim" THEN "other felony"
     WHEN incidentType = "Hazardous" THEN "felony dangerous weapons"
     WHEN incidentType = "HOMICIDE" THEN "murder"
     WHEN incidentType = "Indecent Assault" THEN "assault and other related offenses"
     WHEN incidentType = "Investigate Person" THEN "other violations"
     WHEN incidentType = "Investigate Property" THEN "other violations"
     WHEN incidentType = "Investigate Vehicles" THEN "other violations"
     WHEN incidentType = "Labor" THEN "other violations"
     WHEN incidentType = "Landlord" THEN "other violations"
     WHEN incidentType = "Landlord/Tenant Disputes" THEN "other violations"
     WHEN incidentType = "Larceny" THEN "fel criminal mischief and related offenses"
     WHEN incidentType = "LARCENY FROM MOTOR VEHICLE" THEN "grand larceny of motor vehicles"
     WHEN incidentType = "License Plate Related Incidents" THEN "vehicle related"
     WHEN incidentType = "License Violation" THEN "vehicle related"
     WHEN incidentType = "Liquor Violation" THEN "criminal mischief"
     WHEN incidentType = "Manslaug" THEN "murder"
     WHEN incidentType = "Medical Assistance" THEN "other violations"
     WHEN incidentType = "Missing Person Located" THEN "other"
     WHEN incidentType = "Missing Person Reported" THEN "other"
     WHEN incidentType = "Motor Vehicle Accident Response" THEN "vehicle and traffice laws"
     WHEN incidentType = "Offenses Against Child/Family" THEN "OFFENSES AGAINST THE PEPRSON"
     WHEN incidentType = "Operating Under the Influence" THEN "intoxicated, mpaired driving"
     WHEN incidentType = "OTHER" THEN "other"
     WHEN incidentType = "Other Burglary" THEN "burglary"
     WHEN incidentType = "OTHER LARCENY" THEN "petit larceny"
     WHEN incidentType = "PersLoc" THEN "other"
     WHEN incidentType = "PersMiss" THEN "other"
     WHEN incidentType = "PhoneCalls" THEN "other violations"
     WHEN incidentType = "Plates" THEN "vehicle and traffic laws"
     WHEN incidentType = "Police Service Incidents" THEN "OFFENSES AGAINST PUBLIC ADMINISTRATION"
     WHEN incidentType = "PRISON" THEN "other"
     WHEN incidentType = "Prison Related Incidents" THEN "other"
     WHEN incidentType = "Property Related Damage" THEN "fel criminal misceif and related offenses"
     WHEN incidentType = "Property FOUND" THEN	"fel criminal misceif and related offenses"
     WHEN incidentType = "Property LOST" THEN  "fel criminal misceif and related offenses"
     WHEN incidentType = "Prostitution" THEN "felony sex crimes"
     WHEN incidentType = "Public Drunkenness" THEN "other violations"
     WHEN incidentType = "Recovered Stolen Property" THEN "felony possession of stolen property"
     WHEN incidentType = "RESIDENTIAL BURGLARY" THEN "burglary"
     WHEN incidentType = "Restraining Order Violations" THEN "harassment"
     WHEN incidentType = "ROBBERY" THEN "robbery"
     WHEN incidentType = "Runaway" THEN "other"
     WHEN incidentType = "Search Warrants" THEN "other"
     WHEN incidentType = "Service" THEN "other"
     WHEN incidentType = "Sex Offender Registration" THEN "misdemeanor sex crime"
     WHEN incidentType = "SIMPLE ASSAULT" THEN "assault" 
     WHEN incidentType = "SkipFare" THEN "vehicle and traffic laws"
     WHEN incidentType = "STOLEN PROPERTY CHARGES" THEN "misdemanor possession of stolen property"
     WHEN incidentType = "TOWED" THEN "vehicle and traffic laws"
     WHEN incidentType = "TRESPASS" THEN "criminal trespass"
     WHEN incidentType = "Vagrancy/Loitering" Then "criminal trespass"
     WHEN incidentType = "VANDALISM" THEN "criminal mischief"
     WHEN incidentType = "Verbal Disputes" THEN "other violations"
     WHEN incidentType = "Liquor Law Violations" THEN "criminal mischief"
     WHEN incidentType = "Violations" THEN "other violations"
     WHEN incidentType = "Warrant Arrests" THEN "other felonies"
     WHEN incidentType = "WEAPONS CHARGE" THEN "felony dangerous weapon"
END AS offenses
FROM boston_crime_data;


DROP TABLE boston_crime_count;
CREATE TABLE boston_crime_count AS SELECT year, offenses, count(offenses) AS offensesCount FROM boston_crimes GROUP BY offenses, year;

