DROP TABLE Department_Employees;
DROP TABLE Department_Managers;
DROP TABLE Salaries;
DROP TABLE Departments;
DROP TABLE Employees;
DROP TABLE Titles;

CREATE TABLE Titles (
	title_id VARCHAR(5) PRIMARY KEY,
	title VARCHAR(18) NOT NULL
);

CREATE TABLE Employees (
	emp_no VARCHAR(6) PRIMARY KEY,
	emp_title_id VARCHAR(5), 
	birth_date DATE NOT NULL,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(30),
	sex VARCHAR(1),
	hire_date DATE NOT NULL,
	CONSTRAINT fk_emp_title FOREIGN KEY (emp_title_id) REFERENCES Titles(title_id)
);

CREATE TABLE Departments (
	dept_no VARCHAR(4) PRIMARY KEY,
	dept_name VARCHAR(18) NOT NULL
);

CREATE TABLE Salaries (
	emp_no VARCHAR(6),
	salary int NOT NULL,
	PRIMARY KEY (emp_no, salary),
	CONSTRAINT fk_emp_no FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

CREATE TABLE Department_Managers (
	dept_no VARCHAR(4),
	emp_no VARCHAR(6),
	CONSTRAINT fk_emp_no FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	CONSTRAINT fk_dept_no FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
	PRIMARY KEY (dept_no,emp_no)
);

CREATE TABLE Department_Employees (
	emp_no VARCHAR(6),
	dept_no VARCHAR(4),
	CONSTRAINT fk_emp_no FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	CONSTRAINT fk_dept_no FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),	
	PRIMARY KEY (emp_no, dept_no)
);

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