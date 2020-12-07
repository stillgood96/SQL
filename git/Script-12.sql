-- 2020-12-03 ����
-- DML
-- ������ ���Թ� : insert
-- ����1 : insert into ���̺�� values (�÷���, ...)
-- ����2 : insert into ���̺��(����÷�, ...)
--                     values (����÷���,...)


create table member (
	userid			varchar(18),
	password		varchar(18),
	name			varchar(10),
	grade			varchar(10) default 'bronze',
	point 			int			 default 1000,
	regdate			timestamp	default current_timestamp
	);

-- member ���̺� ȸ������ �Է�
-- ȸ�� ���̵� abc123�̰� ��й�ȣ�� zyx987�̰�
-- �̸��� ȫ�浿, ����� 'rookie', �������� 50000,
-- �������� '2021-12-03 12:12:12'�� ȸ�������� ����

insert into member values
('abc123','zyx987','ȫ�浿','rooke',
50000,'2020-12-03 12:12:12');
-- ���̺� �� ���Խ� ���� ������ �÷��� ������ �����ؾ� �� 

insert into member values
('a787574','787574','�̼���','gold',200000,'2020-12-03-13:03:42');

select * from member;

-- ȸ�� ���̵� xyz456�̰� ��й�ȣ�� 123456�̰�
-- �̸��� '����'�� ȸ�������� ����

-- ������ ������ �Է��ϱ� ������ ���1
insert into member values ('xyz456','123456','����'
,null,null,null);
-- ������ �������� null���� ������ ���2�� ��������
-- ���̺� ������ ����Ʈ ���� �����س��ٸ� ����Ʈ ���� ����. 

-- ������ ������ �Է��ϱ� ������ ���2
insert into member (userid,password,name)
values ('xyz456','123456','����2');


-- ���̺� Ư�� �÷����� �� ���Խ�
-- values �տ� ����÷��� �����ؼ�
-- ���� ������ ��ġ���Ѿ���



-- �뷮�� �����͸� insert �ϱ� 
-- bulk insert 
insert into ���̺�� values 
(),(),(),(),(),(),(),();


-- ������ ��ȸ : select
-- 1. �⺻���� ���̺� �÷� ��ȸ 
-- select �÷���� from ���̺��;

-- 1) �����̺��� ���̵�, �̸�, ����� ��ȸ�ϼ���
select from customerTest;