use [MoviesDb]
go
select * from Movies
select count(*) as TheatreCount, MovieId from MovieTheatre group by MovieID
declare @name nvarchar(max)
declare @count int
declare  c1 cursor for
select m.Name, count(mt.TheatreId) as TheatreCount from Movies m left outer join MovieTheatre mt 
													on m.Id = mt.MovieID 
													group by m.name
open c1
fetch next from c1
into @name, @count

while @@FETCH_STATUS = 0
begin
	if @count > 0
		print @name + ' is a hit movie'
	else if @count = 0
		print @name + ' is a flop movie'
fetch next from c1 into @name,@count
end

------Using Case------
select m.Name, case 
					when Count(mt.TheatreId) > 0 then m.Name + ' is a hit movie'
					when Count(mt.TheatreId) = 0 then m.Name + ' is a flop movie'
					else m.Name + ' is a flop movie'
			   End as MovieVerdict

from Movies m Left outer join MovieTheatre mt on m.Id = mt.MovieID group by m.Name order by Count(mt.TheatreID) desc