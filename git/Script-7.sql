create table abc(
	a int primary key
);

-- ���̺� ���� ����
describe abc; 
desc abc;

-- x ��� �÷��߰�(����(10))
-- alter table ���̺�� add �÷�����;
alter table abc 
add x varchar(10);

-- ���� �÷� ���� , x�� �������� 
-- alter table ���̺�� drop �÷���;
alter table abc
drop x;

-- ���� �÷� ������ �ϰ� �ʹپƾƤ��Ƥ���
-- alter table ���̺�� modify column �÷����� 


-- ���������͸� �����ϱ� ���� ���̺� ����
-- �⺻ : �̸�,����,����,���� �÷� (��� ���ڷ� ����)
-- �߰� : ����,���,���� (��� ���ڷ� ����)

create table sungjuk (
	name 		varchar(10),
	kor			varchar(10),
	eng			varchar(10),
	math		varchar(10)
);

alter table sungjuk
add sum int,
add avg int,
add grd char(2);

alter table sungjuk
modify column name varchar(10) primary key;

alter table sungjuk modify column kor int;
alter table sungjuk modify column eng int;
alter table sungjuk modify column math int;
alter table sungjuk modify column avg decimal(5,2); -- ������ 3�ڸ� �Ҽ��ڸ�2�ڸ�

-- ���̺����
-- drop table ���̺��;
drop table abc;
drop table sungjuk;

desc sungjuk;

-- ���̺� �̸� ����
-- alter table ���̺��
-- rename ���̸�
alter table EMPLOYEES 
rename emp;
-- �ܷ���Ű �����Ǿ��ִ��͵� �ڵ����� ����


-- �������� �߰��ϱ� 
-- ���̺� ������ ���������� �÷����� �Ǵ� �� ������ ��������


-- �����ͺ��̽��� ������ �������� Ȯ��
select * from information_schema.table_constraints;

-- �⺻Ű(primary key) �������� ����
-- alter table ���̺�� add constraint �������Ǹ� primary key(�÷���);
-- �������Ǹ� : pk_���̺�� 

create table employees (
	employee_id 	int,
	first_name		varchar(25),
	last_name 		varchar(25)
);

alter table employees
add constraint pk_emp  -- �̸��� ���� �������� ���߿� ã�� ���ϰ� �Ϸ��� �ᵵ�׸��Ƚᵵ �׸� ������ ����Ŭ���� �����
primary key (employee_id);


-- �⺻Ű �������� ����
-- alter table ���̺��
-- drop primary key		ex) mysql/mariadb

-- �ٸ� �����ͺ��̽��� drop�κ���
-- drop constraint �������Ǹ�; �̷��� �ؾ��� ex)����Ŭ
alter table employees 
drop primary key;

-- �ܷ�Ű �������� �߰�/����
-- alter table ���̺�� 
-- add constraint �������Ǹ�
-- �������Ǹ� : fk_�ܷ�Ű�������̺�_�⺻Ű���ִ����̺�
-- foreign key (�÷���)
-- references ���̺��(�÷���);

-- alter table ���̺��
-- drop constraint �������Ǹ�; 

create table emp2 (
	empid int ,
	fname varchar(25),
	lname varchar(25),
	deptid int
);

create table dept (
	deptid int ,
	dname varchar(30),
	mgrid int
);

alter table emp2
add constraint pk_emp2
primary key (empid);

alter table dept
add constraint pk_dept
primary key (deptid);


select * from information_schema.table_constraints;

alter table emp2 
add constraint fk_emp_dept
foreign key (deptid)
references dept(deptid);


-- not null ���� ���� �߰�
-- �÷��� null(��)�� �Է¸��ϰ� �����ϴ� ���� ����
-- �÷����� : �÷���  �÷����� not null

create table emp3 (
	empid 	int ,
	fname 	varchar(25) not null,
	lname 	varchar(25) not null,
	job_id 	varchar(10),
	comm 	decimal(5,2)
);


-- �ʱⰪ �������� �߰�
-- �÷��� �� �Է� ������ �ڵ����� ���� �����ϰ� ���ִ� ����
-- �÷����� : �÷��� �÷����� default �⺻�� 

create table member (
	userid			varchar(18),
	password		varchar(18),
	name			varchar(10),
	grade			varchar(10) default 'bronze',
	point 			int			 default 1000,
	regdate			timestamp	default current_timestamp
	);








