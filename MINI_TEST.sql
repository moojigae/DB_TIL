-- EMPLOYEE ���̺��� ����� �̸�, �Ի���, �Ի� �� 6������ �� ��¥ ��ȸ
SELECT EMP_NAME �̸�, HIRE_DATE �Ի���, ADD_MONTHS(HIRE_DATE, 6) "�Ի� �� 6����"
FROM EMPLOYEE;

-- EMPLOYEE ���̺��� �����, �Ի���-����, ����-�Ի��� ��ȸ
-- ��, ��Ī�� �ٹ��ϼ�1, �ٹ��ϼ�2�� �ϰ�
-- ��� ����ó��(����), ����� �ǵ��� ó��
SELECT EMP_NAME �����, ABS(FLOOR(HIRE_DATE-SYSDATE)) �ٹ��ϼ�1, ABS(FLOOR(SYSDATE-HIRE_DATE)) �ٹ��ϼ�2
FROM EMPLOYEE;

-- EMPLOYEE ���̺��� ����� Ȧ���� �������� ���� ��� ��ȸ
SELECT *
FROM EMPLOYEE
WHERE MOD(EMP_ID, 2) = 1;

-- EMPLOYEE ���̺��� �ٹ� ����� 20�� �̻��� ���� ���� ��ȸ
SELECT EMP_NAME, HIRE_DATE
FROM EMPLOYEE
WHERE EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM HIRE_DATE) >= 20;

-- EMPLOYEE ���̺��� �����, �Ի���, �Ի��� ���� �ٹ��ϼ��� ��ȸ
SELECT EMP_NAME �����, HIRE_DATE �Ի���, SUBSTR(LAST_DAY(HIRE_DATE), 7) "�Ի��� ���� �ٹ��ϼ�"
FROM EMPLOYEE;

-- EMPLOYEE ���̺��� ����� �̸�, �Ի���, �ٹ���� ��ȸ
-- �� �ٹ������ (����⵵ - �Ի�⵵)�� ��ȸ�ϼ���
-- 1) EXTRACT
SELECT EMP_NAME �̸�, HIRE_DATE �Ի���, EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM HIRE_DATE) �ٹ����
FROM EMPLOYEE;
-- 2) MONTHS_BETWEEN
SELECT EMP_NAME �̸�, HIRE_DATE �Ի���, FLOOR((MONTHS_BETWEEN(SYSDATE,HIRE_DATE)) / 12) �ٹ����
FROM EMPLOYEE;

-- EMPLOYEE ���̺��� �����, �޿� ��ȸ
-- �޿��� '\9,000,000' �������� ǥ��
SELECT EMP_NAME �����, TO_CHAR(SALARY, 'FML9,999,999') �޿�
FROM EMPLOYEE;

-- EMPLOYEE ���̺��� �̸�, �Ի��� ��ȸ
-- �Ի����� ���� ������ '2017�� 12�� 06�� (��)' �������� ���
SELECT EMP_NAME �̸�, TO_CHAR(HIRE_DATE, 'YYYY"��" MM"��" DD"��" DY') �Ի���
FROM EMPLOYEE;

-- ������ �޿��� �λ��ϰ��� �Ѵ�
-- �����ڵ尡 J7�� ������ �޿��� 10%�� �λ��ϰ�
-- �����ڵ尡 J6�� ������ �޿��� 15%�� �λ��ϰ�
-- �����ڵ尡 J5�� ������ �޿��� 20%�� �λ��ϸ�
-- �� �� ������ ������ �޿��� 5%�� �λ��Ѵ�.
-- ���� ���̺��� ������, �����ڵ�, �޿�, �λ�޿�(�� ����)�� ��ȸ�ϼ���
-- 1) DECODE
SELECT EMP_NAME, JOB_CODE, SALARY,
       DECODE(JOB_CODE, 'J7', SALARY * 0.1, 'J6', SALARY * 0.15, 'J5', SALARY * 0.2,SALARY * 0.05)
FROM EMPLOYEE;       

-- 2) CASE WHEN
SELECT EMP_NAME, JOB_CODE, SALARY,
        CASE WHEN JOB_CODE = 'J7' THEN SALARY * 0.1 WHEN JOB_CODE = 'J6' THEN SALARY * 0.15
             WHEN JOB_CODE = 'J5' THEN SALARY * 0.2 ELSE SALARY * 0.05 END
FROM EMPLOYEE;


-- ���, �����, �޿�
-- �޿��� 500���� �̻��̸� '���'
-- �޿��� 300~500�����̸� '�߱�'
-- �� ���ϴ� '�ʱ�'���� ���ó���ϰ� ��Ī�� '����'���� �Ѵ�.
SELECT EMP_ID, EMP_NAME, SALARY,
        CASE WHEN SALARY >= 5000000 THEN '���' WHEN SALARY >= 3000000 OR SALARY <= 5000000 THEN '�߱�' ELSE '�ʱ�' END ����
FROM EMPLOYEE;

-- EMPLOYEE���̺��� �μ��ڵ尡 D5�� ������ ���ʽ� ���� ���� ��ȸ
SELECT NVL(EMP_NAME, '�����ϴ�'), NVL((SALARY*(1+BONUS))*12, '�����ϴ�')
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5';

