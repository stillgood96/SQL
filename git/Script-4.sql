-- 테이블 생성
CREATE table shoping (
	ordno		int,
	orddate 	datetime,
	prodname 	char(5),
	saleprice   int
);

-- 고객테이블
CREATE table customers (
	csID 	varchar(16) primary key,
	csName 	varchar(10),
	csAge   int,
	csRank  varchar(10),
	csJob   varchar(10),
	csPoint int
);

-- 제품테이블
CREATE table products (
	pdNum		varchar(5) 		primary key,
	pdName  	varchar(10),
	pdSum   	int,
	pdPrice 	int,
	pdCompany   varchar(10)
);


-- 주문 테이블
CREATE table orders ( 
	ordNum		varchar(5) primary key,
	csID 		varchar(16), -- 고객 테이블 pk
	pdNum		varchar(5),  -- 상품 테이블 pk
	ordqty		int,
	ordAddress	varchar(10),
	ordDate		datetime
);


-- 외래키 설정
-- foreign (key 컬럼명)
-- references 테이블명(컬럼명);

-- 주문 - 고객 테이블간 관계설정
-- 주문 - 상품 테이블간 관계설정

CREATE table orders2 ( -- 주문 / 고객 외래키 설정 
	ordNum		varchar(5) primary key,
	csID 		varchar(16), -- 고객 테이블 pk
	pdNum		varchar(5),  -- 상품 테이블 pk
	ordqty		int,
	ordAddress	varchar(10),
	ordDate		datetime,
	foreign key (csID)
	references customers (csID)
);

CREATE table orders3 ( -- 주문 / 상품 외래키 설정
	ordNum		varchar(5) primary key,
	csID 		varchar(16), -- 고객 테이블 pk
	pdNum		varchar(5),  -- 상품 테이블 pk
	ordqty		int,
	ordAddress	varchar(10),
	ordDate		datetime,
	foreign key (pdNum)
	references products (pdNum)
);
CREATE table orders4 ( -- 주문 / 상품,고객 외래키 설정
	ordNum		varchar(5) primary key,
	csID 		varchar(16), -- 고객 테이블 pk
	pdNum		varchar(5),  -- 상품 테이블 pk
	ordqty		int,
	ordAddress	varchar(10),
	ordDate		datetime,
	foreign key (csID)
	references customers (csID),
	foreign key (pdNum)
	references products (pdNum)
);


-- 단 외래키를 설정할 때에는
-- 테이블 생성순서에 주의해야 함!
-- 고객, 상품 -> 주문 순서로 만들어야함
-- 외래키를 넣을 테이블을 가장 늦게 만들어야 한다는 말


