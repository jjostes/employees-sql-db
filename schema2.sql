CREATE TABLE departments (
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR NOT NULL);
	
CREATE TABLE employees (
	emp_no INT NOT NULL,
	birth_date VARCHAR NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	gender VARCHAR NOT NULL,
	hire_date VARCHAR NOT NULL);
	
CREATE TABLE dept_employees (
	emp_no INT,
	dept_no VARCHAR,
	from_date VARCHAR NOT NULL,
	to_date VARCHAR NOT NULL);

CREATE TABLE dept_managers (
	dept_no VARCHAR,
	emp_no INT,
	from_date VARCHAR NOT NULL,
	to_date VARCHAR NOT NULL);

CREATE TABLE salaries (
	emp_no INT,
	salary INT NOT NULL,
	from_date VARCHAR NOT NULL,
	to_date VARCHAR NOT NULL);

CREATE TABLE titles (
	emp_no INT,
	title VARCHAR NOT NULL,
	from_date VARCHAR NOT NULL,
	to_date VARCHAR NOT NULL);