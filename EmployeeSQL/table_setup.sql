-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/TDj10m
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Table Drops
DROP TABLE if exists public.departments;
DROP TABLE if exists public.employee_departments;
DROP TABLE if exists public.employees;
DROP TABLE if exists public.job_titles;
DROP TABLE if exists public.manager_departments;
DROP TABLE if exists public.salaries;


-- Table Creations
CREATE TABLE "departments" (
    "dept_no" VARCHAR(25) NOT NULL,
    "dept_name" VARCHAR(50) NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "employee_departments" (
    "emp_no" INTEGER   NOT NULL,
	"dept_no" VARCHAR(25)   NOT NULL,
    CONSTRAINT "pk_employee_departments" PRIMARY KEY (
        "dept_no","emp_no"
     )
);

CREATE TABLE "manager_departments" (
    "dept_no" VARCHAR(25)   NOT NULL,
    "emp_no" INTEGER   NOT NULL,
    CONSTRAINT "pk_manager_departments" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "employees" (
    "emp_no" INTEGER   NOT NULL,
    "emp_title_id" VARCHAR(25)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(50)   NOT NULL,
    "last_name" VARCHAR(50)   NOT NULL,
    "sex" VARCHAR(1) check (sex in ('M', 'F')) NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" INTEGER   NOT NULL,
	"salary" INTEGER   NOT null check (salary > 0),
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "job_titles" (
    "title_id" VARCHAR(25)   NOT NULL,
    "title" VARCHAR(20)   NOT NULL,
    CONSTRAINT "pk_job_titles" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "employee_departments" ADD CONSTRAINT "fk_employee_departments_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "employee_departments" ADD CONSTRAINT "fk_employee_departments_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "manager_departments" ADD CONSTRAINT "fk_manager_departments_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "manager_departments" ADD CONSTRAINT "fk_manager_departments_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "job_titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");



