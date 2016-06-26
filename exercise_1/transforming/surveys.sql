-- Please run this file after all other transforming files; specifically this must be be run afer hospital_entity

DROP TABLE survey_scores;

CREATE TABLE survey_scores AS SELECT hospitalName, providerID, (overallRatingAchievement+overallRatingImprovement+overallRatingDimension)/3 AS overallScore FROM surveys_responses;

DROP TABLE hospital_survey_scores;

CREATE TABLE hospital_survey_scores AS SELECT hospitalName, AVG(overallScore) AS avgScore, VARIANCE(overallScore) AS variance FROM survey_scores GROUP BY hospitalName;

DROP TABLE hospital_survey_compares;

CREATE TABLE hospital_survey_compares  AS SELECT H.hospitalName, H.avgScore AS hospitalAvg, H.variance AS hospitalVar, S.avgScore AS surveyAvg, S.variance AS surveyVar, H.avgScore/S.avgScore - 1 AS percentChangeHospitals, H.variance/S.variance - 1 AS percentChangeVariance FROM hospital_quality_of_care H FULL JOIN hospital_survey_scores S ON H.hospitalName = S.hospitalName;


