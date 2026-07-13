/*

here we need to insert very large number of records, and it takes quite a bit of time to insert these records in sqlite3.
we can improve the performance very much by setting few pragmas

http://www.sqlite.org/pragma.html
*/
PRAGMA foreign_keys=0; /* foreign key check is set to off */
PRAGMA cache_size=10000; /* speeds up operations much */
PRAGMA synchronous = OFF; /* don't need to wait for OS signals */
PRAGMA journal_mode = MEMORY; 

/*
before creating new schema, drop any tables that may already exist
*/

DROP TABLE IF EXISTS [student];

CREATE TABLE [student]
(
    [rollno] TEXT  NOT NULL,
    [name] TEXT NOT NULL,
    /* now add constraints */
    CONSTRAINT [PKC_studentcourses] PRIMARY KEY  ( [rollno])
);

BEGIN TRANSACTION; /* this will also add to speed up in our large operation */

/* now insert some data 
 .read exams-data.sql
 select count (*) from student;
 */



     INSERT INTO [student] ( [rollno], [name]) VALUES ('25112010', 'Sahil Jamdade');
     INSERT INTO [student] ( [rollno], [name]) VALUES ('25112003', 'Rohit Shelar');
     INSERT INTO [student] ( [rollno], [name]) VALUES ('25111004', 'Shreyash Sawant');
     INSERT INTO [student] ( [rollno], [name]) VALUES ('25111008', 'Shraddha rokhare');
     INSERT INTO [student] ( [rollno], [name]) VALUES ('25112004', 'Rohan Raut');
 
