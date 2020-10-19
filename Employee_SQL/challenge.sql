create table "departments" 
    ("dept_no" varchar(10),
    "dept_name" varchar(25));

create table "dept_emp"
	("emp_no" integer,
	"dept_no" varchar(10));

create table "dept_manager"
	("dept_no" varchar(10),
	"emp_no" integer);
	
create table "employees"
	("emp_no" integer,
	"emp_title_id" varchar(10),
	 "birth_date" date,
	 "first_name" varchar(30),
	 "last_name" varchar(40),
	 "sex" varchar (2),
	 "hire_date" date);
	 
create table "salaries"
	("emp_no" integer,
	"salary" varchar(10));
	
create table "titles"
	("title_id" varchar(10),
	"title" varchar (30))

-- Import all csv files into tables 

-- Analysis #1
select e.emp_no, e.first_name, e.last_name, e.sex, s.salary
from employees e
inner join salaries s
on e.emp_no = s.emp_no
order by emp_no 

-- Analysis #2
select first_name, last_name, hire_date
from employees
where hire_date < '1987-01-01' and hire_date >= '1986-01-01'

-- Analysis #3
select m.dept_no, d.dept_name, m.emp_no, e.first_name, e.last_name
from dept_manager m
inner join departments d
on m.dept_no = d.dept_no
inner join employees e
on m.emp_no = e.emp_no

-- Analysis #4
select e.emp_no, e.first_name, e.last_name, d.dept_name
from employees e
left join dept_emp x
on e.emp_no = x.emp_no
left join departments d
on x.dept_no = d.dept_no

-- Analysis #5
select first_name, last_name, sex
from employees
where first_name = 'Hercules' and last_name like 'B%'

-- Analysis #6
select e.emp_no, e.first_name, e.last_name, d.dept_name
from employees e
left join dept_emp x
on e.emp_no = x.emp_no
left join departments d
on x.dept_no = d.dept_no
where d.dept_name = 'Sales'

-- Analysis #7
select e.emp_no, e.first_name, e.last_name, d.dept_name
from employees e
left join dept_emp x
on e.emp_no = x.emp_no
left join departments d
on x.dept_no = d.dept_no
where d.dept_name = 'Sales' or
d.dept_name = 'Development'
 
-- Analysis #8
select last_name, count(last_name) as count
from employees
group by last_name
order by count desc