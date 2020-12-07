-- �ǽ�) ppt �����ͺ��̽�SQLȰ�뿡 ���� ǥ ����� 
-- insert into �� ���̺� ���� �ְ� select�� ��ȸ�غ��� 


-- -----------------�����̺�------------------------

create table customerTest(
	csid		varchar(10),
	csname		varchar(10),
	age			int,
	grd			varchar(10),
	job			varchar(10),
	point		int
);
-- csutomerTest pk����
alter table customerTest
add constraint pk_cst
primary key (csid);


-- csutomerTest value(�� �ֱ�)
insert into customerTest values
('apple','����ȭ',20,'gold','�л�',1000),
('banana','�輱��',25,'vip','��ȣ��',2500),
('carrot','���',28,'gold','����',4500),
('orange','����',22,'silver','�л�',0),
('melon','������',35,'gold','ȸ���',5000),
('peach','������',null,'silver','�ǻ�',300),
('pear','ä����',31,'silver','ȸ���',500);

-- null ������ ������ default ���� �� �� �˾Ҵµ� �ȵ�
-- �̵��� �ٽ� ����

-- -----------------��ǰ���̺�------------------------
create table productTest(
	pdNum 		varchar(10) not null,
	pdName 		varchar(15) not null,
	qunatity 		int not null,
	price 		int not null,
	company 		varchar(12) not null
	);
-- csutomerTest pk����
alter table productTest 
add constraint pk_pdt
primary key (pdnum);


insert into productTest values
('p01','�׳ɸ���',5000,4500,'���ѽ�ǰ'),
('p02','�ſ��̸�',2500,5500,'�α�Ǫ��'),
('p03','��������',3600,2600,'�Ѻ�����'),
('p04','�������ݸ�',1250,2500,'�Ѻ�����'),
('p05','��ū���',2200,1200,'���ѽ�ǰ'),
('p06','����쵿',1000,1550,'�α�Ǫ��'),
('p07','���޺�Ŷ',1650,1500,'�Ѻ�����');


-- -----------------�ֹ����̺�------------------------
create table orderTest(
	ordNum		varchar(10),
	csid		varchar(15),
	pdNum		varchar(10) not null,
	quantity			int,
	adr		varchar(15),
	orderdate		date
);

-- �ֹ����̺� �⺻Ű pk ����
alter table orderTest
add constraint pk_ordt
primary key (csid,pdNum);

-- �ֹ����̺� �ܷ�Ű fk ����
alter table orderTest 
add constraint fk_ordt_cst
foreign key (csid)
references customerTest(csid),
add constraint fk_ordt_pdt
foreign key (pdNum)
references productTest(pdNum);


insert into orderTest values
('o01','apple','p03',10,'����� ������','2019-01-01');
insert into orderTest values
('o02','melon','p01',5,'��õ�� ��籸','2019-01-10'),
('o03','banana','p06',45,'��⵵ ��õ��','2019-01-11'),
('o04','carrot','p02',8,'�λ�� ������','2019-02-01'),
('o05','melon','p06',36,'��⵵ ���ν�','2019-02-20'),
('o06','banana','p01',19,'��û�ϵ� ������','2019-03-02'),
('o07','apple','p03',22,'����� ��������','2019-03-15'),
('o08','pear','p02',50,'������ ��õ��','2019-04-10'),
('o09','banana','p04',15,'���󳲵� ������','2019-04-11'),
('o10','carrot','p03',20,'��⵵ �Ⱦ��','2019-05-22');


-- -----------------Books ���̺�------------------------

create table books(
	bookid			int,
	bookname		varchar(20),
	publisher		varchar(15),
	price			int
);

-- booksid �⺻Ű(pk) ����
alter table books 
add constraint pk_bk
primary key(bookid,price);

insert into books values
(1,'�౸�� ����','�½�����',7000),
(2,'�౸�ƴ� ����','������',13000),
(3,'�౸�� ����','���ѹ̵��',22000),
(4,'���� ���̺�','���ѹ̵��',35000),
(5,'�ǰ� ����','�½�����',8000),
(6,'���� �ܰ躰���','�½�����',6000),
(7,'�߱��� �߾�','�̻�̵��',20000),
(8,'�߱��� ��Ź��','�̻�̵��',13000),
(9,'�ø��� �̾߱�','�ɼ���',7500),
(10,'Olympic Champions','Pearson',13000);

