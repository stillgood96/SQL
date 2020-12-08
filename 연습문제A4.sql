-- LAST_NAME 이 Zlotkey 와 동일한 부서에
-- 근무하는 모든 사원들의 사번 및
-- 고용날짜를 조회한다. 단, Zlotkey 는 제외한다.
select employee_id,department_id
from employees where last_name = 'Zlotkey';

select employee_id,hire_date from employees where department_id=80;


select employee_id,hire_date from employees where department_id=(
    select department_id from departments where department_id=80
    )and employee_id <> 149;

-- 선생님 ver
-- a) Zlotkey의 부서
select department_id from employees
where last_name='Zlotkey';
-- b) Zlotkey의 부서와 동일한 부서 근무
select employee_id,hire_date from employees
where department_id=80;

-- c)
select employee_id,hire_date from employees
where department_id=(
    select department_id from employees
    where last_name='Zlotkey'
    ) and last_name <> 'Zlotkey';



-- 회사 전체 평균 연봉보다 더 받는 사원들의
-- 사번 및 LAST_NAME 을 조회한다.
select avg(salary) from employees;

select employee_id,last_name,salary from employees where salary>(
    select avg(salary) from employees
    )
order by salary desc;


-- 선생님 ver
-- a) 회사 전체 평균연봉
select avg(salary) from employees; -- 6462

-- b) 회사 전체 평균 연봉보다 많이 받는 사원
select employee_id,last_name
from employees
where salary>6462;
-- c) 둘다 합치자
select employee_id,last_name
from employees
where salary>(
    select avg(salary) from employees
    );



-- LAST_NAME 에 u가 포함되는
-- 사원들과 동일 부서에 근무하는 사원들의
-- 사번 및 LAST_NAME 을 조회한다.

select last_name,department_id from employees where last_name like '%u%';

select employee_id,last_name,department_id from employees where last_name like '%u%' or
department_id = (select department_id from departments where department_id=50)
order by department_id asc;


-- 수업ver
-- a) last_name에 u를 포함하는 사원들과 동일 부서에 근무
select distinct department_id from employees
where last_name like '%u%'; -- 30,50,60,80,100

-- b) 동일 부서에 근무하는 사원들
select employee_id,last_name from employees
where department_id in (30,50,60,80,100);



-- c) 두개의 질의문을 하나로 합침
select employee_id,last_name from employees
where department_id in (
    select distinct department_id from employees
    where last_name like '%u%'
    );



-- King 을 매니저로 두고 있는 모든 사원들의
-- LAST_NAME 및 연봉을 조회한다.
-- 즉, King의 부하직원의 성과 연봉 조회하라
select employee_id,last_name from employees where last_name='King';
select employee_id,last_name,manager_id from employees where manager_id='100,156';

select last_name,salary from employees where manager_id=(
    select manager_id from employees where manager_id=100
    );

select last_name,salary from employees where manager_id=(
    select manager_id from employees where last_name='King' and manager_id is not null
    );


-- 선생님 ver
-- a)
select employee_id from employees where last_name='King' or first_name='King';
-- 100,156

-- b) king 을 매니저로 두고 있는 모든 사원
select last_name, salary from employees
where manager_id in (100,156);

-- c) 두개의 질의문을 하나로 합침
select last_name, salary from employees
where manager_id in (
    select employee_id from employees where last_name='King' or first_name='King'
    );


-- EXECUTIVE 부서에 근무하는
-- 모든 사원들의 부서 번호,
-- LAST_NAME, JOB_ID를  조회한다.
select department_id,last_name,job_id from employees where department_id=(
    select department_id from departments where department_name='EXECUTIVE'
    );

-- 선생님 ver

-- a) EXECUTIVE 부서
select department_id from departments
where department_name = 'EXECUTIVE';
-- b) EXECITOVE 부서에 근무하는 사원
select department_id,last_name,job_id from employees where department_id=90;
-- c) 두개의 질의문을 하나로 합침
select department_id,last_name,job_id from employees where department_id = (
    select department_id from departments
    where department_name = 'EXECUTIVE'
    );




-- 회사 전체 평균 연봉보다
-- 더 버는 사원들 중 LAST_NAME 에
-- u 가 있는 사원들이 근무하는 부서에서
-- 근무하는 사원들의 사번, LAST_NAME 및
-- 연봉을 조회한다.


