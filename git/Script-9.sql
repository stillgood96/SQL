-- hr �����ͺ��̽��� ���̺�� 
-- oe �����ͺ��̽��� ���̺��� �����ϰ�
-- alter ������� �⺻Ű�� �ܷ�Ű ���� ������ �����ϼ���

-- hr ������ ���̽� ���̺�s

CREATE table REGIONS(
	region_id int ,
	region_name char(25)
);
-- REGIONS �⺻Ű(PK) ����
alter table REGIONS
add constraint pk_REGIONS
primary key (region_id);

-- ------------------------------------------------

CREATE table COUNTRIES(
	country_id 		char(2) ,
	country_name	varchar(25),	
	region_id		int
);
-- COUNTRIES �⺻Ű(PK) ����
alter table COUNTRIES
add constraint pk_COUNTRIES
primary key (country_id);

-- COUNTRIES �ܷ�Ű(FK) ����
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
-- LOCATIONS �⺻Ű(PK) ����
alter table LOCATIONS
add constraint pk_LOCATIONS
primary key (location_id);

-- LOCATIONS �ܷ�Ű(FK) ����
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
-- DEPARTMENTS �⺻Ű(PK) ����
alter table DEPARTMENTS
add constraint pk_DEPARTMENTS
primary key (department_id);

-- DEPARTMENTS �ܷ�Ű(FK) ����
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
-- JOBS �⺻Ű(PK) ����
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

-- EMPLOYEES �⺻Ű(PK) ����
alter table EMPLOYEES
add constraint pk_EMPLOYEES
primary key (employee_id);

-- EMPLOYEES �ܷ�Ű(FK) ����
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

-- JOB_HISTORY �ܷ�Ű(FK) ����
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




