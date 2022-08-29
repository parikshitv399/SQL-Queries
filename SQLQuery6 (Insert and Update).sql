use MoviesDb
go

alter procedure sp_InsertMovie
@Name nvarchar(max),
@Producer nvarchar(max),
@Director nvarchar(max),
@Budget float
As
Begin
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
print 'The value for Movie ID is: ' + cast(@@Identity as varchar)
End
GO
exec sp_InsertMovie 'Acion Replayy','Rohit Shetty','Shetty Films',11
select * from Movies

create procedure sp_UpdateMovie
@Id INT,
@Name nvarchar(max),
@Producer nvarchar(max),
@Director nvarchar(max),
@Budget float
AS
UPDATE [dbo].[Movies]
   SET [Name] = @Name
      ,[Producer] = @Producer
	  ,[Director] = @Director
	  ,[Budget] = @Budget
WHERE Id = @Id
GO
exec sp_UpdateMovie 15,'Bajirao Mastani','YRF','SLB',2

create procedure sp_DeleteMovie
@Id INT
AS
DELETE FROM [dbo].[Movies]
      WHERE Id = @Id
GO
exec sp_DeleteMovie 16

