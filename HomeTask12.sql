Declare @todate datetime, @fromdate datetime
set @fromdate = '2025-01-01'
set @todate = '2025-31-12';

With DateSequence( [Date] ) as
(
    Select @fromdate as [Date]
        union all
    Select dateadd(day, 1, [Date])
        from DateSequence
        where Date < @todate
)

--Continue your code from here
select
format([Date], 'yyyyMMdd')as id,
[Date],

day([Date]) as day,

cast(day([Date]) as varchar(100))+(
case 
when day([Date])=1 then 'st'
when day([Date])=2 then 'nd'
when day([Date])=3 then 'rd'
else 'th' end) as DaySuffix,

datename(WEEKDAY, [Date]) as DayOfWeek,

datepart(dayofYear, [Date]) as DayOfYear,

datename(week, [Date]) as WeekOfYear,

CEILING(DAY([Date]) / 7.0) as WeekofMonth,

month([Date]) as Month,

DATENAME(month, [Date]) as MonthName,

datepart(quarter,[Date]) as quarter,

case 
when datepart(quarter,[Date])=1 then '1st'
when datepart(quarter,[Date])=2 then '2nd'
when datepart(quarter,[Date])=3 then '3rd'
else '4th' 
end as quartername,

year([Date]) as Year

from DateSequence
OPTION (MAXRECURSION 0)