select last_name,salary as 연봉 from employees
group by salary
having salary > avg(salary);


-- 수업 ver
-- a) 회사 전체 평균 연봉
select avg(salary) from employees; -- 6462
-- b) 평균 연봉보다 더 버는 사원들중
-- lastname에 u가 포함된 사원들의 부서
select department_id,last_name,salary from employees
where salary>6462 and last_name like '%u%';
-- c)
select employee_id,last_name,salary from employees
where department_id in (50,60,80,100);
-- d) 세개의 질의문을 하나로 합침

select employee_id, last_name,salary from employees
where department_id in (select distinct department_id
    from employees where last_name like '%u%'
    and salary>(select avg(salary)from employees));


-- 막간에 내가해봄
select employee_id,last_name,salary from employees
where department_id in (
    select department_id from employees
    where salary>6462 and last_name like '%u%'
    )
order by salary desc;



-- 직업ID 가 SA_MAN 인 사원들이
-- 받을 수 있는 최대 연봉보다 높게 받는
-- 사원들의 LAST_NAME, JOB_ID 및 연봉을
-- 조회한다.
select max(salary) from employees where job_id='SA_MAN';

select last_name,job_id,salary from employees where salary>(
    select max(salary) from employees where job_id='SA_MAN'
    );

-- 수업 ver
-- a) SA_MAN인 사원들이 받을 수 있는 최대 연봉
select max_salary from jobs
where job_id ='SA_MAN'; -- 20080

-- b)  SA_MAN의 최대연봉보다 많이 받는 사원
select last_name, job_id, salary from employees
where salary > 20080;

-- c) 두개의 질의문을 합침
select last_name, job_id, salary from employees
where salary >(
select max_salary from jobs
where job_id ='SA_MAN'
    );




-- 직업 ID 가 SA_MAN 인 사원들의
-- 최대 연봉보다 높게 받는 사원들의
-- LAST_NAME, JOB_ID 및 연봉을 조회한다.
select  max(salary) from employees where job_id='SA_MAN';



-- 수업ver
-- a) SA_MAN 인 사원들의 최대 연봉
select max(salary) from employees
where job_id ='SA_MAN';

-- b) SA_MAN인 사원들의 최대 연봉보다 많이 받는 사원들
select last_name,job_id,salary from employees
where salary >14000;

select last_name,job_id,salary from employees
where salary > (
    select max(salary) from employees
    where job_id='SA_MAN'
    );



-- 직업ID가 SA_MAN인 모든 사원들의
-- 연봉보다 높게 받는 사원들의
-- LAST_NAME, JOB_ID 및 연봉을 조회한다.
select salary from employees where job_id='SA_MAN';

select salary from employees where salary>10500;

select last_name,job_id,salary from employees where salary > all(
    select salary from employees where job_id='SA_MAN'
);

select last_name, job_id, salary AS '연봉'
from employees
where salary > all(select salary from employees where job_id = 'SA_MAN');


-- 수업 ver
-- a) SA_MAN인 모든 사원들의 연봉
select salary from employees
where job_id='SA_MAN'; -- 10500,~ 14000

-- b) SA_MAN인 모든 사원들의 연봉보다 많이 받는 사원
select last_name,job_id,salary
from employees
where salary > all(10500,14000); -- 문법적으로 안맞다고 나옴

-- c) 두개의 질의문을 하나로 합침
select last_name,job_id,salary from employees
where salary > all(
    select salary from employees
    where job_id='SA_MAN'
);










-- 도시 이름이 T 로 시작하는 지역에
-- 근무하는 사원들의 사번, LAST_NAME 및
-- 부서 번호를 조회한다.
select employee_id,last_name,department_id from employees where department_id=(
    select department_id from departments where location_id in(
        select location_id from locations where city like 'T%'
    )
    );

-- 수업 ver

-- a) 도시 이름이 T로 시작하는 지역
select location_id from locations
where city like 'T%';
-- 1200 1800

-- b) T로 시작하는 지역에 근무하는 사원
select department_id from departments
where location_id in (1200,1800);

-- c) T로 시작하는 지역에 근무하는 사원
select employee_id, last_name, department_id
from employees where department_id=20;

-- d) 몽땅 다 합치면
select employee_id, last_name, department_id
from employees where department_id= (
    select department_id
    from departments
    where location_id in (
        select location_id
        from locations
        where city like 'T%')
);




