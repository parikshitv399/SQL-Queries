use [EmployeeDb.Data]
Go
--1
Select * from Employee
--2
Select * from Department
--3
Select * from Employee where Did = 2
--4
Select * from Employee as E inner join Department as D on E.Did=D.DptID where D.DptName = 'engg'
--5
Select * from Employee where EmpSalary > 200000
--6
Select count(EmpId) as CountInID, Did as DeptId from Employee group by Did
--7
Select count(E.EmpId) as CountInDept,D.DptName as DeptName from Department as D inner join Employee as E on D.DptID = E.Did group by D.DptName
--8
Select count(EmpId) as CountInDept, Did as DeptID from Employee where Did = 2 or Did = 3 group by Did order by Did desc
--9
Select * from Employee where Did is null
--10
Select EmpID as EmpID,ManagerID as ManagerID from Employee
--11
Select E1.EmpName as ManagerName,E2.EmpName as EmpName from Employee as E1, Employee as E2 where E1.EmpId = E2.ManagerID