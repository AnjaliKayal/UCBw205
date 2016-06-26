DROP TABLE hospital_scores;

CREATE TABLE hospital_scores AS SELECT E.hospitalName, E.providerID, E.measureID, E.score AS effective_care_score, R.score AS readmissions_score FROM effective_care E FULL JOIN readmissions R ON R.hospitalName = E.hospitalName AND R.providerID = E.providerID AND R.measureID = E.measureID;  

DROP TABLE hospital_combined_scores;

CREATE TABLE hospital_combined_scores AS SELECT hospitalName, providerID, measureID, effective_care_score + readmissions_score AS sum_of_scores, CASE WHEN effective_care_score = NULL THEN readmissions_score * 1 WHEN readmissions_score = NULL THEN effective_care_score * 1 ELSE (effective_care_score + readmissions_score)/2 END AS average_scores FROM hospital_scores;

DROP TABLE hospital_quality_of_care;

CREATE TABLE hospital_quality_of_care AS SELECT hospitalName, SUM(sum_of_scores) AS sumScore, AVG(average_scores) AS avgScore, MIN(average_scores) AS minScore, MAX(average_scores) AS maxScore, VARIANCE(average_scores AS variance  FROM hospital_combined_scores GROUP BY hospitalName;

