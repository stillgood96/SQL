CREATE table REGIONS(
	region_id int primary key,
	region_name char(25)
);

CREATE table COUNTRIES(
	country_id 		char(2) primary key,
	country_name	char(25),	
	region_id		int,
	foreign key (region_id)
	references REGIONS(region_id)
);

CREATE table LOCATIONS (
	location_id 		int primary key,
	street_address		char(30),
	postal_code			char(50),
	city				char(30),
	state_province		char(30),
	country_id			char(2),
	foreign key (country_id)
	references COUNTRIES(country_id)
);

CREATE table DEPARTMENTS (
	department_id 		int primary key,	
	department_name		char(20),
	manager_id			int,
	location_id			int,
	foreign key (location_id)
	references LOCATIONS(location_id)
);

CREATE table JOBS (
	job_id			char(10) primary key,
	job_title		char(35),
	min_salary		int,
	max_salary		int
);

CREATE table JOB_HISTORY (
	employee_id			int,
	start_date			datetime,
	end_date			datetime,
	job_id 				char(10),
	department_id		int,
	foreign key (department_id)
	references DEPARTMENTS(department_id),
	foreign key (employee_id)
	references EMPLOYEES(employee_id),
	foreign key (job_id)
	references JOBS(job_id)
	);



CREATE table EMPLOYEES(
	employee_id			int primary key,
	first_name			char(12),
	last_name			char(15),
	email				char(15),
	phone_number		char(20),
	hire_date			datetime,
	job_id				char(10),
	salary				int,
	commission_pct		int,
	manager_id			int,
	department_id		int,
	foreign key (job_id)
	references JOBS(job_id),
	foreign key (department_id)
	references DEPARTMENTS(department_id)
	);