-- ������, �����ڵ�, ���ʽ��� ���Ե� ����(��) ��ȸ
--  ��, ������ ��57,000,000 ���� ǥ�õǰ� ��
SELECT EMP_NAME ������, JOB_CODE �����ڵ�, TO_CHAR(NVL((SALARY*(1+BONUS))*12, SALARY * 12), 'FML99,999,999') ����
FROM EMPLOYEE;


-- �μ��ڵ尡 D5, D9�� ������ �߿��� 2004�⵵�� �Ի��� ������ ���, �����, �μ��ڵ�, �Ի���
SELECT EMP_ID, EMP_NAME,JOB_CODE
FROM EMPLOYEE
WHERE (DEPT_CODE = 'D5' OR DEPT_CODE = 'D9') AND EXTRACT(YEAR FROM HIRE_DATE) = 2004;

-- ������, �Ի���, �Ի��� ���� �ٹ��ϼ� ��ȸ(��, �ָ��� �Ի��� ���� �ٹ��ϼ��� ������)
SELECT EMP_NAME ������, HIRE_DATE �Ի���, SUBSTR(LAST_DAY(HIRE_DATE), 7) "�Ի��� ���� �ٹ��ϼ�"
FROM EMPLOYEE;


-- �μ��ڵ尡 D5�� D6�� �ƴ� ������� ������, �μ��ڵ�, �������, ����(��) ��ȸ
--  ��, ��������� �ֹι�ȣ���� �����ؼ� ������ ������ �����Ϸ� ��µǰ� �ϰ�
--  ���̴� �ֹι�ȣ���� �����ؼ� ��¥�����ͷ� ��ȯ�� ���� ���

--        TO_NUMBER(EXTRACT(YEAR FROM SYSDATE))-TO_NUMBER(EXTRACT(YEAR FROM EMP_NO)) "����(��)" 
--        EXTRACT�� ��¥���Ŀ��� ���� �����ϴ� ���ε� �ֹι�ȣ�� ��Ʈ���̶� �ȵ�
--SELECT EXTRACT(YEAR FROM TO_DATE(SUBSTR(EMP_NO,1, 6),'RR'))
--SELECT TO_DATE(SUBSTR(EMP_NO,1, 6),'RRMMDD')
SELECT EMP_NAME ������, JOB_CODE �μ��ڵ�, 
       TO_CHAR(TO_DATE(SUBSTR(EMP_NO,1,6),'RRMMDD'), 'YYYY"��" MM"��" DD"��"') �������,
       EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM TO_DATE(SUBSTR(EMP_NO,1,6), 'RRMMDD')) "����(��)"
--SELECT EXTRACT(YEAR FROM TO_DATE(SUBSTR(EMP_NO,1,6), 'RRMMDD'))
FROM EMPLOYEE
--WHERE NOT (EMP_ID = '200' OR EMP_ID = '201' OR EMP_ID = '214');
WHERE NOT EMP_ID IN('200','201','214');
    
-- �������� �Ի��Ϸ� ���� �⵵�� ������, �� �⵵�� �Ի��ο����� ���Ͻÿ�.
--  �Ʒ��� �⵵�� �Ի��� �ο����� ��ȸ�Ͻÿ�.
--  => to_char, decode, sum ���
--
--	-------------------------------------------------------------
--	��ü������   2001��   2002��   2003��   2004��
--	-------------------------------------------------------------
SELECT SUM(DECODE(TO_CHAR(HIRE_DATE, 'YY'), '01', 1,0)) "2001��",
       SUM(DECODE(TO_CHAR(HIRE_DATE, 'YY'), '02', 1,0)) "2002��",
       SUM(DECODE(TO_CHAR(HIRE_DATE, 'YY'), '03', 1,0)) "2003��",
       SUM(DECODE(TO_CHAR(HIRE_DATE, 'YY'), '04', 1,0)) "2004��",
       SUM(DECODE(TO_CHAR(HIRE_DATE, 'YY'), '01', 1,'02',1,'03',1,'04',1,0)) ��ü������
-- SELECT TO_CHAR(HIRE_DATE, 'YYYY')
FROM EMPLOYEE;


--  �μ��ڵ尡 D5�̸� �ѹ���, D6�̸� ��ȹ��, D9�̸� �����η� ó���Ͻÿ�.
--   ��, �μ��ڵ尡 D5, D6, D9 �� ������ ������ ��ȸ��
-- 1) DECODE
SELECT DECODE(JOB_CODE, D5,'�ѹ���', D6, '��ȹ��', D9, '������')
FROM EMPLOYEE
WHERE JOB_CODE = 'D5' OR JOB_CODE = 'D6' OR JOB_CODE = 'D9';
-- 2) CASE WHEN
SELECT CASE WHEN DEPT_CODE = 'D5' THEN '�ѹ���'
            WHEN DEPT_CODE = 'D6' THEN '��ȹ��'
            WHEN DEPT_CODE = 'D9' THEN '������'
            END
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5' OR DEPT_CODE = 'D6' OR DEPT_CODE = 'D9';
