-- hr 데이터베이스의 테이블과 
-- oe 데이터베이스의 테이블을 생성하고
-- alter 명령으로 기본키와 외래키 제약 조건을 설정하세요

-- hr 데이터 베이스 테이블s

CREATE table REGIONS(
	region_id int ,
	region_name char(25)
);
-- REGIONS 기본키(PK) 설정
alter table REGIONS
add constraint pk_REGIONS
primary key (region_id);

-- ------------------------------------------------

CREATE table COUNTRIES(
	country_id 		char(2) ,
	country_name	varchar(25),	
	region_id		int
);
-- COUNTRIES 기본키(PK) 설정
alter table COUNTRIES
add constraint pk_COUNTRIES
primary key (country_id);

-- COUNTRIES 외래키(FK) 설정
alter table COUNTRIES 
add constraint fk_COUNTRIES_REGIONS
foreign key (region_id)
references REGIONS(region_id);


-- ------------------------------------------------
CREATE table LOCATIONS (
	location_id 		int,
	street_address		varchar(50),
	postal_code			varchar(10),
	city				varchar(20),
	state_province		varchar(25),
	country_id			char(2)
);
-- LOCATIONS 기본키(PK) 설정
alter table LOCATIONS
add constraint pk_LOCATIONS
primary key (location_id);

-- LOCATIONS 외래키(FK) 설정
alter table LOCATIONS 
add constraint fk_LOCATIONS_COUNTRIES
foreign key (country_id)
references COUNTRIES(country_id);

-- ------------------------------------------------

CREATE table DEPARTMENTS (
	department_id 		int,	
	department_name		varchar(30),
	manager_id			int,
	location_id			int
);
-- DEPARTMENTS 기본키(PK) 설정
alter table DEPARTMENTS
add constraint pk_DEPARTMENTS
primary key (department_id);

-- DEPARTMENTS 외래키(FK) 설정
alter table DEPARTMENTS 
add constraint fk_DEPARTMENTS_LOCATIONS
foreign key (location_id)
references LOCATIONS(location_id);


-- ------------------------------------------------


CREATE table JOBS (
	job_id			varchar(15),
	job_title		varchar(50),
	min_salary		int,
	max_salary		int
);
-- JOBS 기본키(PK) 설정
alter table JOBS
add constraint pk_JOBS
primary key (job_id);


-- ------------------------------------------------
CREATE table EMPLOYEES(
	employee_id			int,
	first_name			varchar(25),
	last_name			varchar(25),
	email				varchar(30),
	phone_number		varchar(15),
	hire_date			datetime,
	job_id				varchar(15),
	salary				int,
	commission_pct		decimal(5,2),
	manager_id			int,
	department_id		int
	);

-- EMPLOYEES 기본키(PK) 설정
alter table EMPLOYEES
add constraint pk_EMPLOYEES
primary key (employee_id);

-- EMPLOYEES 외래키(FK) 설정
alter table EMPLOYEES 
add constraint fk_EMPLOYEES_DEPARTMENTS
foreign key (department_id)
references DEPARTMENTS(department_id),
add constraint fk_EMPLOYEES_JOBS
foreign key (job_id)
references JOBS(job_id),
add constraint fk_EMPLOYEES_EMPLOYEES
foreign key(manager_id)
references EMPLOYEES(employee_id);


-- ------------------------------------------------
CREATE table JOB_HISTORY (
	employee_id			int,
	start_date			datetime,
	end_date			datetime,
	job_id 				varchar(15),
	department_id		int
	);

-- JOB_HISTORY 외래키(FK) 설정
alter table JOB_HISTORY 
add constraint fk_JOB_HISTORY_DEPARTMENTS
foreign key (department_id)
references DEPARTMENTS(department_id),
add constraint fk_JOB_HISTORY_JOBS
foreign key (job_id)
references JOBS(job_id),
add constraint fk_JOB_HISTORY_EMPLOYEES
foreign key(employee_id)
references EMPLOYEES(employee_id);