-- -----------------BookMembers ���̺�------------------------

create table bookMembers(
	custid		int,
	name		varchar(10),
	address		varchar(20),
	phone		varchar(20)
);

-- bookMembers �⺻Ű(PK) ����
alter table bookMembers 
add constraint pk_bms
primary key (custid);

insert into bookMembers values 
(1,'������','���� ��ü��Ÿ','000-5000-0001'),
(2,'�迬��','���ѹα� ����','000-6000-0001'),
(3,'��̶�','���ѹα� ������','000-7000-0001'),
(4,'�߽ż�','�̱� Ŭ������','000-8000-0001'),
(5,'�ڼ���','���ѹα� ����',null);

-- -----------------BookOrders ���̺�------------------------

create table bookOrders(
	orderid		int,
	custid		int,
	bookid		int,
	saleprice	int,
	orderdate	date
);

-- bookOrders �⺻Ű(pk) ����
alter table bookOrders 
add constraint pk_bko
primary key (orderid,custid,bookid,saleprice);

-- bookOrders �ܷ�Ű(fk) ����
alter table bookOrders 
add constraint fk_bko_cst
foreign key (custid)
references customerTest(custid),
add constraint fk_bko_bks
foreign key (bookid)
references books(bookid)

insert into bookOrders values
(1,1,1,6000,'2014-07-01'),
(2,1,3,21000,'2014-07-03'),
(3,2,5,8000,'2014-07-03'),
(4,3,6,6000,'2014-07-04'),
(5,4,7,20000,'2014-07-05'),
(6,1,2,12000,'2014-07-07'),
(7,4,8,13000,'2014-07-07'),
(8,3,10,12000,'2014-07-08'),
(9,2,10,7000,'2014-07-09'),
(10,3,8,13000,'2014-07-10');


-- ������ ��ȸ : select
-- 1. �⺻���� ���̺� �÷� ��ȸ 
-- select �÷���� from ���̺��;

-- 1) �����̺��� ���̵�, �̸�, ����� ��ȸ�ϼ���
select csid ,csname ,grd from customerTest;

-- 2) �����̺��� ��� �÷��� ��ȸ�ϼ��� 
select csid ,csname ,age ,grd ,job ,point 
from customerTest;
-- �ϳ��ϳ� ���� �������ϱ� * ����ؼ� ���� ����غ���
select * from customerTest;


-- 3) ��ǰ���̺��� ������ü�� ��ȸ�ϼ���
select company from productTest;


-- 3) ��ǰ���̺��� ������ü�� ��ȸ�ϼ���
--    ��, �� ��� ��ü�� �ִ��� �˾ƺ��ϴ�.
-- distinct : �ߺ��� �����Ͽ� �Ѱ��� ���� ��ȸ�ǵ��� ��
-- all : �ߺ��� ����ؼ� �����ϴ� ��� ���� ��ȸ�ϵ��� �� (�⺻)
select distinct company
from productTest;


-- 2. ���̺� �÷� ��ȸ�� ��ȸ��� �÷����� ����
-- select �÷��� as ���÷��� from ���̺��;

-- 4) ��ǰ���̺��� ��ǰ��� ������ ��ȸ�ϵ�
-- �÷����� �ѱ۷� �ٲ� ����ϼ���
select pdName as ��ǰ��, price as �ܰ�
from productTest;

-- as�� ���� �������� ������ ���⸦ �ϸ� ������������ ���⸦�Ϸ��� ' ',"" �� ���������
select pdName ��ǰ��, price '��ǰ �ܰ�'
from productTest;
select pdName ��ǰ��, price "��ǰ �ܰ�"
from productTest;
-- ����Ŭ������ ū����ǥ�� ms sql�� ��������ǥ�� mysql�� �Ѵ� 

-- 3. ������� �̿��� �˻� 
-- select ���� ��������ڸ� �̿��ؼ� ��ȸ�Ҽ��� ����
-- select ����� from ���̺��;  
-- ������� ����ϸ� ������� ����� �����÷��� ���� �߰����ȴ�. 

