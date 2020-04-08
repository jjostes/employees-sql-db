CREATE TABLE departments (
	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR NOT NULL);
	
CREATE TABLE employees (
	emp_no INT PRIMARY KEY,
	birth_date VARCHAR NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	gender VARCHAR NOT NULL,
	hire_date VARCHAR NOT NULL);
	
--for this table, won't be using composite key in order to remove duplicate entries
CREATE TABLE dept_employees (
	emp_no INT REFERENCES employees(emp_no),
	dept_no VARCHAR REFERENCES departments(dept_no),
	from_date VARCHAR NOT NULL,
	to_date VARCHAR NOT NULL);

CREATE TABLE dept_managers (
	dept_no VARCHAR REFERENCES departments(dept_no),
	emp_no INT REFERENCES employees(emp_no),
	from_date VARCHAR NOT NULL,
	to_date VARCHAR NOT NULL,
	PRIMARY KEY (dept_no, emp_no));

CREATE TABLE salaries (
	emp_no INT REFERENCES employees(emp_no),
	salary INT NOT NULL,
	from_date VARCHAR,
	to_date VARCHAR);

CREATE TABLE titles (
	emp_no INT REFERENCES employees(emp_no),
	title VARCHAR NOT NULL,
	from_date VARCHAR,
	to_date VARCHAR);

--Added only after data imported; otherwise 'missing data' error for _id column
ALTER TABLE dept_employees
ADD COLUMN de_id SERIAL PRIMARY KEY;

ALTER TABLE salaries
ADD COLUMN salary_id SERIAL PRIMARY KEY;

ALTER TABLE titles
ADD COLUMN title_id SERIAL PRIMARY KEY;