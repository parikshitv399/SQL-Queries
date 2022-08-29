USE [MoviesDb]
GO
/****** Object:  Trigger [dbo].[trOnInsert]    Script Date: 24-08-2022 17:29:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[trOnDelete] ON  [dbo].[Movies]
   AFTER Delete
AS 
BEGIN
Declare @Id as INT
Declare @Msg as nvarchar(MAX)

select @Id = Id from deleted
set @Msg = 'Movie entry deleted with ID = ' + CAST(@Id as nvarchar(max)) 
					+ ' at '+ cast(getdate() as nvarchar(max))
INSERT INTO [dbo].[AuditLog]
           ([Id]
           ,[Msg])
     VALUES
           (newid()
		   ,@Msg)
END
select * from AuditLog