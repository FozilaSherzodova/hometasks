--1
select f.Title, s.Source from Film f
join Source s on f.SourceID = s.SourceID
where s.Source = 'NA'

--2
select c.CountryName as Country, e.EventDetails as [What happened], e.EventDate [When Happened] 
from tblCountry c
join tblEvent e on c.CountryID=e.CountryID

--3
select a.AuthorName, e.Title, e.EpisodeType from tblAuthor a
join tblEpisode e on a.AuthorId=e.AuthorId
order by a.AuthorName

--4
SELECT Artist.Artist AS [Artist name], Album.Title AS [Album name], Track.Track_name AS [Track name]
FROM Artist 
INNER JOIN Album ON Artist.Artist_ID = Album.Artist_ID 
INNER JOIN Track ON Album.Album_ID = Track.Album_ID
WHERE (Track.Track_name LIKE N'%easy%') OR Track.Track_name LIKE N'%simple%')
ORDER BY [Album name]

--5
select * from tblCategory c
left join tblEvent e on c.CategoryID=e.CategoryID
where e.EventName is null

--6
select d.DoctorName, e.Title from tblDoctor d
inner join tblEpisode e on d.DoctorId=e.DoctorId
where year(d.FirstEpisodeDate)=2010

--7
select e.EventName, e.EventDate, c2.CountryName, c1.ContinentName from tblContinent c1
join tblCountry c2 on c1.ContinentID=c2.ContinentID
join tblEvent e on c2.CountryID=e.CountryID
where c1.ContinentName = 'Antarctic' or c2.CountryName = 'Russia'

--8
select a.Title, a.[US_sales_(m)], s.Subgenre
from dbo.Album as a
inner join dbo.Subgenre as s on a.Subgenre_ID = s.Subgenre_ID
inner join dbo.Genre as g on s.Genre_ID = g.Genre_ID
where a.[US_sales_(m)] >= 0.5 and a.[US_sales_(m)] < 10 and g.Genre = 'metal'
order by a.Title asc

--9
select * from tblEnemy en
inner join tblEpisodeEnemy ep on en.EnemyId=ep.EnemyId
inner join tblEpisode e on ep.EpisodeId=e.EpisodeId
inner join tblAuthor a on e.AuthorId=a.AuthorId
where en.EnemyName like '%Dalek%'


select * from tblEnemy
select * from tblEpisodeEnemy
select * from tblepisode
select * from tblAuthor

--10
select a.Artist, t.Tour_name, s.Show_date, v.Venue, s.Leg, s.Tickets_sold
from dbo.Show as s
inner join dbo.Venue as v on v.Venue_ID = s.Venue_ID
inner join dbo.City as c on c.City_ID = v.City_ID
inner join dbo.Tour as t on t.Tour_ID = s.Tour_ID
inner join dbo.Artist as a on a.Artist_ID = t.Artist_ID
where c.City = 'Manchester'
order by Show_date asc

--11
select c.CountryName from tblCountry c
left outer join tblEvent e on c.CountryID=e.CountryID
where EventID is null

--12
select a.AuthorName, e.Title, d.DoctorName, en.EnemyName, 
(len(a.authorname)+len(e.Title)+len(en.EnemyName)+len(d.DoctorName)) as totalLength 
from tblEnemy en
inner join tblEpisodeEnemy ep on en.EnemyId=ep.EnemyId
inner join tblEpisode e on ep.EpisodeId=e.EpisodeId
inner join tblAuthor a on e.AuthorId=a.AuthorId
inner join tblDoctor d on  e.DoctorId=d.DoctorId
where (len(a.authorname)+len(e.Title)+len(en.EnemyName)+len(d.DoctorName)) <40

