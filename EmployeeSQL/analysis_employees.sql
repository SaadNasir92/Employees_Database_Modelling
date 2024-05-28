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
where extract(year from e.hire_date) = 1986
;

drop view if exists Department_Managers;
--View for Manager of each department.
create view Department_Managers as
select d.dept_no as "Dept Num" , d.dept_name as "Dept Name", e.emp_no as "Emp Number", e.last_name as "Last Name", e.first_name as "First Name"
from departments d 
left join manager_departments md on d.dept_no = md.dept_no 
left join employees e on md.emp_no = e.emp_no 
;

drop view if exists Department_Employees;
-- View for employees with department number.
create view Department_Employees as
select d.dept_no as "Dept Num", e.emp_no as "Emp Number" , e.last_name as "Last Name", e.first_name as "First Name" , d.dept_name as "Dept Name"
from employees e 
left join employee_departments ed on e.emp_no = ed.emp_no 
left join departments d on ed.dept_no = d.dept_no 
;

-- Employees whose first name is Hercules and last name begins with b.
select * from employees e 
where first_name = 'Hercules' and last_name like 'B%';


drop view if exists Sales_Employees;
-- View of Sales department employees
create view Sales_Employees as
select e.emp_no as "Emp Number", e.first_name as "First Name", e.last_name as "Last Name", d.dept_name as "Dept Name"  
from departments d 
left join employee_departments ed on d.dept_no = ed.dept_no 
left join employees e on ed.emp_no = e.emp_no 
where d.dept_name = 'Sales';


drop view if exists Sales_and_Development_Employees;
-- View of each employee in the sales and development departments
create view Sales_and_Development_Employees as
select e.emp_no as "Emp Number", e.first_name as "First Name", e.last_name as "Last Name", d.dept_name as "Dept Name"  
from departments d 
left join employee_departments ed on d.dept_no = ed.dept_no 
left join employees e on ed.emp_no = e.emp_no 
where 
d.dept_name = 'Sales' or d.dept_name = 'Development'
;

drop view if exists same_last_name_employee_counts;
-- View of same last name employee count
create view same_last_name_employee_counts as
select last_name, count(*) as total  from employees e 
group by last_name 
order by total desc 
;
