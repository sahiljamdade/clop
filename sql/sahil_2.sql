
PRAGMA foreign_keys=0; 
PRAGMA cache_size=10000; 
PRAGMA synchronous = OFF; 
PRAGMA journal_mode = MEMORY; 

/*-----------  question ------------------------

     if number x is inserted in table then x rows should be generated if again number y inserted then y rows should append after x and 
     total rows be x+y but rows should be in a certain order. 
*/

DROP TABLE IF EXISTS [num_table];
CREATE TABLE [num_table]
(
    [val] int
   
);

drop table if exists[temp];
create table [temp]
(
    [val_val] int
);

drop table if exists[final];
create table [final]
(
	[ans] int
);

---------- triggers ------------------------------

create trigger nums after insert on num_table
begin
	update temp set val_val =  (select (sum(val)) from num_table);
end;


--------------------------------------------------

create trigger answer after update on temp
begin

    insert into final(ans)
    with recursive generate(ans) as (
      
        select coalesce((select ans from final),0)+1	
	union all
        select ans+1 from generate where ans < (select val_val from temp)
    )
    select * from generate where ans <= (select val_val from temp);

end;
---------------------------------------------------
BEGIN TRANSACTION;


INSERT INTO temp([val_val]) VALUES(0);

END TRANSACTION;


PRAGMA foreign_keys=1; 
PRAGMA cache_size=10000;
PRAGMA synchronous = ON;
PRAGMA journal_mode = PERSIST; 


