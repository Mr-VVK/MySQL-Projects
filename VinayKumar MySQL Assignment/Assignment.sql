-- creating table's
-- and importing data wizard option but while uploading data into respective table 
-- i check(selected) only `date` & `close price` 
-- and remaing columns i am putting uncheck so that two columns only imported into table.

-- creation of bajaj table and importing data using wizard option

create table bajaj
( `date`  varchar(15),
 `close price` decimal(10,2)); 

-- creating eicher table
 
create table eicher
( `date`  varchar(15),
 `close price` decimal(10,2)); 

-- creating hero table

create table hero
( `date`  varchar(15),
 `close price` decimal(10,2)); 

-- creating infosys table

create table infosys
( `date`  varchar(15),
 `close price` decimal(10,2)); 
 
-- creating tcs table

create table tcs
( `date`  varchar(15),
 `close price` decimal(10,2)); 
 
 -- creating tvs table
 
 create table tvs
( `date`  varchar(15),
 `close price` decimal(10,2)); 
 
-- after creation of all tables data imported using wizard option by checking only `date` and `close price`

-- changing date(string datatype) to date(datetime datatype)
 
select `date`, STR_TO_DATE(DATE,'%d-%M-%y') from bajaj;
select `date`, STR_TO_DATE(DATE,'%d-%M-%y') from eicher;
select `date`, STR_TO_DATE(DATE,'%d-%M-%y') from hero;
select `date`, STR_TO_DATE(DATE,'%d-%M-%y') from infosys;
select `date`, STR_TO_DATE(DATE,'%d-%M-%y') from tcs;
select `date`, STR_TO_DATE(DATE,'%d-%M-%y') from tvs;

-- QUESTION 1     CREATING MOVING AVERAGES TABLES
--  CREAING MOVING AVERAGES OF BAJAJ AS BAJAJ1
create table bajaj1 as
select `date`,`close price`,
(case when rownum>=20 then 20dayMA else null end)as `20dayMA`,
(case when rownum>=50 then 50dayMA else null end) as `50dayMA`
from
(select `date`,`close price`,`20dayMA`,`50dayMA`, row_number() over () as rownum from
(
select STR_TO_DATE(`date`,'%d-%M-%y') as `date` ,`close price`,
avg(`close price`) over (order by STR_TO_DATE(`date`,'%d-%M-%y') rows between 19 preceding and current row ) as `20dayMA`,
avg(`close price`) over (order by STR_TO_DATE(`date`,'%d-%M-%y') rows between 49 preceding and current row ) as `50dayMA`
from bajaj
)
a)b;

-- select * from bajaj1;

-- CREATING MOVING AVERAGES TABLE EICHER1

create table eicher1 as
select `date`,`close price`,
(case when rownum>=20 then 20dayMA else null end)as `20dayMA`,
(case when rownum>=50 then 50dayMA else null end) as `50dayMA`
from
(select `date`,`close price`,`20dayMA`,`50dayMA`, row_number() over () as rownum from
(
select STR_TO_DATE(`date`,'%d-%M-%y') as `date` ,`close price`,
avg(`close price`) over (order by STR_TO_DATE(`date`,'%d-%M-%y') rows between 19 preceding and current row ) as `20dayMA`,
avg(`close price`) over (order by STR_TO_DATE(`date`,'%d-%M-%y') rows between 49 preceding and current row ) as `50dayMA`
from eicher
)
c)d;

-- creating hero1 table
create table hero1 as
select `date`,`close price`,
(case when rownum>=20 then 20dayMA else null end)as `20dayMA`,
(case when rownum>=50 then 50dayMA else null end) as `50dayMA`
from
(select `date`,`close price`,`20dayMA`,`50dayMA`, row_number() over () as rownum from
(
select STR_TO_DATE(`date`,'%d-%M-%y') as `date` ,`close price`,
avg(`close price`) over (order by STR_TO_DATE(`date`,'%d-%M-%y') rows between 19 preceding and current row ) as `20dayMA`,
avg(`close price`) over (order by STR_TO_DATE(`date`,'%d-%M-%y') rows between 49 preceding and current row ) as `50dayMA`
from hero
)
e)f;

-- creating infosys1 table
create table infosys1 as
select `date`,`close price`,
(case when rownum>=20 then 20dayMA else null end)as `20dayMA`,
(case when rownum>=50 then 50dayMA else null end) as `50dayMA`
from
(select `date`,`close price`,`20dayMA`,`50dayMA`, row_number() over () as rownum from
(
select STR_TO_DATE(`date`,'%d-%M-%y') as `date` ,`close price`,
avg(`close price`) over (order by STR_TO_DATE(`date`,'%d-%M-%y') rows between 19 preceding and current row ) as `20dayMA`,
avg(`close price`) over (order by STR_TO_DATE(`date`,'%d-%M-%y') rows between 49 preceding and current row ) as `50dayMA`
from infosys
)
g)h;

