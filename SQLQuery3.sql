USE MoviesDb
GO

--Select all movies

Select * from Movies

--Select all theatres

Select * from Theatre
Select * from MovieTheatre

--Select all movies that are shown in theatre id = 1

Select Name from Movies where Id in ( Select MovieId from MovieTheatre where TheatreID = 1)

--Sort all movies that start with "I" in desc order of their ID

Select * from Movies where Movies.Name like 'I%' order by ID desc

--Get all theatres that show the movies {1,2,3}

Select * from Theatre where Id in (Select TheatreID from MovieTheatre where MovieID in (1,2,3))
Select * from Theatre as T inner join MovieTheatre as MT ON t.Id = MT.TheatreID where MT.MovieID in (1,2,3)

---Get all theatres that show movies
Select distinct t.Id, t.Name, t.TotalScreens from Theatre t left outer join MovieTheatre mt on t.Id =mt.TheatreID

--Total count of theatres that show movies

Select count(distinct t.Id) from Theatre t left outer join MovieTheatre mt on t.Id = mt.TheatreID

--Theatre count per movie

Select count(t.Id) as TheatreCount, m.Name from Theatre t left outer join MovieTheatre mt on t.Id = mt.TheatreID  
inner join Movies m on mt.MovieID = m.Id group by m.Name

--total movie count per theatre

Select count(m.Id) as MovieCount, t.Name from Movies m left outer join MovieTheatre mt on m.Id = mt.MovieID
inner join Theatre t on mt.TheatreID = t.Id group by t.Name

--Get all theatre details and movie details for a movie 4

Select * from Movies as m cross join Theatre as t where t.Id in (Select TheatreID from MovieTheatre where MovieID = 4) and m.Id = 4
Select t.Name as TheatreName, m.Name as MovieName from Theatre as t full outer join MovieTheatre as mt ON t.Id = mt.TheatreID 
							full outer join Movies as m ON m.Id = mt.MovieID where m.Id = 4

--Get which movie are not shown in any theatre

Select * from Movies where Id not in (Select MovieID from MovieTheatre where TheatreID is NULL)

--Get all movies and theatre that show movies and do not show movies

Select * from Movies cross join Theatre 
