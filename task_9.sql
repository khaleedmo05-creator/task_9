use BikeStores 

--Part 1

create table Employees(
ID int identity,
FirstName varchar(20),
LastName varchar(20),
Salary int 
)

create procedure GetAllEmployees
as
begin
select *
from Employees
end

exec GetAllEmployees


create procedure GetHighSalaryEmployees(@MinSalary decimal)
as begin 
select *
from Employees
where Salary > @MinSalary
end

exec GetHighSalaryEmployees 2000


Create procedure AddEmployee(@FirstName varchar(20), @LastName varchar(20), @Salary decimal)
as begin 
insert into Employees
values (@FirstName, @LastName, @Salary)
end

exec AddEmployee k, m, 50000


--Part 2

create table EmployeeLog (
    Id int identity,
    EmployeeId int,
    Action varchar(50),
    ActionDate datetime
)


create trigger trigger_1
on Employees
after insert
as 
begin
insert into EmployeeLog(EmployeeId, Action, ActionDate)
select Id, 'Employee Added', GETDATE()
from inserted
end
