DROP TABLE state_scores;

CREATE TABLE state_scores AS SELECT E.state, E.hospitalName, E.providerID, E.measureID, E.score AS effective_care_score, R.score AS readmissions_score FROM effective_care E FULL JOIN readmissions R ON R.hospitalName = E.hospitalName AND R.providerID = E.providerID AND R.measureID = E.measureID;

DROP TABLE state_combined_scores;

CREATE TABLE state_combined_scores AS SELECT state, providerID, measureID, effective_care_score + readmissions_score AS sum_of_scores, CASE WHEN effective_care_score = NULL THEN readmissions_score * 1 WHEN readmissions_score = NULL THEN effective_care_score * 1 ELSE (effective_care_score + readmissions_score)/2 END AS average_scores FROM state_scores;


DROP TABLE state_quality_of_care;


CREATE TABLE state_quality_of_care AS SELECT state, SUM(sum_of_scores) AS sumScore, AVG(average_scores) AS avgScore, MIN(average_scores) AS minScore, MAX(average_scores) AS maxScore  FROM state_combined_scores GROUP BY state;





