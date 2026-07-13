/*
*/
PRAGMA foreign_keys=0; /* foreign key check is set to off */
PRAGMA cache_size=10000; /* speeds up operations much */
PRAGMA synchronous = OFF; /* don't need to wait for OS signals */
PRAGMA journal_mode = MEMORY; 

/*
before creating new schema, drop any tables that may already exist
*/

DROP TABLE IF EXISTS [marks_ref];
CREATE TABLE [marks_ref]
(
    [low] TEXT  NOT NULL,
    [high] TEXT  NOT NULL,
    [grade] TEXT NOT NULL,
    /* now add constraints */
    CONSTRAINT [PK_student] PRIMARY KEY  ([grade])
);
DROP TABLE If EXISTS [stud_info];
CREATE TABLE [stud_info]
(
	[id] text NOT NULL,
	[subcode] text NOT NULL,
	[marks] text NOT NULL
);
DROP TABLE IF EXISTS [logtable];
CREATE TABLE [logtable]
(

	[rollno] text NOT NULL,
	[grade]  text  
);

BEGIN TRANSACTION;
INSERT INTO [marks_ref] ([low],[high],[grade]) VALUES ('0','34','Fail');
INSERT INTO [marks_ref] ([low],[high],[grade]) VALUES ('35','44','pass');
INSERT INTO [marks_ref] ([low],[high],[grade]) VALUES ('45','54','D');
INSERT INTO [marks_ref] ([low],[high],[grade]) VALUES ('55','64','C');
INSERT INTO [marks_ref] ([low],[high],[grade]) VALUES ('65','74','B');
INSERT INTO [marks_ref] ([low],[high],[grade])VALUES ('75','84','A');
INSERT INTO [marks_ref] ([low],[high],[grade]) VALUES ('85','94','A+');
INSERT INTO [marks_ref] ([low],[high],[grade]) VALUES ('95','100','O');

INSERT INTO [stud_info] ([id],[subcode],[marks]) values ('1','as89','90');
INSERT INTO [stud_info] ([id],[subcode],[marks]) values ('1','as87','87');
INSERT INTO [stud_info] ([id],[subcode],[marks]) values ('1','ji89','90');
INSERT INTO [stud_info] ([id],[subcode],[marks]) values ('2','fd89','80');
INSERT INTO [stud_info] ([id],[subcode],[marks]) values ('2','jk89','10');
INSERT INTO [stud_info] ([id],[subcode],[marks]) values ('2','io89','50');
INSERT INTO [stud_info] ([id],[subcode],[marks]) values ('9','as89','90');



create trigger sahil 
after insert on logtable when new.rollno is not null
begin
	update logtable set grade = (  (select grade from marks_ref where (select avg(marks) from stud_info where id = new.rollno) 
	                               between low and high)) where rollno=new.rollno;
	
end;

END TRANSACTION;


PRAGMA foreign_keys=1; 
PRAGMA cache_size=10000;
PRAGMA synchronous = ON;
PRAGMA journal_mode = PERSIST; 


