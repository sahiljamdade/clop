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
    [rollno] TEXT  NOT NULL,
    [name] TEXT  NOT NULL,
    /* now add constraints */
    CONSTRAINT [PK_student] PRIMARY KEY  ([rollno])
);
DROP TABLE IF EXISTS [subject];
CREATE TABLE [subject]
(
    [subcode] TEXT  NOT NULL,
    [subject_name] TEXT  NOT NULL,
    /* now add constraints */
    CONSTRAINT [PK_subject] PRIMARY KEY  ([subcode])
);

DROP TABLE IF EXISTS [stud_subject];
CREATE TABLE [stud_subject]
(
    [rollno] TEXT  NOT NULL,
    [subcode] TEXT  NOT NULL,
    [marks] INT  NOT NULL,
    /* now add constraints */
    CONSTRAINT [PK_subject] PRIMARY KEY  ([rollno],[subcode]),
    FOREIGN KEY ([rollno]) references student(rollno),
    FOREIGN KEY ([subcode]) references subject(subcode)
);


DROP TABLE IF EXISTS [stud_test];
CREATE TABLE [stud_test]
(
    [rollno] TEXT  NOT NULL,
    [subcode] TEXT  NOT NULL,
    [testcode] TEXT  NOT NULL,
    [name] TEXT,
    [marks] INT  NOT NULL,
    /* now add constraints */
    CONSTRAINT [PK_subject] PRIMARY KEY  ([rollno],[subcode],[testcode]),
    FOREIGN KEY ([rollno]) references student(rollno),
    FOREIGN KEY ([subcode]) references subject(subcode)
);
BEGIN TRANSACTION;
INSERT INTO [student] ([rollno],[name]) VALUES ("25111015","Sahil Jamdade");
INSERT INTO [student] ([rollno],[name]) VALUES ("25112019","Geeta Pande");
INSERT INTO [student] ([rollno],[name]) VALUES ("25112025","Gauri Jadhav");
INSERT INTO [student] ([rollno],[name]) VALUES ("25112050","Tia Dhumal");
INSERT INTO [student] ([rollno],[name]) VALUES ("25111078","Sakshi Jamdade");
INSERT INTO [student] ([rollno],[name]) VALUES ("25111079","Tina Raut");
INSERT INTO [student] ([rollno],[name]) VALUES ("25112099","Virat Kohli");

INSERT INTO [subject] ([subcode],[subject_name]) VALUES ("AM01","biology");
INSERT INTO [subject] ([subcode],[subject_name]) VALUES ("AM89","Maths");
INSERT INTO [subject] ([subcode],[subject_name]) VALUES ("CS510","a1");
INSERT INTO [subject] ([subcode],[subject_name]) VALUES ("NM8","ck");
INSERT INTO [subject] ([subcode],[subject_name]) VALUES ("CP854","bmw");

INSERT INTO [stud_subject] ([rollno],[subcode],[marks]) VALUES ("25111015","AM89",83);
INSERT INTO [stud_subject] ([rollno],[subcode],[marks]) VALUES ("25111015","AM01",79);
INSERT INTO [stud_subject] ([rollno],[subcode],[marks]) VALUES ("25111015","CS510",69);
INSERT INTO [stud_subject] ([rollno],[subcode],[marks]) VALUES ("25112019","AM89",33);
INSERT INTO [stud_subject] ([rollno],[subcode],[marks]) VALUES ("25112025","CS510",64);
INSERT INTO [stud_subject] ([rollno],[subcode],[marks]) VALUES ("25112025","NM8",29);
INSERT INTO [stud_subject] ([rollno],[subcode],[marks]) VALUES ("25112050","CP854",42);
INSERT INTO [stud_subject] ([rollno],[subcode],[marks]) VALUES ("25111078","AM01",87);
INSERT INTO [stud_subject] ([rollno],[subcode],[marks]) VALUES ("25111079","AM89",13);
INSERT INTO [stud_subject] ([rollno],[subcode],[marks]) VALUES ("25111079","CP854",66);
INSERT INTO [stud_subject] ([rollno],[subcode],[marks]) VALUES ("25112099","AM01",1);
INSERT INTO [stud_subject] ([rollno],[subcode],[marks]) VALUES ("25112099","AM89",15);


