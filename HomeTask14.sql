create table #EmptySeats(Number int, Empty varchar(1))

insert into #EmptySeats 
values (1, 'Y'), (2, 'N'), (3, 'N'), (4, 'Y'), (5, 'Y'), (6, 'Y'), (7, 'N'),
(8, 'Y'), (9, 'Y'), (10, 'Y'), (11, 'N'), (12, '')

select * from #EmptySeats

--Find 3 successive empty seats
with cte as(
select cast(number as varchar(5)) + '-' 
+cast((number+1) as varchar(5))+'-'
+cast((number+2) as varchar(5)) as a
from #emptyseats 
where number in (
select number from #emptyseats
where empty='Y') and
number+1 in (
select number from #emptyseats
where empty='Y') and
number+2 in (
select number from #emptyseats
where empty='Y')
)
select * from cte 



