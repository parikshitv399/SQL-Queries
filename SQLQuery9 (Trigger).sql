USE [MoviesDb]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[sp_InsertMovie]
		@Name = N'Don 2',
		@Producer = N'SRK Films',
		@Director = N'Don''t know',
		@Budget = 3

SELECT	'Return Value' = @return_value

GO

select * from AuditLog
select*from MovieTheatre
