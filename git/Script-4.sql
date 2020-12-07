-- ���̺� ����
CREATE table shoping (
	ordno		int,
	orddate 	datetime,
	prodname 	char(5),
	saleprice   int
);

-- �����̺�
CREATE table customers (
	csID 	varchar(16) primary key,
	csName 	varchar(10),
	csAge   int,
	csRank  varchar(10),
	csJob   varchar(10),
	csPoint int
);

-- ��ǰ���̺�
CREATE table products (
	pdNum		varchar(5) 		primary key,
	pdName  	varchar(10),
	pdSum   	int,
	pdPrice 	int,
	pdCompany   varchar(10)
);


-- �ֹ� ���̺�
CREATE table orders ( 
	ordNum		varchar(5) primary key,
	csID 		varchar(16), -- �� ���̺� pk
	pdNum		varchar(5),  -- ��ǰ ���̺� pk
	ordqty		int,
	ordAddress	varchar(10),
	ordDate		datetime
);


-- �ܷ�Ű ����
-- foreign (key �÷���)
-- references ���̺��(�÷���);

-- �ֹ� - �� ���̺� ���輳��
-- �ֹ� - ��ǰ ���̺� ���輳��

CREATE table orders2 ( -- �ֹ� / �� �ܷ�Ű ���� 
	ordNum		varchar(5) primary key,
	csID 		varchar(16), -- �� ���̺� pk
	pdNum		varchar(5),  -- ��ǰ ���̺� pk
	ordqty		int,
	ordAddress	varchar(10),
	ordDate		datetime,
	foreign key (csID)
	references customers (csID)
);

CREATE table orders3 ( -- �ֹ� / ��ǰ �ܷ�Ű ����
	ordNum		varchar(5) primary key,
	csID 		varchar(16), -- �� ���̺� pk
	pdNum		varchar(5),  -- ��ǰ ���̺� pk
	ordqty		int,
	ordAddress	varchar(10),
	ordDate		datetime,
	foreign key (pdNum)
	references products (pdNum)
);
CREATE table orders4 ( -- �ֹ� / ��ǰ,�� �ܷ�Ű ����
	ordNum		varchar(5) primary key,
	csID 		varchar(16), -- �� ���̺� pk
	pdNum		varchar(5),  -- ��ǰ ���̺� pk
	ordqty		int,
	ordAddress	varchar(10),
	ordDate		datetime,
	foreign key (csID)
	references customers (csID),
	foreign key (pdNum)
	references products (pdNum)
);


-- �� �ܷ�Ű�� ������ ������
-- ���̺� ���������� �����ؾ� ��!
-- ��, ��ǰ -> �ֹ� ������ ��������
-- �ܷ�Ű�� ���� ���̺��� ���� �ʰ� ������ �Ѵٴ� ��


