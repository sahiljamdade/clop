/*
*/
PRAGMA foreign_keys=0; /* foreign key check is set to off */
PRAGMA cache_size=10000; /* speeds up operations much */
PRAGMA synchronous = OFF; /* don't need to wait for OS signals */
PRAGMA journal_mode = MEMORY; 

/*
before creating new schema, drop any tables that may already exist
*/

DROP TABLE IF EXISTS [answer_table];
CREATE TABLE [answer_table]
(
    [que_no] TEXT  NOT NULL,
    [answer] TEXT  NOT NULL,
    CONSTRAINT [PK_student] PRIMARY KEY ([que_no])
);

DROP TABLE IF EXISTS [student];
CREATE TABLE [student] (

	[rollno] text not null,
	[question] text not null,
	[ans] text not null,
	primary key([rollno],[question])

);

DROP TABLE IF EXISTS [op_table];
CREATE TABLE [op_table] (

	[rollno] text not null,
	[question] text not null,
	[ans] text not null,
	[result] text null,
	primary key([rollno],[question]),
	foreign key([rollno],[question]) references student([rollno],[question])
);


BEGIN TRANSACTION;

INSERT INTO student([rollno],[question],[ans]) VALUES('10','Q1','a');
INSERT INTO student([rollno],[question],[ans]) VALUES('10','Q2','c');
INSERT INTO student([rollno],[question],[ans]) VALUES('10','Q3','d');
INSERT INTO student([rollno],[question],[ans]) VALUES('10','Q4','b');
INSERT INTO student([rollno],[question],[ans]) VALUES('10','Q5','b');
INSERT INTO student([rollno],[question],[ans]) VALUES('10','Q6','d');
INSERT INTO student([rollno],[question],[ans]) VALUES('10','Q7','a');
INSERT INTO student([rollno],[question],[ans]) VALUES('10','Q8','d');
INSERT INTO student([rollno],[question],[ans]) VALUES('10','Q9','b');
INSERT INTO student([rollno],[question],[ans]) VALUES('10','Q10','c');


INSERT INTO student([rollno],[question],[ans]) VALUES('44','Q1','a');
INSERT INTO student([rollno],[question],[ans]) VALUES('44','Q2','a');
INSERT INTO student([rollno],[question],[ans]) VALUES('44','Q3','c');
INSERT INTO student([rollno],[question],[ans]) VALUES('44','Q4','d');
INSERT INTO student([rollno],[question],[ans]) VALUES('44','Q5','c');
INSERT INTO student([rollno],[question],[ans]) VALUES('44','Q6','b');
INSERT INTO student([rollno],[question],[ans]) VALUES('44','Q7','d');
INSERT INTO student([rollno],[question],[ans]) VALUES('44','Q8','c');
INSERT INTO student([rollno],[question],[ans]) VALUES('44','Q9','b');
INSERT INTO student([rollno],[question],[ans]) VALUES('44','Q10','a');

INSERT INTO student([rollno],[question],[ans]) VALUES('9','Q1','d');
INSERT INTO student([rollno],[question],[ans]) VALUES('9','Q2','c');
INSERT INTO student([rollno],[question],[ans]) VALUES('9','Q3','b');
INSERT INTO student([rollno],[question],[ans]) VALUES('9','Q4','a');
INSERT INTO student([rollno],[question],[ans]) VALUES('9','Q5','d');
INSERT INTO student([rollno],[question],[ans]) VALUES('9','Q6','c');
INSERT INTO student([rollno],[question],[ans]) VALUES('9','Q7','a');
INSERT INTO student([rollno],[question],[ans]) VALUES('9','Q8','a');
INSERT INTO student([rollno],[question],[ans]) VALUES('9','Q9','a');
INSERT INTO student([rollno],[question],[ans]) VALUES('9','Q10','a');


INSERT INTO student([rollno],[question],[ans]) VALUES('56','Q1','a');
INSERT INTO student([rollno],[question],[ans]) VALUES('56','Q2','b');
INSERT INTO student([rollno],[question],[ans]) VALUES('56','Q3','c');
INSERT INTO student([rollno],[question],[ans]) VALUES('56','Q4','d');
INSERT INTO student([rollno],[question],[ans]) VALUES('56','Q5','a');
INSERT INTO student([rollno],[question],[ans]) VALUES('56','Q6','b');
INSERT INTO student([rollno],[question],[ans]) VALUES('56','Q7','c');
INSERT INTO student([rollno],[question],[ans]) VALUES('56','Q8','d');
INSERT INTO student([rollno],[question],[ans]) VALUES('56','Q9','a');
INSERT INTO student([rollno],[question],[ans]) VALUES('56','Q10','b');


INSERT INTO student([rollno],[question],[ans]) VALUES('45','Q1','d');
INSERT INTO student([rollno],[question],[ans]) VALUES('45','Q2','c');
INSERT INTO student([rollno],[question],[ans]) VALUES('45','Q3','a');
INSERT INTO student([rollno],[question],[ans]) VALUES('45','Q4','b');
INSERT INTO student([rollno],[question],[ans]) VALUES('45','Q5','d');
INSERT INTO student([rollno],[question],[ans]) VALUES('45','Q6','c');
INSERT INTO student([rollno],[question],[ans]) VALUES('45','Q7','a');
INSERT INTO student([rollno],[question],[ans]) VALUES('45','Q8','b');
INSERT INTO student([rollno],[question],[ans]) VALUES('45','Q9','d');
INSERT INTO student([rollno],[question],[ans]) VALUES('45','Q10','c');



INSERT INTO student([rollno],[question],[ans]) VALUES('79','Q1','a');
INSERT INTO student([rollno],[question],[ans]) VALUES('79','Q2','a');
INSERT INTO student([rollno],[question],[ans]) VALUES('79','Q3','b');
INSERT INTO student([rollno],[question],[ans]) VALUES('79','Q4','b');
INSERT INTO student([rollno],[question],[ans]) VALUES('79','Q5','c');
INSERT INTO student([rollno],[question],[ans]) VALUES('79','Q6','c');
INSERT INTO student([rollno],[question],[ans]) VALUES('79','Q7','d');
INSERT INTO student([rollno],[question],[ans]) VALUES('79','Q8','d');
INSERT INTO student([rollno],[question],[ans]) VALUES('79','Q9','a');
INSERT INTO student([rollno],[question],[ans]) VALUES('79','Q10','a');



INSERT INTO student([rollno],[question],[ans]) VALUES('19','Q1','c');
INSERT INTO student([rollno],[question],[ans]) VALUES('19','Q2','a');
INSERT INTO student([rollno],[question],[ans]) VALUES('19','Q3','d');
INSERT INTO student([rollno],[question],[ans]) VALUES('19','Q4','b');
INSERT INTO student([rollno],[question],[ans]) VALUES('19','Q5','c');
INSERT INTO student([rollno],[question],[ans]) VALUES('19','Q6','a');
INSERT INTO student([rollno],[question],[ans]) VALUES('19','Q7','d');
INSERT INTO student([rollno],[question],[ans]) VALUES('19','Q8','b');
INSERT INTO student([rollno],[question],[ans]) VALUES('19','Q9','c');
INSERT INTO student([rollno],[question],[ans]) VALUES('19','Q10','a');



INSERT INTO student([rollno],[question],[ans]) VALUES('21','Q1','d');
INSERT INTO student([rollno],[question],[ans]) VALUES('21','Q2','a');
INSERT INTO student([rollno],[question],[ans]) VALUES('21','Q3','c');
INSERT INTO student([rollno],[question],[ans]) VALUES('21','Q4','b');
INSERT INTO student([rollno],[question],[ans]) VALUES('21','Q5','d');
INSERT INTO student([rollno],[question],[ans]) VALUES('21','Q6','a');
INSERT INTO student([rollno],[question],[ans]) VALUES('21','Q7','c');
INSERT INTO student([rollno],[question],[ans]) VALUES('21','Q8','b');
INSERT INTO student([rollno],[question],[ans]) VALUES('21','Q9','d');
INSERT INTO student([rollno],[question],[ans]) VALUES('21','Q10','d');


INSERT INTO student([rollno],[question],[ans]) VALUES('100','Q1','d');
INSERT INTO student([rollno],[question],[ans]) VALUES('100','Q2','c');
INSERT INTO student([rollno],[question],[ans]) VALUES('100','Q3','d');
INSERT INTO student([rollno],[question],[ans]) VALUES('100','Q4','a');
INSERT INTO student([rollno],[question],[ans]) VALUES('100','Q5','d');
INSERT INTO student([rollno],[question],[ans]) VALUES('100','Q6','b');
INSERT INTO student([rollno],[question],[ans]) VALUES('100','Q7','d');
INSERT INTO student([rollno],[question],[ans]) VALUES('100','Q8','d');
INSERT INTO student([rollno],[question],[ans]) VALUES('100','Q9','a');
INSERT INTO student([rollno],[question],[ans]) VALUES('100','Q10','b');


INSERT INTO student([rollno],[question],[ans]) VALUES('105','Q1','c');
INSERT INTO student([rollno],[question],[ans]) VALUES('105','Q2','d');
INSERT INTO student([rollno],[question],[ans]) VALUES('105','Q3','a');
INSERT INTO student([rollno],[question],[ans]) VALUES('105','Q4','b');
INSERT INTO student([rollno],[question],[ans]) VALUES('105','Q5','d');
INSERT INTO student([rollno],[question],[ans]) VALUES('105','Q6','a');
INSERT INTO student([rollno],[question],[ans]) VALUES('105','Q7','b');
INSERT INTO student([rollno],[question],[ans]) VALUES('105','Q8','c');
INSERT INTO student([rollno],[question],[ans]) VALUES('105','Q9','d');
INSERT INTO student([rollno],[question],[ans]) VALUES('105','Q10','d');


INSERT INTO student([rollno],[question],[ans]) VALUES('83','Q1','a');
INSERT INTO student([rollno],[question],[ans]) VALUES('83','Q2','b');
INSERT INTO student([rollno],[question],[ans]) VALUES('83','Q3','b');
INSERT INTO student([rollno],[question],[ans]) VALUES('83','Q4','b');
INSERT INTO student([rollno],[question],[ans]) VALUES('83','Q5','c');
INSERT INTO student([rollno],[question],[ans]) VALUES('83','Q6','c');
INSERT INTO student([rollno],[question],[ans]) VALUES('83','Q7','c');
INSERT INTO student([rollno],[question],[ans]) VALUES('83','Q8','d');
INSERT INTO student([rollno],[question],[ans]) VALUES('83','Q9','d');
INSERT INTO student([rollno],[question],[ans]) VALUES('83','Q10','a');

END TRANSACTION;


PRAGMA foreign_keys=1; 
PRAGMA cache_size=10000;
PRAGMA synchronous = ON;
PRAGMA journal_mode = PERSIST; 


