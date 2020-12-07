-- 1) ��� ������ �̸��� ������ ��ȸ�ϼ���
		select bookname,price 
		from books;
-- 1b) ��� ������ ����, �̸��� ��ȸ�ϼ���
		select price,bookname 
		from books;

-- 2) ��� ������ ��ȣ,�̸�, ���ǻ�,������ ��ȸ�ϼ���
		select bookid,bookname,publisher ,price
		from books;
-- 2b) ��� ������ ������ ��ȸ�ϼ���
	select bookid,bookname,publisher ,price 
	from books;

-- 3) ��� ������ ���ǻ縦 ��ȸ�ϼ���
	select publisher
	from books;

-- 3b) ��� ������ ���ǻ縦 ��ȸ�ϼ��� (�ߺ�����)
	select distinct publisher
	from books;

-- 4) ���� �̸�, ��ȣ�� ��ȸ�ϼ���
-- ��, ��°���� �ʵ���� '�̸�,��ȣ'�� �ٲ� ���
	select name as �̸� , phone as ��ȣ 
	from bookMembers;

-- 5) ���� �̸��� �ڵ�����ȣ�� ��ȸ�ϼ���
	select name, phone 
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

-- 9) '�౸'�� �����ϴ� ���� �̸��� ��ȸ�ϼ���
	select bookname 
	from books
	where bookname is '�౸';
-- 9b) '�౸'�� ������ ���� �̸��� ��ȸ�ϼ���


-- 9c) '�౸'�� �����ϴ� ���� �̸��� ��ȸ�ϼ���


-- 9d) �����̸� �߿� '��'�� �����ϴ� å��?


-- 10) '����'�� �����ϰ� ������ 30000�̻��� ���� �̸��� ��ȸ�ϼ���
     

-- 11) ���̸��� �����ټ����� �������� �����ϰ�
-- �̸��� ������ �ּҷ� �������� �����ؼ� ��ȸ�ϼ���