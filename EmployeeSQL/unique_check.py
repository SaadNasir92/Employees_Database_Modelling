import pandas as pd
# Loan my csvs to check primary keys
employees = pd.read_csv('datasets/employees.csv')
departments = pd.read_csv('datasets/departments.csv')
employee_departments = pd.read_csv('datasets/dept_emp.csv')
manager_departments = pd.read_csv('datasets/dept_manager.csv')
salaries = pd.read_csv('datasets/salaries.csv')
job_titles = pd.read_csv('datasets/titles.csv')

# Function to check uniqueness of primary key columns
def check_uniqueness(df, column):
    if df[column].is_unique:
        print(f"Column '{column}' in DataFrame is unique.")
    else:
        print(f"Column '{column}' in DataFrame is NOT unique. Consider a composite key.")


# Check primary keys for uniqueness
check_uniqueness(employees, 'emp_no')
check_uniqueness(departments, 'dept_no')
check_uniqueness(salaries, 'emp_no')
check_uniqueness(job_titles, 'title_id')
check_uniqueness(employee_departments, 'emp_no')
check_uniqueness(manager_departments, 'emp_no')

# For composite keys, check combination uniqueness (function)
def check_composite_uniqueness(df, columns):
    if df[columns].duplicated().any():
        print(f"Columns {columns} in DataFrame are NOT unique together. Consider refining keys.")
    else:
        print(f"Columns {columns} in DataFrame are unique together.")

# Check composite keys for uniqueness
check_composite_uniqueness(employee_departments, ['emp_no', 'dept_no'])
check_composite_uniqueness(manager_departments, ['emp_no', 'dept_no'])
