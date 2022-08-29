Use MoviesDb
go
--
create view vw_Movies as
select * from Movies
go
--
create procedure sp_GetNamesThatStartWithI as
select * from Movies where Name like 'I%' order by Id,Name desc
Go
--
create function fn_Get()
Returns int
AS
Begin
	return (Select count(*) as MovieCount from Movies)
End
Go
--how many theatres are running a movie
--given MovieID = 1
create function fn_GetTheatreCountForMovie(@x int)
returns int
As
Begin
	return (Select count(TheatreId) as TheatreCount from MovieTheatre where MovieId=@x)
end
go
--
----------------------Executing above objects!-------------------------
--Executing view
Select * from vw_Movies
--Executing stored procedures
exec sp_GetNamesThatStartWithI
--Executing scalar functions
Select [dbo].[fn_Get]() MovieCount
select [dbo].[fn_GetTheatreCountForMovie](1) TheatreForMovie
-- Sam output but on the same table Select [dbo].[fn_Get]() MovieCount, [dbo].[fn_GetTheatreCountForMovie](1) TheatreForMovie
--Experimenting with logic
declare @v1 int
set @v1=2
Select [dbo].[fn_Get]() MovieCount, [dbo].[fn_GetTheatreCountForMovie](@v1) TheatreForMovie
go
--Assigning the value of a fn. output to a variable
create function fn_Outputs()
returns @result table (col1 int)
as 
begin
	declare @v2 int
	set @v2= (Select [dbo].[fn_Get]() MovieCount)
	insert into @result Select [dbo].[fn_GetTheatreCountForMovie](@v2) TheatreForMovie
return
end
go
Select * from [dbo].[fn_Outputs]()