-- 5) ��ǰ���̺��� ��ǰ��� ������ ��ȸ�ϵ�
-- ���ݿ� 500���� ���� 2021�ܰ��� ��Ī�� ����  
-- ���ο� �÷��� �Բ� ����ϼ���
select pdName,price,price+500 as '2021 �ܰ�' from productTest; 

-- 6) ��� ȸ���� �������� 1000�� �߰����־�����
-- ����� �˾ƺ����� �Ѵ� ������ ���ǹ��� �ۼ��ϼ���  
-- ���ο� �÷��� �Բ� ����ϼ���
select	csid,csname,point,point+1000 as '1000�� �߰��� ������' from customerTest;


-- 4. ���ǽ�(where)�� �̿��� �˻�
-- ������ �����ϴ� �����͸��� �˻� 
-- where ��� ���� �̿��ϰ� 
-- �񱳿�����, �������� ������ ������ ���ǽ� �ʿ�
-- select �÷��� from ���̺�� where ���ǽ�; 

-- 7) ��ǰ���̺��� �Ѻ������� ������ ��ǰ�� 
-- ��ǰ��, ���, �ܰ��� ��ȸ�ϼ���

select pdName,qunatity,price  -- (�����ȸ)
from productTest;

select company,pdName,qunatity,price  -- (������ȸ)
from productTest where company = '�Ѻ�����';


-- 8) �ֹ����̺��� apple �̶�� ���� 15�� �̻� 
-- �ֹ��� ��ǰ, ����, �ֹ����ڸ� ��ȸ�ϼ���
select csid,pdNum,quantity ,orderdate 
from orderTest 
where csid = 'apple' and quantity>=15;

-- 8) �ֹ����̺��� apple �̶�� ����  �ֹ��߰ų� 15�� �̻� 
-- �ֹ��� ��ǰ, ����, �ֹ����ڸ� ��ȸ�ϼ���
select csid,pdNum,quantity,orderdate
from orderTest 
where csid = 'apple' or quantity >= 15;

-- 8) ��ǰ���̺��� �ܰ��� 2000���̻��̰�
-- 3000�� ������ ��ǰ�� ��ǰ��, �ܰ�, ������ü�� ��ȸ�ϼ���
SELECT pdNum ,pdName ,price,company 
from productTest
where price<3000 and price>=2000;

-- where a between x(min) and y(max)
SELECT pdNum ,pdName ,price,company 
from productTest
where price between 2000 and 3000;


-- 5. NULL �˻�
-- �ش� �÷��� ���� NULL ������ ��ȸ�Ҷ���
-- 'is NULL/is not null' �̶�� ������ ����ؾ���

-- 9) �� ���̺��� ���̰� �Էµ��� ���� ���� ã�� 
SELECT csid,csname,age
FROM customerTest 
where age is NULL;


-- 6. ���ڿ� �κ� �˻�
-- like Ű���带 �̿��ؼ� ���ڿ��� ������� 
-- �κ������� ��ġ�ϴ� �����͸� ��ȸ�� �� ����
-- % : 0�� �̻��� ���ڿ� ��ġ
-- _ : 1�� ���ڿ� ��ġ 
-- '���ڿ�%'
-- '%���ڿ�'
-- '%���ڿ�%'
-- '���ڿ�___'
-- '___���ڿ�'
-- '%����___'
-- '___����%' 

-- 10) �� ���̺��� ���� �达�� ���� �̸�,����, ���,
-- �������� ��ȸ�ϼ���
select csname,age,grd,point 
from customerTest 
where csname like '��%';

-- 11) �� ���̺��� �� ���̵� 5����
-- ���� ���̵�, �̸�, ����� ��ȸ�ϼ���
select csid,csname,grd 
from customerTest
where CHAR_LENGTH(csid)=5;
-- where csid like '_____';

-- 7. ��ȸ��� ���� 
-- order by ���� �̿��ϸ� ��ȸ����� 
-- Ư���÷����� �������� ����/������������ ���� �����ϴ�.
-- �������� (1,2,3,...) : asc (ascending)
-- �������� (9,8,7,...) : desc (descending)

-- 12) �� ���̺��� ���̸�, ���, ���̸� ��ȸ�ϵ�
-- ���̸� �������� ������������ ����
select csname,grd,age 
from customerTest 
order by age desc;

