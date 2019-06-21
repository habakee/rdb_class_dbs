/*
Alias 
*/
select concat(first_name, ' ', last_name) as emp_name from employees;
select emp_no from dept_emp as sales_emps where dept_no='d007';

/*
JOIN A, B 테이블 활용
*/
select * from A inner join B on A.id=B.id;
select * from A join B on A.id=B.id;

select * from A left outer join B on A.id=B.id;
select * from A left join B on A.id=B.id;
select * from A left outer join B on A.id=B.id where B.id is null;

select * from A right outer join B on A.id=B.id;
select * from A right join B on A.id=B.id;
select * from A right outer join B on A.id=B.id where A.id is null;

select * from A left outer join B on A.id=B.id
union
select * from A right outer join B on A.id=B.id;

select * from A left outer join B on A.id=B.id where B.id is null
union
select * from A right outer join B on A.id=B.id where A.id is null;

/*
JOIN employees 테이블들과 함께
*/
-- 1. 직원정보와 부서 번호를 함께 보고 싶다.
select * from employees as e inner join dept_emp as d on e.emp_no=d.emp_no;

-- 2. 여러 부서 기록을 가지고 있는 직원
select emp_no, count(dept_no) as c from dept_emp group by emp_no order by c desc;
select * from dept_emp where emp_no=10817;	
select * from employees as e inner join dept_emp as d on e.emp_no=d.emp_no where e.emp_no=10817;

-- 3. 새로운 부서를 개설하였다.
insert into departments values ('d000', 'Task Force');
-- 4. 아직 새로운 부서의 매니저는 결정되지 않았다. 부서를 기준으로 매니저들을 보고 싶다.
select * from departments as d left outer join dept_manager as m on d.dept_no=m.dept_no;

-- 5. 직원-부서명을 함께 보고 싶다.
select * from dept_emp as de
inner join employees as e on de.emp_no=e.emp_no
inner join departments as d on de.dept_no=d.dept_no;

select * from dept_emp as de
inner join employees as e on de.emp_no=e.emp_no
inner join departments as d on de.dept_no=d.dept_no
where de.emp_no=10817;

-- 6. 부서-매니저 상세 정보까지 보고 싶다
select * from dept_manager as dm
right outer join departments as d on dm.dept_no=d.dept_no
inner join employees as e on dm.emp_no=e.emp_no;

-- 7. 새로 추가한 부서 정보까지 보고싶다
select * from dept_manager as dm
right outer join departments as d on dm.dept_no=d.dept_no
left join employees as e on dm.emp_no=e.emp_no;
-- select count(*) from dept_manager;

-- 8.  직원들에게 나눠줄 물품 정리를 위해 성(last_name)을 기준으로 6개의 클래스로 구별하였다.
select * from name_class;

-- 첫번째 글자만 꺼내기
select emp_no, substr(last_name, 1, 1), last_name from employees;

-- 9. 직원 이름에서 첫번째 문자를 기준으로 class 지정하기
select start_L, last_name, first_name, emp_no from employees as e
inner join name_class as n
on substr(last_name, 1, 1) >= n.start_L and substr(last_name, 1, 1) <= n.end_L
order by start_L, last_name;

-- between 사용
select start_L, last_name, first_name, emp_no from employees as e
inner join name_class as n
on substr(last_name, 1, 1) between n.start_L and n.end_L
order by start_L, last_name;

-- select first_le, count(emp_no) 
-- from (select emp_no, substr(last_name, 1, 1) as first_le, last_name 
-- 	from employees) as first_le_test 
-- group by first_le
-- order by first_le;

-- 10. 직원의 직함을 같이 보고 싶다.
select * from employees as e
LEFT JOIN titles as t
ON e.emp_no=t.emp_no;

-- 11. 현재의 직함만을 보고 싶다.
SELECT *
FROM employees AS e
INNER JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE t.to_date >= CURRENT_DATE();