-- hr 데이터베이스의 테이블과 
-- oe 데이터베이스의 테이블을 생성하고
-- alter 명령으로 기본키와 외래키 제약 조건을 설정하세요

-- OR 데이터 베이스 테이블s

CREATE table OR_ORDERS (
	order_id  		int,
	order_date 		datetime,
	order_mode 		varchar(255),
	customer_id		int,
	order_status 	int,
	order_total 	decimal(5,2),
	sales_rep_id	integer,
	promotion_id	char(2)
);

CREATE table OR_CUSTOMERS (
	customer_id			int,
	cust_first_name		varchar(255),
	cust_last_name		varchar(255),
	cust_address		varchar(255),
	phone_numbers		varchar(255),
	nls_language		varchar(255),
	credit_limit		varchar(255),
	cust_email			varchar(255),
	account_mgr_id		int,
	cust-geo_location	varchar(255),
	date_of_birth		date,
	marital_status		varchar(255),
	gender				varchar(255),
	income_level		varchar(255)
);

CREATE table OR_WAREHOUSES (
	warehous_id			int,
	warehouse_spec		char(1),
	warehouse_name		char(1),
	location_id			int,
	wh_geo_location		char(1)
);

CREATE table OR_PRODUCT_INFORMATION (
	product_id				int,
	product_name			varchar(255),
	product_description		varchar(255),
	category_id				int,
	weight_class			int,
	warranty_period			varchar(255),
	supplier_id				int,
	product_status			varchar(255),
	list_price				int,
	min_price				int,
	catalog_url				varchar(255),
);

CREATE table OR_ORDER_ITEMS (
	order_id			int,
	line_item_id		int,
	product_id			int,
	unit_price			decimal(5,2),
	quantity			int
);

CREATE table OR_PRODUCT_DESCRIPTIONS (
	product_id				int,
	language_id				varchar(255),
	translated_name			varchar(255),
	translated_description	varchar(255),
);

CREATE table OR_INVENTORIES (
	product_id			int,
	warehouse_id		int,
	quantity_on_hand	int
);