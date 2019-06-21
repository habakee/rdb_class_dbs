/*
1. Sales, Research 부서 소속 직원 정보만 보고 싶다.
*/
-- sales 부서번호 찾기
SELECT dept_no FROM departments WHERE dept_name IN ('Sales', 'Research');
-- 직원과 부서 정보를 join으로 찾기
SELECT e.emp_no, first_name, last_name, dept_no 
FROM employees AS e 
INNER JOIN dept_emp AS d 
ON e.emp_no = d.emp_no;
-- subquery로 묶기
SELECT e.emp_no, first_name, last_name, dept_no
FROM employees AS e 
INNER JOIN dept_emp AS d 
ON e.emp_no = d.emp_no
WHERE d.dept_no IN (SELECT dept_no 
				   FROM departments
				   WHERE dept_name
                   IN ('Sales', 'Research'));
                   
/*
2. 현시점에서 각 부서별 직원 수를 확인하고 싶다.
*/
-- 한 부서에 소속된 직원 수 세보기
select dept_no, count(emp_no) 
from dept_emp 
where dept_no='d009';

-- 전체 부서에 대한 직원-부서 기록 숫자 세보기
select dept_no, count(emp_no)
from dept_emp
group by dept_no;

-- 직원-부서 기록 중, 소속 기간이 현재까지 진행 중인 데이터만 찾는다.
-- select * from dept_emp where to_date >= cast('9999-01-01' as date);
select * from dept_emp where to_date >= current_date();

-- subquery로 합치기
select dept_no, count(emp_no) 
from (
	select * 
    from dept_emp 
    where to_date >= current_date()
    ) as cur_det_emp
group by dept_no;

-- 전체 부서를 표기하고 싶다. (현재 소속 직원이 없어도)
SELECT * 
FROM departments AS d
LEFT JOIN (SELECT dept_no, COUNT(emp_no) 
  		  FROM (SELECT * 
			     FROM dept_emp
			     WHERE to_date >= CURRENT_DATE()) AS cur_det_emp 
		  GROUP BY dept_no) AS cnt_det_emp
ON  d.dept_no = cnt_det_emp.dept_no;

SELECT *
FROM 