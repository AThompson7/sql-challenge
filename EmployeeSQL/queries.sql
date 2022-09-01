--1. list the employee number, last name, first name, sex and salary of each employee
SELECT employees.emp_no, last_name, first_name, sex, salaries.salary
FROM employees
INNER JOIN salaries ON (employees.emp_no = salaries.emp_no);

--2. list the first name, last name and hire date for employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986';


--3. list the manager of each department along with their department number, department name, employee number, last name and first name
SELECT dept_manager.dept_no, departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
FROM dept_manager
INNER JOIN departments ON (dept_manager.dept_no = departments.dept_no)
INNER JOIN employees ON (dept_manager.emp_no = employees.emp_no);

--4. list the department number for each employee along with that employees' employee number, last name, first name and department name
SELECT dept_emp.dept_no, dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
INNER JOIN employees ON (dept_emp.emp_no = employees.emp_no)
INNER JOIN departments ON (dept_emp.dept_no = departments.dept_no);

--5. list first name, last name and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6. list each employee in the sales department including their employee number, last name and first name
SELECT departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
FROM employees
INNER JOIN dept_emp ON (employees.emp_no = dept_emp.emp_no)
INNER JOIN departments ON (dept_emp.dept_no = departments.dept_no)
WHERE dept_name = 'Sales';



--7. list each employee in the sales and developer departments, including their employee number, last name , first name and department name
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_emp ON (employees.emp_no = dept_emp.emp_no)
INNER JOIN departments ON (dept_emp.dept_no = departments.dept_no)
WHERE dept_name = 'Sales' OR dept_name = 'Development';

--8. list the frequency counts, in descending order, of all the employee last names(that share last names)
SELECT last_name, COUNT(last_name) AS Frequency_of_last_name
FROM employees
GROUP BY last_name
ORDER BY Frequency_of_last_name DESC;