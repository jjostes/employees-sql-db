--NOTE: using COUNT(emp_no) on tables containing the column, it can be seen that there are varying amounts
--		COUNT(dept_employees.emp_no) = 331603
--		COUNT(titles.emp_no) = 443308
--		COUNT(employees.emp_no) = 300024
--switching out table names in the following shows there are consistently 300024 distinct emp_no's.
SELECT COUNT(DISTINCT(emp_no))
FROM dept_employees;

--removing duplicates from dept_employees and titles
DELETE FROM dept_employees a
	USING dept_employees b
WHERE a.de_id < b.de_id
	AND a.emp_no = b.emp_no;
	
DELETE FROM titles a
	USING titles b
WHERE a.title_id < b.title_id
	AND a.emp_no = b.emp_no;

----1--------------------------------------------
--Creating the aliases was a  bit unnecessary, but I liked the cleaner looking output when doing this.
--I also liked using the following syntax for joins (found online). Thought it more concise than JOIN
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
	  m.emp_no = e.emp_no;
	  
----4--------------------------------------------
SELECT de.emp_no AS "Employee Number",
	   e.last_name AS "Last Name",
	   e.first_name AS "First Name",
	   d.dept_name AS "Department Name"
FROM dept_employees de, employees e, departments d
WHERE de.emp_no = e.emp_no AND
	  de.dept_no = d.dept_no;

----5--------------------------------------------
SELECT *
FROM employees
WHERE first_name = 'Hercules' AND
	  last_name LIKE 'B%';

----6--------------------------------------------
SELECT de.emp_no AS "Employee Number",
	   e.last_name AS "Last Name",
	   e.first_name AS "First Name",
	   d.dept_name AS "Department Name"
FROM dept_employees de, employees e, departments d
WHERE d.dept_name = 'Sales' AND
	  d.dept_no = de.dept_no AND
	  de.emp_no = e.emp_no;

----8--------------------------------------------
SELECT last_name, COUNT(last_name) 
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
