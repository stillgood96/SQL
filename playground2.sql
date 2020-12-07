-- HR 데이터베이스와 관련된 csv파일을 참고해서
-- 테이블을 각각 생성하고
-- 다양한 제약조건을 설정하세요 

-- regions
CREATE TABLE regions (
    region_id    int,
    region_name  varchar(30)
);

-- countries
create table countries (
   country_id    char(2),
   country_name  varchar(30),
   region_id     int
);

-- locations
create table locations (
    location_id     int,
    street_address  varchar(50),
    postal_code     varchar(10),
    city            varchar(20),
    state_province  varchar(25),
    country_id      char(2)
);

-- departments
create table departments (
   department_id	int,
   department_name  varchar(30),
   manger_id        int,
   location_id      int
);

-- jobs
create table jobs (
   job_id     varchar(15),
   job_title  varchar(50),
   min_salary int,
   max_salary int
);

-- employees
create table employees (
   employee_id  int,
   first_name   varchar(25),
   last_name	varchar(25),
   email        varchar(30),
   phone_number varchar(15),
   hire_date    datetime,
   job_id       varchar(15),
   salary        int,
   commission_pct    decimal(5,2),
   manager_id    int,
   department_id int
);

-- job_history
create table job_history (
   employee_id   int,
   start_date    datetime,
   end_date      datetime,
   job_id		 varchar(15),
   department_id int
);


-- 기본키 제약조건 추가 (순서 상관없음)
alter table jobs
add constraint pk_jb
primary key (job_id);

alter table job_history
add constraint pk_jbh
primary key (employee_id, start_date);

alter table departments 
add constraint pk_dept
primary key (department_id);

alter table locations 
add constraint pk_loc
primary key (location_id);

alter table countries 
add constraint pk_ctry
primary key (country_id);

alter table regions 
add constraint pk_rgn
primary key (region_id);

alter table employees 
add constraint pk_emp
primary key (employee_id);


-- 외래키 제약조건 추가 (순서 중요!)
alter table countries 
add constraint fk_cnty_rgn
foreign key (region_id)
references regions (region_id);

alter table locations 
add constraint fk_loc_cnty
foreign key (country_id)
references countries (country_id);

alter table departments 
add constraint fk_dept_loc
foreign key (location_id)
references locations (location_id); 

alter table employees
add constraint fk_emp_dept
foreign key (department_id)
references departments (department_id);

alter table employees
add constraint fk_emp_emp
foreign key (manager_id)
references employees (employee_id);

alter table employees 
add constraint fk_emp_jb
foreign key (job_id)
references jobs (job_id);

alter table job_history 
add constraint fk_jbh_dept
foreign key (department_id)
references departments (department_id);

alter table job_history 
add constraint fk_jbh_jb
foreign key (job_id)
references jobs (job_id);

alter table job_history 
add constraint fk_jbh_emp
foreign key (employee_id)
references employees (employee_id);
-- 식별관계 (pk - pk)


-- OE 데이터베이스와 관련된 테이블을 각각 생성하고
-- 다양한 제약조건을 설정하세요
-- 단, 데이터 형식은 char(1) 또는 varchar(1) 로만 설정

create table product_information (
	product_id  int,
	product_name char(1),
	product_description char(1),
	category_id char(1),
	weight_class char(1),
	warranty_period char(1),
	supplier_id char(1),
	product_status char(1),
	list_price char(1),
	min_price char(1),
	catalog_url char(1)
);

create table order_items (
   order_id int,
   line_item_id char(1),
   prodcut_id int,
   unit_price char(1),
   quantity char(1)
);

create table orders (
	order_id int,
	order_date char(1),
	order_mode char(1),
	customer_id char(1),
	order_status char(1),
	order_total char(1),
	sales_rep_id int,
	promotion_id char(1)
);

create table customers (
    customer_id int,
    cust_first_name char(1),
    cust_last_name char(1),
    cust_address char(1),
    phone_numbers char(1),
    nls_language char(1),
    nls_territory char(1),
    credit_limt char(1),
    cust_email char(1),
    account_mgr_id int,
    cust_geo_location char(1),
    date_of_birth char(1),
    marital_status char(1),
    gender char(1),
    income_lebel char(1)
);

create table warehouses (
   warehouse_id int,
   warehouse_spec char(1),
   warehouse_name char(1),
   location_id int,
   wh_geo_location char(1)
);

create table inventories (
    product_id int,
    warehouse_id int,
    quantity_on_hand char(1)
);

create table product_description (
    product_id int,
    language_id char(1),
    translated_name char(1),
    translated_description char(1)
);

-- 기본키 제약조건 추가 (순서 상관없음)
alter table warehouses
add constraint pk_wh
primary key (warehouse_id);

alter table customers 
add constraint pk_cstid
primary key (customer_id);

alter table orders 
add constraint pk_ordid
primary key (order_id);

alter table order_items
add constraint pk_orditm
primary key (order_id, line_item_id);

alter table product_information 
add constraint pk_prdinf
primary key (product_id);

alter table product_description 
add constraint pk_prddesc
primary key (product_id, language_id);

alter table inventories 
add constraint pk_inven
primary key (product_id, warehouse_id);

alter table inventories 
add constraint pk_inven
primary key (product_id, warehouse_id);

-- 외래키 제약조건 추가 (순서 중요!)
alter table customers 
add constraint fk_cust_emp
foreign key (account_mgr_id)
references employees (employee_id);

alter table orders 
add constraint fk_ord_emp
foreign key (sales_rep_id)
references employees (employee_id);

alter table orders
add constraint fk_ord_cust
foreign key (customer_id)
references customers (customer_id);

alter table order_items
add constraint fk_orditm_ord
foreign key (order_id)
references orders (order_id);

alter table order_items
add constraint fk_orditm_prdinf
foreign key (product_id)
references product_information (product_id);

alter table inventories 
add constraint fk_inv_prdinf
foreign key (product_id)
references product_information (product_id);

alter table inventories 
add constraint fk_inv_wh
foreign key (warehouse_id)
references warehouses (warehouse_id);

alter table product_descriptions 
add constraint fk_prddes_prdinf
foreign key (product_id)
references product_information (product_id);

alter table warehouses 
add constraint fk_wh_loc
foreign key (location_id)
references locations (location_id);

-- 타입 불일치로 인한 외래키 설정 불가시
-- 데이터 타입 변경하기
alter table customers
modify column account_mgr_id int;

alter table orders
modify column sales_rep_id int;

alter table warehouses 
modify column location_id int;



