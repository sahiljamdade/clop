/*
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
    [rollno] int  NOT NULL,
    [name] TEXT  NOT NULL,
    [email] text not null,
    [phone] text not null,
    [city] text not null,
    CONSTRAINT [PK_student] PRIMARY KEY ([rollno])
    
    
);

DROP TABLE IF EXISTS [marks];
CREATE TABLE [marks]
(

	[rollno] int not null,
	[marks] int not null,
	primary key([rollno]),
	foreign key([rollno]) references student([rollno])
);

DROP TABLE IF EXISTS [stud_result];
CREATE TABLE [stud_result]
(
	[rollno] int,
	[name] text,
	[phone] text,
	[city] text,
	[marks] int,
        primary key([rollno]),
        foreign key([rollno]) references marks([rollno])

);


BEGIN TRANSACTION;

INSERT INTO student([rollno],[name],[email],[phone],[city]) VALUES(1,'sahil','sahil12@gmail.com', '9921074058','satara');
INSERT INTO student([rollno],[name],[email],[phone],[city]) VALUES(2,'rohit','rohit13@gmail.com', '4421074058','pune');
INSERT INTO student([rollno],[name],[email],[phone],[city]) VALUES(3,'raj','raj14@gmail.com', '9921544058','sangli');
INSERT INTO student([rollno],[name],[email],[phone],[city]) VALUES(4,'sachin','sachin14@gmail.com', '9642107058','karad');
INSERT INTO student([rollno],[name],[email],[phone],[city]) VALUES(5,'shreyash','shreyash15@gmail.com', '9924574058','kolhapur');
INSERT INTO student([rollno],[name],[email],[phone],[city]) VALUES(6,'navnath','navnath16@gmail.com', '9021074058','mumbai');
INSERT INTO student([rollno],[name],[email],[phone],[city]) VALUES(7,'ram','ram17@gmail.com', '9891074058','latur');
INSERT INTO student([rollno],[name],[email],[phone],[city]) VALUES(8,'raju','raju18@gmail.com', '9219304058','nashik');
INSERT INTO student([rollno],[name],[email],[phone],[city]) VALUES(9,'jayesh','jayesh19@gmail.com', '37074058','nagpur');
INSERT INTO student([rollno],[name],[email],[phone],[city]) VALUES(10,'ganesh','ganesh20@gmail.com', '381074058','satara');

INSERT INTO marks([rollno],[marks]) VALUES('1','80');
INSERT INTO marks([rollno],[marks]) VALUES('2','70');
INSERT INTO marks([rollno],[marks]) VALUES('3','50');
INSERT INTO marks([rollno],[marks]) VALUES('4','90');
INSERT INTO marks([rollno],[marks]) VALUES('5','60');
INSERT INTO marks([rollno],[marks]) VALUES('6','40');
INSERT INTO marks([rollno],[marks]) VALUES('7','87');
INSERT INTO marks([rollno],[marks]) VALUES('8','93');
INSERT INTO marks([rollno],[marks]) VALUES('9','35');
INSERT INTO marks([rollno],[marks]) VALUES('10','55');

/*
insert into stud_result(rollno,marks) select rollno, marks from marks;
update stud_result set rollno = student.rollno, name = student.name, phone = student.phone, city = student.city from student where student.rollno = stud_result.rollno;
*/


END TRANSACTION;


PRAGMA foreign_keys=1; 
PRAGMA cache_size=10000;
PRAGMA synchronous = ON;
PRAGMA journal_mode = PERSIST; 


