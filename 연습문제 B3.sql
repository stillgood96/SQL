-- 연습문제 B3- HR데이터베이스

-- 모든 사원들의 LAST_NAME, 부서 이름 및
-- 부서 번호을 조회하세요
select last_name,department_name,d.department_id
from employees
inner join departments d on employees.department_id = d.department_id;

-- 수업ver
select last_name,department_name,department_id
from employees e join departments d
using(department_id);


-- 부서번호 30의 모든 직업들과 부서명으로 조회
-- 하세요. 90 부서 또한 포함한다.
select job_id,department_name,d.department_id
from employees
inner join departments d on employees.department_id = d.department_id
where employees.department_id=30 or employees.department_id=90;

select job_id,department_name
from departments
inner join employees e on departments.department_id = e.department_id
where department_id=30 and departments.department_id=90;

-- 수업 ver
select distinct job_id,department_name
from employees e join departments d
using(department_id)
-- where department_id=30 or department_id=90;
where department_id in(30,90);


-- 부서번호 30 이하의 모든 직업들과
-- 부서명으로 조회하세요
select distinct job_id,department_name,d.department_id
from employees
inner join departments d on employees.department_id = d.department_id
where d.department_id<=30;

-- 수업ver
select job_id, department_name
from employees e join departments d
using(department_id)
where department_id<=30;


-- 커미션을 버는 모든 사람들의 LAST_NAME,
-- 부서명, 지역 ID 및 도시 명을 조회하세요
select last_name,department_name,d.location_id,city
from employees
left outer join departments d on employees.department_id = d.department_id
inner join locations l on d.location_id = l.location_id
where commission_pct is not null;

select * from employees
where commission_pct is not null;


-- 수업 ver
select last_name, department_name,location_id,city
from employees e join departments d
using (department_id)
join locations l
using (location_id)
where commission_pct is not null;


-- 커미션을 버는 사람들 중 시애틀드에 거주하는
-- 사람들의 LAST_NAME, 부서명, 지역 ID 및
-- 도시 명을 조회하세요(옥스포드)
select last_name,department_name,d.location_id,city
from employees
left outer join departments d on employees.department_id = d.department_id
inner join locations l on d.location_id = l.location_id
where commission_pct is not null and l.city = 'seattle';


-- 수업 ver
select last_name, department_name,location_id,city
from employees e join departments d
using (department_id)
join locations l
using (location_id)
where commission_pct is not null and l.city ='Seattle';



-- 자신의 매니저보다 먼저 고용된 사원들의
-- LAST_NAME 및 고용일을 조회하세요.
select distinct e.last_name,e.hire_date
from employees e
inner join employees d on d.manager_id=e.employee_id
where d.hire_date>e.hire_date;

select
from employees

-- 못품


-- 부서별 사원수를 조회하세요
-- 단, 부서명도 함께 출력합니다
select department_name,count(employee_id)
from employees
inner join departments d on employees.department_id = d.department_id
group by d.department_id;




-- 부서별 사원수를 조회하세요
-- 단, 부서명도 함께 출력하고
-- 단, 사원수가 0이어도 부서명을 출력합니다
select department_name,count(employee_id)
from employees
inner join departments d on employees.department_id = d.department_id
group by d.department_id
having count(employee_id)>=0;
-- 못품


