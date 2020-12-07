-- classicmodels �����ͺ��̽� SQL ����

-- 1. ����employees�� ��� ������ ��ȸ�ϼ���
SELECT *
from employees;

-- 1.2 ��customers�� ��� ������ ��ȸ�ϼ���
select *
from customers;
-- 1.3 ��ǰproducts�� ��� ������ ��ȸ�ϼ���
SELECT *
from products;

-- 2. ������ ���� �̸�, ��å�� ��ȸ�ϼ���
SELECT lastName ,firstName ,jobTitle 
FROM employees 

-- 3. ������ ���� ��ȸ�ϼ���. ��, �ߺ� ����
select DISTINCT lastName 
from employees ;

-- 4. �� ���̺��� null�� �ƴ� �ֿ� ���ø� ��ȸ�ϼ���. ��, �ߺ� ����
SELECT DISTINCT city,state 
from customers
where city is not null and state is not null;


-- 5. �� ���̺��� USA�� �ְ� 
-- �� ������ ��ȸ�ϼ���
SELECT count(state) 
from customers
where country ='USA';

-- ������ ȣ���� ���� ��� ����ΰ�?
SELECT count(customerNumber)
from customers
where country ='australia';


-- 6. �� �� �����ѵ��� ���� ������ 
-- 5���� ��ȸ�ϼ���
SELECT customerName,creditlimit 
from customers 
order by creditlimit desc limit 0,5;


-- �� �� �����ѵ��� ���� ������ 
-- 6��° ~ 10��° ���� ��ȸ�ϼ���
SELECT customerName,creditlimit 
from customers 
order by creditlimit desc limit 5,5;


-- 7. ��å�� Sales Rep�̰� 
-- ���ǽ��ڵ尡 1�� ������ ��ȸ�ϼ���
SELECT employeeNumber ,firstName ,jobTitle ,officeCode 
from employees
where jobTitle = 'Sales Rep' and officeCode =1;

-- 8. ��å�� Sales Rep�� �ƴϰ�, 
-- ���ǽ��ڵ尡 5�̻��� ������ ��ȸ�ϼ���
SELECT employeeNumber ,firstName ,jobTitle ,officeCode 
from employees
where jobTitle <> 'Sales Rep' and officeCode >=5;



-- 9. ���� ���� �̸��� ���ĺ� ������ ��ȸ�ϼ���  
SELECT customerName 
from customers 
order by customerName asc;

-- 10. �ֹ���orderdetails���� �ֹ���ȣ, �ֹ�����, ��������, �ֹ�����*������������ ��ȸ�ϼ���
SELECT orderNumber ,productCode ,quantityOrdered ,priceEach ,priceEach*quantityOrdered �Ѱ���
from orderdetails;


-- �ֹ��ݾ��� ū ������� ����Ѵٸ�?
SELECT orderNumber ,priceEach*quantityOrdered �Ѱ���
from orderdetails
order by �Ѱ��� desc;

-- 11. �� ���̺��� ������ USA, 
-- �ִ� CA, �����ѵ��� 100000 �̻��� 
-- ���� ���� �̸�, ����, ��, �����ѵ��� 
-- ��ȸ�ϼ���
SELECT contactLastName ,customerName ,country ,state ,creditLimit 
from customers
where country = 'USA' and state = 'CA' and creditLimit >= 10000
order by creditLimit desc;


 
-- 12. �� ���̺��� ������ USA �Ǵ� 
-- France �� ���� ���� �̸�, 
-- ������ ��ȸ�ϼ���
SELECT contactLastName ,customerName,country 
from customers
where country ='France';

-- 13. �ֹ� ���̺��� �ֹ� ��ȣ�� 10165,
-- 10287, 10310�� �ֹ��� �ֹ���ȣ ����ȣ,
-- ����, �������ڸ� ��ȸ�ϼ���
SELECT orderNumber ,customerNumber ,status ,shippedDate 
from orders 
where orderNumber =10287 or orderNumber = 10310;


-- 14. ��ǰ ���̺��� ���Ű����� 90�̻� 100������ ��ǰ�� ��ǰ�ڵ�, ��ǰ��, ������ ��ȸ�ϼ���
select 
from products p 



-- 15. �ֹ� ���̺��� �䱸���ڰ� 
-- 2003�� 1���� �ֹ��� �ֹ���ȣ�� 
-- �䱸����, ���¸� ��ȸ�ϼ���

   
-- 16. ������ ���̳� �̸��� a�� �����ϴ� 
-- ������ ���� �̸��� ��ȸ�ϼ���


-- 17. ������ ���̳� �̸��� on�� ������ ������ ���� �̸��� ��ȸ�ϼ���


 
-- 18. ������ �̸��� 3���̸�, 
--  T�� �����ϰ� m���� ������ ������ ���� �̸��� ��ȸ�ϼ���


-- 18.2 ������ �̸��� 5���̸�, j�� �����ϰ� e���� ������ ������ ���� �̸��� ��ȸ�ϼ���


-- 19. �� ���̺��� ���������ȣ�� 
-- ���� ���� �̸���, ����, 
-- ���������ȣ�� ��ȸ�ϼ���


-- 20. ��customer �̸��� �ֹ�orders �Ǽ��� ��ȸ�ϼ���
 

--  21. ��ǰ�ڵ�, ��ǰ�̸�, ��ǰ������ ��ȸ�ϼ���
 

--  22. �ֹ���ȣ�� �ֹ�����, �ֹ�����*���������� ��ȸ�ϼ���
 

--  23. ��ǰ�ڵ� S10_1678�� ���� �ֹ���ȣ�� 
 ��ǰ�̸�, ������msrp, ���������� ��ȸ�ϼ���
 

--  25. ��customer �� �ֹ���ȣ�� �ֹ����¸� ��ȸ�ϼ���.
--  ��, �ֹ���ȣ�� ���� ���� �����Ѵ�
  

--  26. ��customer �� �ֹ���ȣ�� �ֹ����°� 
--  ���� ���� ��ȸ�ϼ���
 

 -- 27. �ֹ��� �ֹ���ȣ�� ����ȣ, ��ǰ�ڵ带 ��ȸ�ϼ���
--  ��, ��ǰ�ڵ尡 ���� �ֹ��� �����Ѵ�
 

 -- 28. ���� ��� �� ��� ���� ���� ����� ���� �̸�, 
--  ��å, ���̸��� ��ȸ�ϼ���
--  ��, ��å�� 'Sales Rep'�� ����� ������� �Ѵ�
 
     
 -- 28-2. �� �� ��������� ���� ���� �̸�, 
 -- ��å, ����� ���� �̸��� ��ȸ�ϼ���    
 

--  29. �ֹ����º��� �ֹ�����, 
--  �ֹ��ݾ�(�ֹ�����x�����ݾ�)�� ������ ��ȸ�ϼ���  
 
 
 
--  30. �ֹ���ȣ���� �ֹ���ȣ, 
--  �ֹ��ݾ�(�ֹ�����x�����ݾ�)�� ������ ��ȸ�ϼ���
 

--  31. �ֹ��⵵����  �ֹ��⵵, �ֹ��ݾ�(�ֹ�����x�����ݾ�)�� ������ ��ȸ�ϼ���
--  ��, �ֹ����ڿ��� �⵵���� ���ϴ� �Լ��� year() �̴�
 

--  31-2. �ֹ��⵵�� �ֹ��Ǽ��� ��ȸ�ϼ���
 

--  32. �ֹ����º� �ֹ����� ���� ��ȸ�ϼ���
 

--  33. �ֹ���ȣ���� �ֹ���ȣ, �ֹ����� ����, 
--  �ֹ��ݾ�(�ֹ�����x�����ݾ�)�� ������ ��ȸ�ϼ���
--  ��, �ֹ��ݾ��� 1000�̻�, �ֹ������� 600 �̻��� 
--  ������� �Ѵ�
 

 -- 34. �ֹ���ȣ�� �ֹ����º��� �׷�ȭ�� ��
 -- �ֹ���ȣ�� �ֹ�����, �ֹ��ݾ�(�ֹ�����x�����ݾ�)�� ������ ��ȸ�϶�
 -- ��, �ֹ����°� ���shipped, �ֹ��ݾ��� 1500�̻��� ������� �Ѵ�
 
      
 -- 35. USA�� �ִ� �繫�ǿ��� �ٹ��ϴ� 
 -- ����� ���� �̸��� ��ȸ�ϼ���
  

 -- 36. ���ұݾ��� ���� ���� ���� ����ȣ, 
 -- üũ��ȣ, ���ұݾ��� ��ȸ�ϼ���
 

 -- 37. ��� ���ұݾ׺��� ���� �ݾ��� ������ ���� 
--  ����ȣ, üũ��ȣ, ���ұݾ��� ��ȸ�ϼ���
 

 -- 38. �ֹ��� �ѹ��� ���� ���� ���� �̸��� ��ȸ�ϼ���