--SELECT EMP_ID, EMP_NAME
--FROM EMPLOYEE;
--
--SELECT *
--FROM EMPLOYEE;

-- SELECT
-- Result Set : SELECT�������� �����͸� ��ȸ�� �����, ��ȯ�� ����� ����(0�� �̻�)

-- EMPLOYEE ���̺��� ����� �̸�, �޿� ��ȸ
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE;

-- EMPLOYEE ���̺��� ��� ����� ��� ���� ��ȸ
-- SELECT EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE,
-- ENT_DATE, ENT_YN
SELECT * FROM EMPLOYEE;

-- �̴� �ǽ� ����
-- 1. JOB���̺��� ��� ���� ��ȸ
SELECT *
FROM JOB;
-- 2. JOB���̺��� ���� �̸� ��ȸ
SELECT JOB_NAME
FROM JOB;
-- 3. DEPARTMENT ���̺��� ��� ���� ��ȸ
SELECT *
FROM DEPARTMENT;
-- 4. EMPLOYEE ���̺��� ������, �̸���, ��ȭ��ȣ, ����� ��ȸ
SELECT EMP_NAME, EMAIL, PHONE, HIRE_DATE
FROM EMPLOYEE;
-- 5. EMPLOYEE ���̺��� ����̸� ��� �̸�, ���� ��ȸ
SELECT HIRE_DATE, EMP_NAME, SALARY
FROM EMPLOYEE;

-- �÷� ��, ��� ����
-- SELECT �� �÷��� �Է� �κп� ��꿡 �ʿ��� �÷���, ����, �����ڸ� �̿��ؼ� ��� ��ȸ ����

-- EMPLOYEE ���̺� ���� ��, ���� ��ȸ (���� = �޿� * 12)
SELECT EMP_NAME, SALARY*12
FROM EMPLOYEE;

-- EMPLOYEE ���̺��� ������ ������, ����, ���ʽ��� �߰��� ���� ��ȸ
--SELECT EMP_NAME,SALARY*12, (SALARY + (SALARY*BONUS))*12
SELECT EMP_NAME,SALARY*12, (SALARY*(1+BONUS))*12
FROM EMPLOYEE;

--SELECT *, SALARY*12   // *�� ȥ�� �����
--FROM EMPLOYEE;


-- �̴� �ǽ� ����
-- 1. EMPLOYEE ���̺��� �̸�, ����, �Ѽ��ɾ�(���ʽ� ����), �Ǽ��ɾ�(�Ѽ��ɾ� - (����*���� 3%)) ��ȸ
SELECT EMP_NAME,SALARY*12, (SALARY + (SALARY*BONUS))*12, (SALARY*(1+BONUS))*12 - (SALARY*12*0.03)
FROM EMPLOYEE;
-- 2. EMPLOYEE ���̺��� �̸�, �����, �ٹ��ϼ�(���� ��¥ - �����) ��ȸ
-- SYSDATE : ���� ��¥
SELECT SYSDATE  -- ���� ��¥ ���
FROM DUAL;  -- ���� ���̺�

SELECT EMP_NAME,HIRE_DATE, ROUND(SYSDATE - HIRE_DATE)   -- FLOOR ������ ���� ����� / ROUND �ݿø� / TRUNC �ø� 
FROM EMPLOYEE;

SELECT SYSDATE - HIRE_DATE �ٹ��ϼ�, ROUND(SYSDATE-HIRE_DATE) �ݿø�, CEIL(SYSDATE-HIRE_DATE) �ø�,
        FLOOR(SYSDATE-HIRE_DATE) ����, TRUNC(SYSDATE-HIRE_DATE) ����
FROM EMPLOYEE;


-- �÷� ��Ī :
-- �÷��� AS ��Ī
-- �÷��� "��Ī"
-- �÷��� AS "��Ī"
-- �÷��� ��Ī
-- ��Ī�� ����, Ư������, ���ڰ� ���Ե� ��� ������""���� ����� ��

-- EMPLOYEE ���̺��� ������ ������(��Ī : �̸�), ����(��Ī : ����(��)), ���ʽ��� �߰��� ����(��Ī : �Ѽҵ�(��)) ��ȸ
SELECT EMP_NAME �̸�, SALARY*12 "����(��)", (SALARY*(1+BONUS))*12 AS "�Ѽҵ�(��)"
FROM EMPLOYEE;

-- EMPLOYEE ���̺��� �̸�, �����, �ٹ��ϼ�(���ó�¥ - �����) ��ȸ
SELECT EMP_NAME AS �̸�, HIRE_DATE AS �����, SYSDATE-HIRE_DATE �ٹ��ϼ�
FROM EMPLOYEE;