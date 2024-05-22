use mvc

create table Employees (
EmpId int primary key identity(1,1),
EmpName varchar(100),
ProfileImage varchar(100),
Gender Varchar(100),
Department Varchar(100),
Salary int,
StartDate DateTime,
Notes VARCHAR(100))

alter procedure GetAllEmployees     
as      
Begin      
    select *      
    from Employees      
End
 
ALTER PROCEDURE AddAllEmployees
@EmpName varchar(100),
@ProfileImage varchar(100),
@Gender Varchar(100),
@Department Varchar(100),
@Salary int,
@StartDate DateTime,
@Notes VARCHAR(100) 
AS
BEGIN
     Insert into Employees (EmpName,ProfileImage,Gender,Department,Salary,StartDate,Notes)         
    Values (@EmpName,@ProfileImage,@Gender,@Department,@Salary,@StartDate,@Notes)         

END 

alter PROCEDURE UpdateEmployee
@EmpId int,
@EmpName varchar(100),
@ProfileImage varchar(100),
@Gender Varchar(100),
@Department Varchar(100),
@Salary int,
@Notes varchar(100)
as
begin
update Employees
set EmpName = @EmpName,
ProfileImage=@ProfileImage,
Gender=@Gender,
Department=@Department,
Salary=@Salary,
Notes=@Notes
where EmpId=@EmpId
end 
exec UpdateEmployee 1,'ramya','img','female','ece',20000,'Hi'

create procedure GetElementById
@EmpId int
as begin
select * from Employees
where EmpId=@EmpId
end 

create procedure DeleteEmp
@EmpId int
as 
begin 
delete from Employees Where EmpId=@EmpId
end 

create procedure LoginEmployee
@Id int,
@name varchar(100)
as
begin
select * from Employees
where EmpId=@id and EmpName=@name;
end;
exec LoginEmployee 1,'Ramya'



--get elmployee by name

use mvc;
alter procedure InsertUpdate 
@id int,
@name varchar(100),
@ProfileImage varchar(100),
@Gender varchar(100),
@Department varchar(100),
@Salary int ,
@StartDate DateTime,
@Notes varchar(100)
as
begin
if Exists (select * from Employees where empId=@id)
begin
update Employees
set EmpName=@name,ProfileImage = @ProfileImage,Gender=@Gender
end
else
begin
insert into Employees(EmpName,ProfileImage,Gender,Department,Salary,StartDate,Notes)
values(@name,@ProfileImage,@Gender,@Department,@Salary,@StartDate,@Notes)
end
end

exec InsertUpdate  6,'Lokesh','png','Male','IT',40000,2024-3-4,'Hii' 


use mvc
alter procedure GetEmpByName
@name varchar(100)
as
begin 
select * from Employees where EmpName=@name
end; 

exec GetEmpByName 'Ramya'