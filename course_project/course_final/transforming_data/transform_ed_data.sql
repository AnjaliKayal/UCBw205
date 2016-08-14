DROP TABLE math2010;

CREATE TABLE math2010 AS SELECT statename, schoolname, validmathavg as mathscore2010 from overall_math_2010_11 WHERE statename = 'MASSACHUSETTS' OR statename = 'NEW YORK' OR statename = 'PENNSYLVANIA';

DROP TABLE math2009;

CREATE TABLE math2009 AS SELECT statename, schoolname, validreadavg as mathscore2009 from overall_math_2009_10 WHERE statename = 'MASSACHUSETTS' OR statename = 'NEW YORK' OR statename = 'PENNSYLVANIA';

DROP TABLE read2009;

CREATE TABLE read2009 AS SELECT statename, schoolname, validreadavg as readscore2009 from overall_read_2009_10 WHERE statename = 'MASSACHUSETTS' OR statename = 'NEW YORK' OR statename = 'PENNSYLVANIA';

DROP TABLE read2010;

CREATE TABLE read2010 AS SELECT statename, schoolname, validreadavg as readscore2010 from overall_read_2010_11 WHERE statename = 'MASSACHUSETTS' OR statename = 'NEW YORK' OR statename = 'PENNSYLVANIA';

DROP TABLE education_v1;

CREATE TABLE education_v1 AS SELECT M.statename, M.schoolname, M.mathscore2010, N.mathscore2009 FROM math2010 AS M full join math2009 AS N ON M.schoolname = N.schoolname;

DROP TABLE education_v2;

CREATE TABLE education_v2 AS SELECT M.statename, M.schoolname, M.mathscore2010, M.mathscore2009, N.readscore2009 FROM education_v1 AS M full join read2009 AS N ON M.schoolname = N.schoolname;

DROP TABLE education;

CREATE TABLE education AS SELECT M.statename, M.schoolname, M.mathscore2010, M.mathscore2009, M.readscore2009, N.readscore2010 FROM education_v2 AS M full join read2010 AS N ON M.schoolname = N.schoolname;

DROP TABLE ed_averages;

CREATE TABLE ed_averages AS SELECT statename, AVG(mathscore2010), AVG(mathscore2009), AVG(readscore2009), AVG(readscore2010) FROM education GROUP BY statename;

DROP TABLE nyc_ed_averages;

CREATE TABLE nyc_ed_average AS SELECT AVG(satreadingavg), AVG(satmathavg), AVG(satwritingavg) FROM nyc_ed_data; 

DROP TABLE philly_2013_average;

CREATE TABLE philly_2013_average AS SELECT AVG(verbalavg), AVG(mathavg), AVG(writingavg) from philly_ed_2013;

DROP TABLE philly_2014_average;

CREATE TABLE philly_2014_average AS SELECT AVG(readingavg), AVG(mathavg), AVG(writingavg) from philly_ed_2014;

DROP TABLE philly_2015_average;

CREATE TABLE philly_2015_average AS SELECT AVG(readingavg), AVG(mathavg), AVG(writingavg) from philly_ed_2015;


