-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/TDj10m
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.
-- Actual table scripts under table_setup.sql - this is just the default that was given via QUICKDBD, my edits and additional constraints were done under table_setup.sql. 

CREATE TABLE "departments" (
    "dept_id" INTEGER   NOT NULL,
    "dept_name" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_id"
     )
);

CREATE TABLE "employee_departments" (
    "dept_id" INTEGER   NOT NULL,
    "emp_id" INTEGER   NOT NULL,
    CONSTRAINT "pk_employee_departments" PRIMARY KEY (
        "dept_id","emp_id"
     )
);

CREATE TABLE "manager_departments" (
    "dept_no" INTEGER   NOT NULL,
    "emp_no" INTEGER   NOT NULL,
    CONSTRAINT "pk_manager_departments" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "employees" (
    "emp_id" INTEGER   NOT NULL,
    "emp_title_id" INTEGER   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(50)   NOT NULL,
    "last_name" VARCHAR(50)   NOT NULL,
    -- M or F, add constraint after import.
    "sex" VARCHAR(1)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_id"
     )
);

CREATE TABLE "salaries" (
    -- Positive number, add constraint during table creation. 
    "salary" INTEGER   NOT NULL,
    "emp_id" INTEGER   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_id"
     )
);

CREATE TABLE "job_titles" (
    "title_id" INTEGER   NOT NULL,
    "title" VARCHAR(20)   NOT NULL,
    CONSTRAINT "pk_job_titles" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "employee_departments" ADD CONSTRAINT "fk_employee_departments_dept_id" FOREIGN KEY("dept_id")
REFERENCES "departments" ("dept_id");

ALTER TABLE "employee_departments" ADD CONSTRAINT "fk_employee_departments_emp_id" FOREIGN KEY("emp_id")
REFERENCES "employees" ("emp_id");

ALTER TABLE "manager_departments" ADD CONSTRAINT "fk_manager_departments_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_id");

ALTER TABLE "manager_departments" ADD CONSTRAINT "fk_manager_departments_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_id");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "job_titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_id" FOREIGN KEY("emp_id")
REFERENCES "employees" ("emp_id");

