-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no,
	e.last_name,
	e.first_name,
	e.sex,
	s.salary
FROM Employees as e
INNER JOIN Salaries as s ON
	e.emp_no = s.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT	e.first_name,
	e.last_name,
	e.hire_date
FROM Employees as e
WHERE e.hire_date >= '19860101' AND e.hire_date <= '19861231'
ORDER BY e.hire_date;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_no,
	d.dept_name
FROM Employees as e
INNER JOIN Department_Managers as dm ON
	e.emp_no = dm.emp_no
INNER JOIN Departments as d ON
	d.dept_no = dm.dept_no
ORDER BY d.dept_no;
	
-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_no,
	d.dept_name
FROM Employees as e
INNER JOIN Department_Employees as de ON
	e.emp_no = de.emp_no
INNER JOIN Departments as d ON
	d.dept_no = de.dept_no
ORDER BY e.emp_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT e.last_name,
	e.first_name,
	e.sex
FROM Employees as e
WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM Employees as e
INNER JOIN Department_Employees as de ON
	e.emp_no = de.emp_no
INNER JOIN Departments as d ON
	d.dept_no = de.dept_no
WHERE d.dept_no = 'd007'
ORDER BY e.emp_no;

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM Employees as e
INNER JOIN Department_Employees as de ON
	e.emp_no = de.emp_no
INNER JOIN Departments as d ON
	d.dept_no = de.dept_no
WHERE d.dept_no = 'd007' OR d.dept_no = 'd005'
ORDER BY e.emp_no;

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT e.last_name, COUNT(*) as last_names
FROM Employees as e
GROUP BY e.last_name
ORDER BY e.last_name DESC;