-- creating tcs1 table
create table tcs1 as
select `date`,`close price`,
(case when rownum>=20 then 20dayMA else null end)as `20dayMA`,
(case when rownum>=50 then 50dayMA else null end) as `50dayMA`
from
(select `date`,`close price`,`20dayMA`,`50dayMA`, row_number() over () as rownum from
(
select STR_TO_DATE(`date`,'%d-%M-%y') as `date` ,`close price`,
avg(`close price`) over (order by STR_TO_DATE(`date`,'%d-%M-%y') rows between 19 preceding and current row ) as `20dayMA`,
avg(`close price`) over (order by STR_TO_DATE(`date`,'%d-%M-%y') rows between 49 preceding and current row ) as `50dayMA`
from tcs
)
i)j;

-- creating tvs1 table
create table tvs1 as
select `date`,`close price`,
(case when rownum>=20 then 20dayMA else null end)as `20dayMA`,
(case when rownum>=50 then 50dayMA else null end) as `50dayMA`
from
(select `date`,`close price`,`20dayMA`,`50dayMA`, row_number() over () as rownum from
(
select STR_TO_DATE(`date`,'%d-%M-%y') as `date` ,`close price`,
avg(`close price`) over (order by STR_TO_DATE(`date`,'%d-%M-%y') rows between 19 preceding and current row ) as `20dayMA`,
avg(`close price`) over (order by STR_TO_DATE(`date`,'%d-%M-%y') rows between 49 preceding and current row ) as `50dayMA`
from tvs
)
k)l;

-- creating MasterTable with `date` and `close price` of each stock with respect of its stock name
-- drop table if exists MasterTable;
create table Mastertable as
select b.date, b.`close price` as `bajaj`, e.`close price` as `eicher`, h.`close price` as `hero`,
i.`close price` as `infosys`, tc.`close price` as `tcs`, tv.`close price` as `tvs`
from bajaj b
inner join eicher e on b.date=e.date
inner join hero h on b.date=h.date
inner join infosys i on b.date=i.date
inner join tcs tc on b.date=tc.date
inner join tvs tv on b.date=tv.date;

-- select * from MasterTable;

-- QUESTION 3 CREATION OF SIGNAL(BUY/SELL/HOLD) TABLE

-- BAJAJ STOCK SIGNAL TABLE AS `BAJAJ2`

create table bajaj2 as 
select `Date`,`Close Price`,
case when rownumber=50 then 
(
case when `20dayMA`>`50dayMA` then 'Buy' 
when `20dayMA`<`50dayMA` then 'Sell' else `Signal` end 
)
else `Signal` end as 'Signal'  from 
(
select `Date`,`Close Price`,`20dayMA`,`50dayMA`,
case 
when rownum<50 then null
when ((lag(`20dayMA`,1) over (order by `date`) < (lag(`50dayMA`,1) over (order by `date`))) and (`20dayMA`>`50dayMA`)) then 'Buy'
when ((lag(`20dayMA`,1) over (order by `date`) > (lag(`50dayMA`,1) over (order by `date`))) and (`20dayMA`<`50dayMA`)) then 'Sell'
else 'Hold' end as `Signal`,
row_number() over() as rownumber
from
(
select baj.`Date`,baj.`Close Price`,`20dayMA`,`50dayMA`,
row_number() over() as rownum from bajaj1 baj
) as M
) as N ;

SELECT * FROM BAJAJ2;
-- CREATION OF SIGNAL TABLE FOR EICHER AS EICHER2

create table eicher2 as 
select `Date`,`Close Price`,
case when rownumber=50 then 
(
case when `20dayMA`>`50dayMA` then 'Buy' 
	 when `20dayMA`<`50dayMA` then 'Sell' 
     else `Signal` end 
)
else `Signal` end as 'Signal'
from 
(
select `Date`,`Close Price`,`20dayMA`,`50dayMA`,
case when rownum<50 then null
when ((lag(`20dayMA`,1) over (order by `date`) < (lag(`50dayMA`,1) over (order by `date`))) and (`20dayMA`>`50dayMA`)) then 'Buy'
when ((lag(`20dayMA`,1) over (order by `date`) > (lag(`50dayMA`,1) over (order by `date`))) and (`20dayMA`<`50dayMA`)) then 'Sell'
else 'Hold' end as `Signal`,
row_number() over() as rownumber
from
(
select eic.`Date`,eic.`Close Price`,`20dayMA`,`50dayMA`,
row_number() over() as rownum from eicher1 eic
) as u
) as v ;

-- SELECT * FROM EICHER2;

