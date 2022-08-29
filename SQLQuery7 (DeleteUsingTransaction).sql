alter procedure sp_DeleteUsingTransaction
@MovieID INT
AS
Begin transaction T1
DELETE FROM [dbo].[MovieTheatre]
      WHERE MovieID = @MovieID

if @@error <> 0
rollback Transaction T1

DELETE FROM [dbo].[Movies]
      WHERE Id = @MovieID

if @@error <> 0
rollback Transaction T1

Commit
exec sp_DeleteUsingTransaction 1
select * from Movies
select * from MovieTheatre
