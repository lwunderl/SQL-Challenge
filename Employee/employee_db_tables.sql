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
