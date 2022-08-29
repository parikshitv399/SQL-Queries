

alter procedure sp_InsertMovieUsingTransaction
@Name nvarchar(max),
@Producer nvarchar(max),
@Director nvarchar(max),
@Budget float,
@TheatreID int
AS
Begin Transaction T

INSERT INTO [dbo].[Movies]
           ([Name]
           ,[Producer]
           ,[Director]
           ,[Budget])
     VALUES
           (@Name,
		    @Producer,
			@Director,
			@Budget)
declare @MovieID INT
print @@Identity
SET @MovieID = @@IDENTITY
INSERT INTO [dbo].[MovieTheatre]
           ([MovieID]
           ,[TheatreID])
     VALUES
           (@MovieID
           ,@TheatreID)
commit transaction T
GO

select * from MovieTheatre
exec sp_InsertMovieUsingTransaction 'Don','YRF','Rajkumar Hirani',100,3