-- CREATION OF HERO2 TABLE
create table hero2 as 
select `Date`,`Close Price`,
case when rownumber=50 then 
(
case when `20dayMA`>`50dayMA` then 'Buy' 
	 when `20dayMA`<`50dayMA` then 'Sell' 
     else `Signal` end 
)
else `Signal` end as 'Signal'
from 
(
select `Date`,`Close Price`,`20dayMA`,`50dayMA`,
case when rownum<50 then null
when ((lag(`20dayMA`,1) over (order by `date`) < (lag(`50dayMA`,1) over (order by `date`))) and (`20dayMA`>`50dayMA`)) then 'Buy'
when ((lag(`20dayMA`,1) over (order by `date`) > (lag(`50dayMA`,1) over (order by `date`))) and (`20dayMA`<`50dayMA`)) then 'Sell'
else 'Hold' end as `Signal`,
row_number() over() as rownumber
from
(
select her.`Date`,her.`Close Price`,`20dayMA`,`50dayMA`,
row_number() over() as rownum from hero1 her
) as O
) as P;
-- SELECT * FROM HERO2;

-- CREATION OF INFOSYS2 TABLE
create table infosys2 as 
select `Date`,`Close Price`,
case when rownumber=50 then 
(
case when `20dayMA`>`50dayMA` then 'Buy' 
	 when `20dayMA`<`50dayMA` then 'Sell' 
     else `Signal` end 
)
else `Signal` end as 'Signal'
from 
(
select `Date`,`Close Price`,`20dayMA`,`50dayMA`,
case when rownum<50 then null
when ((lag(`20dayMA`,1) over (order by `date`) < (lag(`50dayMA`,1) over (order by `date`))) and (`20dayMA`>`50dayMA`)) then 'Buy'
when ((lag(`20dayMA`,1) over (order by `date`) > (lag(`50dayMA`,1) over (order by `date`))) and (`20dayMA`<`50dayMA`)) then 'Sell'
else 'Hold' end as `Signal`,
row_number() over() as rownumber
from
(
select inf.`Date`,inf.`Close Price`,`20dayMA`,`50dayMA`,
row_number() over() as rownum from infosys1 inf
) as Q
) as R ;
-- SELECT * FROM INFOSYS2;

-- CREATION OF TCS2 TABLE
create table tcs2 as 
select `Date`,`Close Price`,
case when rownumber=50 then 
(
case when `20dayMA`>`50dayMA` then 'Buy' 
	 when `20dayMA`<`50dayMA` then 'Sell' 
     else `Signal` end 
)
else `Signal` end as 'Signal'
from 
(
select `Date`,`Close Price`,`20dayMA`,`50dayMA`,
case when rownum<50 then null
when ((lag(`20dayMA`,1) over (order by `date`) < (lag(`50dayMA`,1) over (order by `date`))) and (`20dayMA`>`50dayMA`)) then 'Buy'
when ((lag(`20dayMA`,1) over (order by `date`) > (lag(`50dayMA`,1) over (order by `date`))) and (`20dayMA`<`50dayMA`)) then 'Sell'
else 'Hold' end as `Signal`,
row_number() over() as rownumber
from
(
select t.`Date`,t.`Close Price`,`20dayMA`,`50dayMA`,
row_number() over() as rownum from tcs1 t
) as S
) as T ;
-- SELECT * FROM TCS2;

-- CREATION OF TVS2 TABLE
create table tvs2 as 
select `Date`,`Close Price`,
case when rownumber=50 then 
(
case when `20dayMA`>`50dayMA` then 'Buy' 
	 when `20dayMA`<`50dayMA` then 'Sell' 
     else `Signal` end 
)
else `Signal` end as 'Signal'
from 
(
select `Date`,`Close Price`,`20dayMA`,`50dayMA`,
case when rownum<50 then null
when ((lag(`20dayMA`,1) over (order by `date`) < (lag(`50dayMA`,1) over (order by `date`))) and (`20dayMA`>`50dayMA`)) then 'Buy'
when ((lag(`20dayMA`,1) over (order by `date`) > (lag(`50dayMA`,1) over (order by `date`))) and (`20dayMA`<`50dayMA`)) then 'Sell'
else 'Hold' end as `Signal`,
row_number() over() as rownumber
from
(
select v.`Date`,v.`Close Price`,`20dayMA`,`50dayMA`,
row_number() over() as rownum from tvs1 v
) as U
) as V ;
-- SELECT * FROM TVS2;

-- QUESTION 4    CREATING USER DEFINED FUNCTION TO GENERATE SIGNAL FOR THE GIVEN DATE

-- drop function sig1;

delimiter //

create function sig1(p_date datetime)
returns varchar(4000)
DETERMINISTIC
begin
declare l_var varchar(200);
select (case when `Signal`=null then null else `Signal` end) into l_var from bajaj2 where Date=p_date;
return (l_var);
end;
//

DELIMITER ;

-- calling a function based on bajaj tables--

-- select `Date`,`Close price`,`20dayMA`,`50dayMA`,
-- sig1(Date) as 'Signal' from bajaj1;

-- select `Date`,`Close price`,
-- sig1(Date) as 'Signal' from bajaj2;













