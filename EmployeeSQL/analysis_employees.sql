drop view if exists Employee_Salary_Info;
-- View for Employee info: No, first and last name, sex and salary from salary table.
create view Employee_Salary_Info as
select e.emp_no as "Employee Number", e.last_name as "Last Name" , e.first_name as "First Name" , e.sex as "Sex" , s.salary as "Salary" 
from employees e left join salaries s on e.emp_no = s.emp_no
;


drop view if exists Hired_in_1986;
-- View for Employees hired in 1986.
create view Hired_in_1986 as
select e.first_name as "First Name" , e.last_name as "Last Name" , e.hire_date as "Hire Date"  from employees e 
where extract(year from e.hire_date) = 1986;


