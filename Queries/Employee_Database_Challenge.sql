SELECT emp_no,
	first_name,
	last_name
	from employees

SELECT title,
	from_date,
	to_date
	FROM Titles

SELECT e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
	into retirement_titles
	from employees as e
	inner join titles as ti
	ON (e.emp_no = ti.emp_no)
	WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	order by ti.emp_no;
	
SELECT * from retirement_titles	
SELECT emp_no,
	first_name,
	last_name,
	title
	from retirement_titles

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no)
	emp_no,
	first_name,
	last_name,
	title
	INTO unique_titles
	FROM retirement_titles as re
	wHERE re.to_date = ('9999-01-01')
	ORDER BY emp_no, to_date DESC;
	
select * from unique_titles

SELECT count(ut.emp_no),
	title
	INTO retiring_titles
	from unique_titles as ut
	group by title
	order by count(ut.emp_no) DESC;
select * from retiring_titles
	
	SELECT DISTINCT ON (emp_no)
	e.emp_no,
    e.first_name,
	e.last_name,
    e.birth_date,
    de.from_date,
    de.to_date,
	ti.title
	INTO mentorship_eligibility
	FROM employees as e
	INNER JOIN dept_emp as de
	ON (e.emp_no = de.emp_no)
	INNER JOIN titles as ti
	ON (e.emp_no = ti.emp_no)
	WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (de.to_date = '9999-01-01')
	ORDER by emp_no;
	
	SELECT * from mentorship_eligibility