INSERT INTO [stud_test] ([rollno],[subcode],[testcode],[name],[marks]) VALUES ("25111015","AM01","t01","NULL",0);
INSERT INTO [stud_test] ([rollno],[subcode],[testcode],[name],[marks]) VALUES ("25111015","AM89","t02","t1",14);
INSERT INTO [stud_test] ([rollno],[subcode],[testcode],[name],[marks]) VALUES ("25111015","AM89","t03","t2",9);
INSERT INTO [stud_test] ([rollno],[subcode],[testcode],[name],[marks]) VALUES ("25111015","CS510","t04","t2",18);
INSERT INTO [stud_test] ([rollno],[subcode],[testcode],[name],[marks]) VALUES ("25111078","AM01","t05","t1",17);
INSERT INTO [stud_test] ([rollno],[subcode],[testcode],[name],[marks]) VALUES ("25111078","AM01","t06","t3",5);
INSERT INTO [stud_test] ([rollno],[subcode],[testcode],[name],[marks]) VALUES ("25111079","AM89","t07","NULL",0);
INSERT INTO [stud_test] ([rollno],[subcode],[testcode],[name],[marks]) VALUES ("25111079","CP854","t08","t3",15);
INSERT INTO [stud_test] ([rollno],[subcode],[testcode],[name],[marks]) VALUES ("25112019","AM89","t09","t2",17);
INSERT INTO [stud_test] ([rollno],[subcode],[testcode],[name],[marks]) VALUES ("25112019","AM89","t10","t3",3);
INSERT INTO [stud_test] ([rollno],[subcode],[testcode],[name],[marks]) VALUES ("25112025","CS510","t11","t2",16);
INSERT INTO [stud_test] ([rollno],[subcode],[testcode],[name],[marks]) VALUES ("25112025","NM8","t12","t1",11);
INSERT INTO [stud_test] ([rollno],[subcode],[testcode],[name],[marks]) VALUES ("25112025","NM8","t13","t4",5);
INSERT INTO [stud_test] ([rollno],[subcode],[testcode],[name],[marks]) VALUES ("25112050","CP854","t14","NULL",0);
INSERT INTO [stud_test] ([rollno],[subcode],[testcode],[name],[marks]) VALUES ("25112099","AM01","t15","t2",6);
INSERT INTO [stud_test] ([rollno],[subcode],[testcode],[name],[marks]) VALUES ("25112099","AM01","t16","t3",14);
INSERT INTO [stud_test] ([rollno],[subcode],[testcode],[name],[marks]) VALUES ("25112099","AM89","t17","NULL",0);

select
  case
    when t.rollno =(
                select rollno
                from stud_test
                where rowid < t.rowid
                order by rowid desc limit 1
                )
    then ' '
    else t.rollno
  end as rollno,
  case
    when t.rollno =(
                select rollno
                from stud_test
                where rowid < t.rowid
                order by rowid desc limit 1
                )
    then ' '
    else s.name
  end as name,
  case
    when t.subcode =(
                select subcode
                from stud_test
                where rowid < t.rowid
                order by rowid desc limit 1
                )
    then ' '
    else sb.subcode
  end as Subcode,
  case
    when t.subcode =(
                select subcode
                from stud_test
                where rowid < t.rowid
                order by rowid desc limit 1
                )
    then ' '
    else sb.subject_name
  end as Subject,
  t.name,t.marks
from student s, subject sb, stud_test t
where s.rollno = t.rollno
and sb.subcode = t.subcode
order by t.rollno;


END TRANSACTION;


PRAGMA foreign_keys=1; 
PRAGMA cache_size=10000;
PRAGMA synchronous = ON;
PRAGMA journal_mode = PERSIST; 


