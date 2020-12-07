-- 1) ��� ������ �̸��� ������ ��ȸ�ϼ���
		select bookname,price 
		from books;
-- 1b) ��� ������ ����, �̸��� ��ȸ�ϼ���
		select price,bookname 
		from books;

-- 2) ��� ������ ��ȣ,�̸�, ���ǻ�,������ ��ȸ�ϼ���
		select bookid,bookname,publisher ,price
		from books;
	
		select * from books;
	
-- 2b) ��� ������ ������ ��ȸ�ϼ���
	select bookid,bookname,publisher ,price 
	from books;

-- 3) ��� ������ ���ǻ縦 ��ȸ�ϼ���
	select publisher
	from books;

-- 3b) ��� ������ ���ǻ縦 ��ȸ�ϼ��� (�ߺ�����)
	select distinct publisher
	from books;

-- 4) ���� �̸�, ��ȭ��ȣ�� ��ȸ�ϼ���
-- ��, ��°���� �ʵ���� '�̸�,��ȭ��ȣ'�� �ٲ� ���
	select name as �̸� , phone as ��ȣ 
	from bookMembers;

-- 5) ���� �̸��� �ּҸ� ��ȸ�ϼ���
	select name, address 
	from bookMembers;

-- 6) ������ 20000�̸��� ������ ��ȸ�ϼ���
	select bookid,bookname,price
	from books
	where price<20000;

-- 7) ������ 15000�̻� ~ 25000������ ������ ������ ��ȸ�ϼ���
	select bookname,price
	from books
	where price between 15000 and 25000;

-- 8) å�̸��� '�౸�� ����' �Ǵ� '�ǰ� ����'�� ������ ���ǻ縦 ��ȸ�ϼ���
	select bookname,publisher 
	from books
	where bookname = '�౸�� ����' or bookname = '�ǰ� ����';
	
	select bookname, publisher from books
	where bookname in ('�౸�� ����','�ǰ� ����');

-- 9) '�౸'�� �����ϴ� ���� �̸��� ��ȸ�ϼ���
	select bookname 
	from books
	where bookname like '�౸%';

-- 9b) '�౸'�� ������ ���� �̸��� ��ȸ�ϼ���
	select bookname
	from books 
	where bookname like '%�౸';

-- 9c) '�౸'�� �����ϴ� ���� �̸��� ��ȸ�ϼ���
	select bookname
	from books 
	where bookname like '%�౸%';

-- 9d) �����̸� �߿� '��'�� �����ϴ� å��?
	select bookname
	from books 
	where bookname like '%��%';

-- 10) '����'�� �����ϰ� ������ 30000�̻��� ���� �̸��� ��ȸ�ϼ���
    select bookname,price
	from books 
	where bookname like '%����%' and price>=30000;

-- 11) ���̸��� �����ټ����� �������� �����ϰ�
-- �̸��� ������ �ּҷ� �������� �����ؼ� ��ȸ�ϼ���
	select name, address 
	from bookMembers 
	order by name,address desc;

-- 11b) ������ ������ ������������, 
-- ������ ������ ���ǻ��̸����� �������� �����ؼ� ��ȸ�ϼ���
select price ,publisher 
from books
where price = price 
order by price desc,publisher asc;

select price, publisher from books
order by price desc, publisher desc;

-- 12) ���� �ֹ��� ������ ��, ���, �ְ�, 
-- ���� �Ǹž��� ��ȸ�ϼ���
select sum(saleprice) as ���ֹ��ݾ�,
 	    avg(saleprice) as ��ձݾ�,max(saleprice) �ְ�ݾ�
from bookOrders; 

-- 13b) ���ǻ纰 ������ �� ���� ��ȸ�ϼ���
 select DISTINCT publisher, count(bookid) 
 from books 
 group by publisher;

--  14) ���ǻ纰 ������ �� ������ 2���̻��� ���ǻ� ��ȸ�ϼ���
 select DISTINCT publisher, count(bookid) ��������
 from books 
 group by publisher
 having �������� >=2;

 -- 14b) ������ 8000�̻��� ������ ������ ����
 -- �ֹ� ������ �� ������ ���ϼ���
 select custid, count(bookid) 
 from bookOrders 
 where saleprice>=8000
 group by custid;

sel
-- 14b) ������ 8000�̻��� ������ ������ ����
 -- �ֹ� ������ �� ������ ���ϼ��� 
 -- ��, ���� 2���̻� �ֹ��� ���� ������� �Ѵ�
select custid,count(orderid) �ֹ��Ǽ�
 from bookOrders 
 where saleprice>=8000
 group by custid
 having �ֹ��Ǽ�>=2;

--  15) �ֹ��� ����ȣ,���̸��� �ֹ��ݾ�,�ּҸ� ��ȸ�ϼ���
-- �����̺�� �ֹ����̺��� �����ؾ� ��ȸ����
-- ��, �ܷ�Ű ���迡 �ִ� �÷��� ������� ����



--  15b) ������ ���� �ֹ��ݾ�,�ּ�,�ֹ����ڸ� ��ȸ�ϼ���
-- �����̺�� �ֹ����̺��� �����ؾ� ��ȸ����
-- ��, �ܷ�Ű ���迡 �ִ� �÷��� ������� ����



--  16) �ֹ��� �����̸�,�ֹ��ݾ�,�ֹ����ڸ� ��ȸ�ϼ���
 select orderid ,bookid ,saleprice ,orderdate 
 from bookOrders 

 

 -- 19) ������ 20000�� ������ �ֹ��� �� �̸� ��ȸ�ϼ���
-- �����̺�� �ֹ����̺��� �����ؾ� ��ȸ����
-- ��, �ܷ�Ű ���迡 �ִ� �÷��� ������� ����
 select custid 
from bookOrders 
where saleprice =20000;

--  20) �ֹ��� ���̸�, �����̸�, �ֹ����� ����ϼ���
-- ����/�����̺�� �ֹ����̺��� �����ؾ� ��ȸ����
-- ��, �ܷ�Ű ���迡 �ִ� �÷��� ������� ����
-- join�� ���� �˾ƺ���

 -- 21) ������ �������� ���� ���� �����Ͽ�
 --    ���̸��� �ֹ��� ������ �Ǹűݾ��� ��ȸ�ϼ���
-- ����/�����̺�� �ֹ����̺��� �����ؾ� ��ȸ����
-- ��, �ܷ�Ű ���迡 �ִ� �÷��� ������� ����
-- ������ Ư�� ���⿡ �ִ� ���̺��� �÷����� ��ȸ	
