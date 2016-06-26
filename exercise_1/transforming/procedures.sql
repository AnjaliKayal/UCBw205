DROP TABLE procedure_scores;

CREATE TABLE procedure_scores AS SELECT E.hospitalName, E.providerID, E.measureID, E.measureName, E.score AS effective_care_score, R.score AS readmissions_score FROM effective_care E FULL JOIN readmissions R ON R.hospitalName = E.hospitalName AND R.providerID = E.providerID AND R.measureID = E.measureID;

DROP TABLE procedure_combined_scores;

CREATE TABLE procedure_combined_scores AS SELECT hospitalName, providerID, measureID, measureName, effective_care_score + readmissions_score AS sum_of_scores, CASE WHEN effective_care_score = NULL THEN readmissions_score * 1 WHEN readmissions_score = NULL THEN effective_care_score * 1 ELSE (effective_care_score + readmissions_score)/2 END AS average_scores FROM procedure_scores;

DROP TABLE procedure_variability;

CREATE TABLE procedure_variability AS SELECT measureName, SUM(sum_of_scores) AS sumScore, AVG(average_scores) AS avgScore, MIN(average_scores) AS minScore, MAX(average_scores) AS maxScore, MAX(average_scores)-MIN(average_scores) AS range, VARIANCE(average_scores) AS variance  FROM procedure_combined_scores GROUP BY measureName;

