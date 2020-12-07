-- 계정은 playground이며 
-- 비밀번호는 playground2020인 
-- 데이터베이스 사용자 계정을 생성
create database playground;

create user 'playground'@'%'
identified by 'playground2020';

grant SELECT, INSERT, UPDATE, DELETE, 
CREATE, DROP, REFERENCES, INDEX, ALTER, 
CREATE TEMPORARY TABLES, 
LOCK TABLES, EXECUTE, CREATE VIEW, 
SHOW VIEW, CREATE ROUTINE, 
ALTER ROUTINE, TRIGGER 
on playground.*
to 'playground'@'%';

flush privileges;

-- HR 데이터베이스와 관련된 csv파일을 참고해서
-- 기본키,외래키 설정을 이용해서
-- 테이블을 각각 생성하세요

-- regions
CREATE TABLE regions (
    region_id    int    PRIMARY KEY,
    region_name  varchar(30)
);

-- countries
create table countries (
   country_id    char(2)    primary key,
   country_name  varchar(30),
   region_id     int,
   foreign key (region_id)
   references regions (region_id)
);

-- locations
create table locations (
    location_id     int    primary key,
    street_address  varchar(50),
    postal_code     varchar(10),
    city            varchar(20),
    state_province  varchar(25),
    country_id      char(2),
    foreign key (country_id)
    references countries (country_id)
);

-- departments
create table departments (
   department_id	int   primary key,
   department_name  varchar(30),
   manger_id        int,
   location_id      int,
   foreign key (location_id)
   references locations (location_id)
);

-- jobs
create table jobs (
   job_id     varchar(15)   primary key,
   job_title  varchar(50),
   min_salary int,
   max_salary int
);

-- employees
create table employees (
   employee_id  int          primary key,
   first_name   varchar(25),
   last_name	varchar(25),
   email        varchar(30),
   phone_number varchar(15),
   hire_date    datetime,
   job_id       varchar(15),
   salary        int,
   commission_pct    decimal(5,2),
   manager_id    int,
   department_id int,   
   foreign key (manager_id)
   references employees (employee_id),
   foreign key (job_id)
   references jobs (job_id),
   foreign key (department_id)
   references departments (department_id)
);

-- job_history
create table job_history (
   employee_id   int,
   start_date    datetime,
   end_date      datetime,
   job_id		 varchar(15),
   department_id int,
   foreign key (department_id)
   references departments (department_id),
   foreign key (job_id)
   references jobs (job_id),
   foreign key (employee_id)
   references employees (employee_id)
);








