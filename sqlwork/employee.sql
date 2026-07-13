/*
*/
PRAGMA foreign_keys=0; /* foreign key check is set to off */
PRAGMA cache_size=10000; /* speeds up operations much */
PRAGMA synchronous = OFF; /* don't need to wait for OS signals */
PRAGMA journal_mode = MEMORY; 

/*
before creating new schema, drop any tables that may already exist
*/

DROP TABLE IF EXISTS [employee];
CREATE TABLE [employee]
(
    [emp_id] int NOT NULL,
    [emp_name] TEXT  NOT NULL,
    [manager_id] TEXT, 
    /* now add constraints */
    CONSTRAINT [PK_student] PRIMARY KEY  ([emp_id])
);

BEGIN TRANSACTION;
INSERT INTO employee (emp_id, emp_name, manager_id) values(3,'sahil','13'); 
INSERT INTO employee (emp_id, emp_name, manager_id) values(7,'rohit','3'); 
INSERT INTO employee (emp_id, emp_name, manager_id) values(15,'jayesh','12'); 
INSERT INTO employee (emp_id, emp_name, manager_id) values(8,'piyush','11'); 
INSERT INTO employee (emp_id, emp_name, manager_id) values(12,'sumit','3'); 
INSERT INTO employee (emp_id, emp_name, manager_id) values(9,'raj','12'); 
INSERT INTO employee (emp_id, emp_name, manager_id) values(13,'shubham','null'); 
INSERT INTO employee (emp_id, emp_name, manager_id) values(11,'hrutik','12'); 
INSERT INTO employee (emp_id, emp_name, manager_id) values(5,'swapnil','11'); 
INSERT INTO employee (emp_id, emp_name, manager_id) values(4,'rohan','3'); 



END TRANSACTION;


PRAGMA foreign_keys=1; 
PRAGMA cache_size=10000;
PRAGMA synchronous = ON;
PRAGMA journal_mode = PERSIST; 


