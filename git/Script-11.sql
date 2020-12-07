-- hr 데이터베이스의 테이블과 
-- oe 데이터베이스의 테이블을 생성하고
-- alter 명령으로 기본키와 외래키 제약 조건을 설정하세요

-- hr 데이터 베이스 테이블s



-- REGIONS
CREATE table REGIONS(
	region_id int,
	region_name char(25)
);
-- REGIONS 기본키(PK) 설정
alter table REGIONS
add constraint pk_REGIONS
primary key (region_id);

-- ------------------------------------------------
-- COUNTRIES
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


-- LOCATIONS
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


-- DEPARTMENTS
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


-- JOBS
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



-- EMPLOYEES
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


-- JOB_HISTORY
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











-- 2020-12-03 기본키 제약조건 추가 (순서 상관없음)

-- hr jobs부터 시계방향으로 

alter table JOBS
add constraint pk_JOBS
primary key (job_id);

alter table JOB_HISTORY 
add constraint pk_jbh
primary key(employee_id, start_date);

alter table DEPARTMENTS 
add constraint pk_dept
primary key (department_id);

alter table LOCATIONS 
add constraint pk_loc
primary key (location_id);

alter table COUNTRIES 
add constraint pk_cty
primary key (country_id);

alter table REGIONS 
add constraint pk_rgn
primary key (region_id);

alter table EMPLOYEES 
add constraint pk_emp
primary key(employee_id);


-- 2020-12-03 외래키 제약조건 추가 (순서 중요!)
alter table COUNTRIES 
add constraint fk_cnty_rgn
foreign key (region_id)
references REGIONS(region_id);

alter table LOCATIONS 
add constraint fk_loc_cnty
foreign key (country_id)
references COUNTRIES(country_id);

alter table DEPARTMENTS 
add constraint fk_dept_loc
foreign key (location_id)
references LOCATIONS(location_id);

alter table EMPLOYEES 
add constraint fk_emp_dept
foreign key (department_id)
references DEPARTMENTS(department_id);

alter table EMPLOYEES 
add constraint fk_emp_emp
foreign key (manager_id)
references EMPLOYEES(employee_id);


alter table EMPLOYEES 
add constraint fk_emp_jb
foreign key (job_id)
references JOBS(job_id);

alter table JOB_HISTORY 
add constraint fk_jbh_dept
foreign key(department_id)
references DEPARTMENTS(department_id),
add constraint fk_jbh_emp
foreign key(employee_id)
references EMPLOYEES(employee_id),
-- 식별관계 (pk-pk)
add constraint fk_jbh_jb
foreign key (job_id)
references JOBS(job_id);



-- 2020-12-03 수업에서 OE 데이터베이스와 관련된 테이블 생성
-- 단, 데이터 형식은 char(1) 또는 varchar(1)로만 설정
create table product_information (
	product_id 			int,
	product_name 		char(1),
	product_description char(1),
	category_id 		char(1),
	weight_class 		char(1),
	warranty_period 	char(1),
	supplier_id 		char(1),
	product_status 		char(1),
	list_price 			char(1),
	min_price 			char(1),
	catalog_url 		char(1)
);

create table order_item (
	order_id 		int,
	line_item_id 	char(1),
	product_id 		char(1),
	unit_price 		char(1),
	quantity 		char(1)
	);

create table orders (
	order_id 		int,
	order_date 		char(1),
	order_mode 		char(1),
	customer_id		int,
	order_status 	char(1),
	order_total 	char(1),
	sales_rep_id 	int,
	promotion_id 	char(1)
	);

create table customers (
	customer_id		 	int,
	cust_first_name 	char(1),
	cust_last_name		char(1),
	cust_address 		char(1),
	phone_numbers 		char(1),
	nls_language 		char(1),
	nls_territory 		char(1),
	credit_limit 		char(1),
	cust_email			char(1),
	account_mgr_id 		int,
	cust_geo_location 	char(1),
	date_of_birth 		char(1),
	marital_status 		char(1),
	gender 				char(1),
	income_level 		char(1)
);

create table warehouses (
	warehouse_id 	int,
	warehouse_spec 	char(1),
	warehouse_name 	char(1),
	location_id 	int,
	wh_geo_location char(1)
);

create table inventories (
	product_id 			int,
	warehouse_id 		int,
	quantity_on_hand 	char(1)
);

create table prduct_description (
	product_id 	int,
	language_id char(1),
	translated_name char(1),
	translated_description char(1)
);


-- 2020-12-03 OE 데이터베이스 기본키 제약조건 추가 (순서 상관없음)
alter table product_information 
add constraint pk_product_id
primary key (product_id);

alter table orders 
add constraint pk_orders
primary key (order_id);

alter table customers 
add constraint pk_customers
primary key (customer_id);

alter table warehouses 
add constraint pk_warehouses
primary key (warehouse_id);

alter table order_item
add constraint pk_ord_items
primary key(order_id, line_item_id);

alter table prduct_description
add constraint pk_prddesc
primary key (product_id, language_id);

alter table inventories 
add constraint pk_inven
primary key (product_id,warehouse_id);


-- 2020-12-03 OR 데이터베이스 외래키 만들기(순서 중요!)

alter table customers 
add constraint fk_cust_emp
foreign key (account_mgr_id)
references EMPLOYEES(employee_id);

alter table orders
add constraint fk_ord_emp
foreign key(sales_rep_id)
references EMPLOYEES(employee_id);

alter table orders 
add constraint fk_ord_cust
foreign key(customer_id)
references customers(customer_id);

alter table order_item
add constraint fk_orditm_ord
foreign key(order_id)
references orders(order_id);

alter table order_item
add constraint fk_orditm_prdinf
foreign key(product_id)
references product_information(product_id);

alter table inventories 
add constraint fk_inv_prdinf
foreign key(product_id)
references product_information(product_id);

alter table inventories 
add constraint fk_inv_wh
foreign key(warehouse_id)
references warehouses(warehouse_id);

alter table prduct_description
add constraint fk_prddes_prdinf
foreign key(product_id)
references product_information(product_id);

alter table warehouses 
add constraint fk_wh_loc
foreign key (location_id)
references LOCATIONS(location_id);


-- 데이터 타입 변경 --
-- oe데이터베이스를 만들면서 전부 char(1)형으로 만들어서 
-- hr데이터베이스에서 참조받을 값들이 int형으로 되어있어 오류가나와 수정
alter table customers 
modify column account_mgr_id int;

alter table orders 
modify column sales_rep_id int;

alter table warehouses 
modify column location_id int;






