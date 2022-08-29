use [EmployeeDb.Data]
Go
--Creating Employee View
create view vw_empdb as
Select * from Employee
go
--
--Selecting employees of specific Departments
alter function fn_SpecificDept(@x int)
returns @result table (EmpId int, EmpName nvarchar(max), EmpDesignation nvarchar(max), EmpSalary float, Did int, ManagerID int)
as
begin
	insert into @result Select * from Employee where Did = @x
	return
end
go
--Exec
Select * from [dbo].[fn_SpecificDept](1)
--Creating procedure for salary greater than 200000
create procedure sp_SalaryGreaterThan2L as
select * from Employee where EmpSalary > 200000 order by EmpSalary desc
Go


