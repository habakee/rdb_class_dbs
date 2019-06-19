/*
 import 된 데이터 확인
*/
select count(*) from employees;
select count(*) from departments;
select count(*) from dept_manager;

/*
 비교 연산자
*/
select 3=3;
select 1 is True;
select 0 is false;

select * from employees where gender='M';
select * from departments where dept_name='Development';
SELECT * FROM dept_manager where dept_no!='d009';

select 3 between 2 and 7;
select 5 in (2, 3, 4, 5);
select * from salaries where salary>120000;
select * from salaries where salary between 30000 and 39999;
select * from dept_manager where dept_no in ('d001', 'd002');

/*
 산술연산자
*/
select 25+5, 25*5, 25 DIV 2, 25 % 2;
select emp_no, year(current_date())-year(hire_date) from employees;

/*
 논리연산자
*/
select * from dept_emp 
where dept_no='d001' 
and from_date> date_format('2002-01-01', '%Y-%m-%d');

select * from employees 
where first_name='Mary' or first_name='Akemi';

select * from employees
where year(hire_date) != 2002;

select * from dept_emp
where dept_no not in ('d001', 'd002', 'd003');

/*
 기타연산자
*/
select * from employees where first_name like 'M%';
select * from employees where emp_no like '111%';
select * from employees where emp_no like '1110_';

/* 
타입변환
*/ 
select cast('2019-06-10' as date);
select emp_no, cast(hire_date as datetime) from employees;
select convert(150, char);

/*
 기타함수
*/
select concat(first_name, ' ', last_name) 
from employees 
where first_name like 'M%';

select concat_ws(' ', first_name, last_name) 
from employees 
where first_name like 'M%';

select 
replace(dept_name, 'Service', 'Care') 
from departments;

select emp_no, first_name, year(birth_date) from employees;
select emp_no, first_name, month(birth_date) from employees;

select adddate('2019-05-31', 30);
select emp_no, hire_date, adddate(hire_date, INTERVAL 30 DAY) from employees;