-- 13) �ֹ� ���̺��� ������ 10���̻� �ֹ��� ���� 
-- �ֹ���, �ֹ���ǰ, ����, �ֹ����ڸ� �����ϼ���
-- ������ǰ�� ��� ������ �������� �������� �����ϼ���
select csid,pdNum ,quantity ,orderdate 
from orderTest 
where quantity>=10 
order by pdNum asc,quantity desc;

-- 8. ���� ��ȸ 
-- Ư���÷��� �������� ����� ����� ��ȸ�Ҷ� ���
-- �����(����) �Լ� : ����,�հ�,���,�ִ�/�ּ�
-- �����Լ��� null ���� �����ϰ� �����
-- �����Լ��� select �Ǵ� having ���� ��밡��

-- 14) ��ǰ���̺��� ��� ��ǰ�� ��մܰ��� ��ȸ�ϼ���
select avg(price) '��մܰ�' 
from productTest;

select round(avg(price),2) '��մܰ�' 
from productTest; -- �ݿø��ؼ� �Ҽ��� ���ϴ� �ڸ�����

select floor(avg(price)) '��մܰ�' 
from productTest; -- �����ǳ���


select ceil(avg(price)) '��մܰ�' 
from productTest; -- ������ �ø�

-- 15) �Ѻ��������� ������ ��ǰ�� ����� �հ踦 ��ȸ�ϼ���
select sum(qunatity) '����հ�'
from productTest
where company = '�Ѻ�����';

-- 16) �����̺� ����� ���� ���ԵǾ� �ִ��� ��ȸ�ϼ���
select count(csid) as ����ȸ���� -- null���� ������ x
from customerTest; 

-- 17) ��ǰ���̺��� ������ü���� ��ȸ�ϼ���
select  count(DISTINCT company) as ������ü�� 
from productTest 

-- 9. �׷캰 ��ȸ 
-- group by ���� �̿��ϸ� Ư�� �÷��� ���� 
-- ������ �����͵��� ��� �׷��� ����� ��ȸ�� �� ����
-- ��, �׷��� ���� ���¿��� ���� �˻��� �Ϸ���
-- having ���� ����ؾ� �� 

-- 18) �ֹ����̺��� �ֹ���ǰ�� ������ �հ踦 ��ȸ�ϼ���
select pdNum, count(ordNum) �ֹ��Ѽ��� 
from orderTest
group by pdNum;

-- 19) ��ǰ���̺��� ������ü���� ������ ��ǰ�� ������ 
-- ��ǰ�� ���� ��� �ܰ��� ��ȸ�ϼ���
-- ��, ��ǰ�� ������ '��ǰ��'�� 
-- ��� �ܰ��� '�ְ�'��� ��Ī�� ����ؼ� ����ϼ���
-- ��, �ְ��� �������� �������� �����ϼ���
select company ,count(pdName) as ��ǰ��, max(price) as �ְ�
from productTest 
group by company
order by �ְ� DESC;

-- 20) ��ǰ���̺��� ��ǰ�� 3���̻� ������ ������ü����
-- ��ǰ�� ������ ���� ��� �ܰ��� ��ȸ�ϼ��� 
select company,count(pdNum) ������ǰ��, max(price)
from productTest 
group by company
having ������ǰ��>=3; -- group by�� ���� ������ ������ �Ŵ°��� having

-- 21) �� ���̺��� ������ ����� 1000�̻��� ��޿� ���� 
-- ��޺� ������ ������ ����� ��ȸ�ϼ���
select grd, point �������Ʈ,count(csid)
from customerTest
group by grd,avg(point)
having avg(�������Ʈ) >=1000;

select point,grd
from customerTest
where point>=1000;

-- ����
select grd,count(csid), round(avg(point),2) ���������
from customerTest
group by grd
having ��������� >=1000;

-- 22) �ֹ� ���̺��� �� �ֹ����� �ֹ��� ��ǰ�� 
-- ���ֹ������� �ֹ���ǰ���� ��ȸ�ϼ��� 

-- ����������
select csid,pdNum �ֹ���ǰ,sum(quantity) ���ֹ�����
from orderTest 
group by csid,pdNum
order by csid asc,�ֹ���ǰ asc;

-- �����Թ���
select csid,pdNum ,sum(quantity) �ֹ�����
from orderTest
group by csid,pdNum;
-- �Ȱ���