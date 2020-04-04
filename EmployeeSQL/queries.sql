----1--------------------------------------------
SELECT e.emp_no AS "Employee Number",
	   e.last_name AS "Last Name",
	   e.first_name AS "First Name",
	   e.gender AS "Gender",
	   s.salary AS "Salary"
FROM employees e, salaries s
WHERE e.emp_no = s.emp_no;

----2--------------------------------------------
SELECT * FROM employees
WHERE hire_date LIKE '1986%';

----3--------------------------------------------
SELECT d.dept_no AS "Department Number",
	   d.dept_name AS "Department Name",
	   m.emp_no AS "Employee Number",
	   e.last_name AS "Last Name",
	   e.first_name AS "First Name",
	   m.from_date AS "Hire Date",
	   m.to_date AS "End Date"
FROM departments d, dept_managers m, employees e
WHERE d.dept_no = m.dept_no AND
	  m.emp_no = e.emp_no

----4--------------------------------------------
CREATE VIEW combined AS
SELECT dept_no, emp_no
FROM dept_managers
UNION
SELECT dept_no, emp_no
FROM dept_employees;

SELECT c.emp_no AS "Employee Number",
	   e.last_name AS "Last Name",
	   e.first_name AS "First Name",
	   d.dept_name AS "Department Name"
FROM combined c, employees e, departments d
WHERE c.emp_no = e.emp_no AND
	  c.dept_no = d.dept_no;

----5--------------------------------------------
SELECT *
FROM employees
WHERE first_name = 'Hercules' AND
	  last_name LIKE 'B%';

----6--------------------------------------------
SELECT c.emp_no AS "Employee Number",
	   e.last_name AS "Last Name",
	   e.first_name AS "First Name",
	   d.dept_name AS "Department Name"
FROM combined c, employees e, departments d
WHERE d.dept_name = 'Sales' AND
	  d.dept_no = c.dept_no AND
	  c.emp_no = e.emp_no;

----7--------------------------------------------
SELECT c.emp_no AS "Employee Number",
	   e.last_name AS "Last Name",
	   e.first_name AS "First Name",
	   d.dept_name AS "Department Name"
FROM combined c, employees e, departments d
WHERE d.dept_name IN ('Sales', 'Development') AND
	  d.dept_no = c.dept_no AND
	  c.emp_no = e.emp_no;

----8--------------------------------------------
CREATE VIEW name_count AS
SELECT last_name, COUNT(last_name) 
FROM employees
GROUP BY last_name;

SELECT * 
FROM name_count
ORDER BY count DESC;