USE [MoviesDb]
GO
/****** Object:  Trigger [dbo].[trOnInsert]    Script Date: 24-08-2022 17:29:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[trOnInsert] ON  [dbo].[Movies]
   AFTER INSERT
AS 
BEGIN
Declare @Id as INT
Declare @MovieName as nvarchar(MAX)
Declare @Msg as nvarchar(MAX)

select @Id = Id, @MovieName = Name from inserted
set @Msg = 'Movie entry inserted with Movie Name = ' + @MovieName 
					+ ' and ID = ' + CAST(@Id as nvarchar(max)) 
					+ ' at '+ cast(getdate() as nvarchar(max))
INSERT INTO [dbo].[AuditLog]
           ([Id]
           ,[Msg])
     VALUES
           (newid()
		   ,@Msg)
END
