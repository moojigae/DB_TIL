-- �Լ�(FUNTION) : �÷��� ���� �о ����� ��� ����
-- ���� �� �Լ�(SINGLE ROW FUNTION) : N���� ���� �־ N���� ��� ����
-- �׷� �Լ�(GROUP FUNTION) : N���� ���� �־ �� ���� ��� ����
-- SELECT ���� ������ �Լ��� �׷� �Լ��� �ղ� ��� ���� : ��� ���� ����� �ٸ��� ����

--SELECT LENGTH(EMP_NAME)         -- ���� �� �Լ�
--FROM EMPLOYEE;
--
--SELECT COUNT(EMP_NAME)          -- �׷��Լ�
--FROM EMPLOYEE;

--SELECT LENGTH(EMP_NAME), COUNT(EMP_NAMES)  -- ���� �� �Լ�(23��)�� �׷��Լ�(1��)�� ��ȯ �� ������ ���ƾ����� SELECT �� �� ����
--FROM EMPLOYEE;


-- �Լ��� ��� �� �� �ִ� ��ġ
-- SELECT��, WHERE��, GROUP BY��, HAVING��, ORDER BY��

-- ���� �� �Լ�
-- 1. ���� ���� �Լ�

-- LENGTH / LENGTHB
-- LENGTH(�÷��� | '���ڿ�') : ���� �� ��ȯ
-- LENGTHB(�÷��� | '���ڿ�') : ������ ����Ʈ ������ ��ȯ
SELECT LENGTH('����Ŭ'), LENGTHB('����Ŭ')        -- ����Ŭ���� �ѱ��� 3����Ʈ 
FROM DUAL;  -- ���� ���̺�

SELECT EMAIL, LENGTH(EMAIL), LENGTHB(EMAIL)
FROM EMPLOYEE;

-- INSTR : �ش� ���ڿ��� ù�� ° ��ġ
-- ����Ŭ�� �����ε��� ����� �ƴ�
SELECT INSTR('AABAACAABBAA', 'B') FROM DUAL;    
SELECT INSTR('AABAACAABBAA', 'Z') FROM DUAL;

SELECT INSTR('AABAACAABBAA', 'B', 1) FROM DUAL; -- 1��°���� �б� �����ؼ� ó������ ������ B�� ��ġ ��ȯ
SELECT INSTR('AABAACAABBAA', 'B', -1) FROM DUAL;    -- -1��°(��)���� �б� �����ؼ� ó������ ������ B�� ��ġ ��ȯ
SELECT INSTR('AABAACAABBAA', 'C', -1) FROM DUAL;    -- ������ �б� �����ؼ� C�� ��ġ ��ȯ 
SELECT INSTR('AABAACAABBAA', 'B', 1, 2) FROM DUAL;  -- 1��°���� �б� �����ؼ� �� ��°�� ������ B�� ��ġ ��ȯ
SELECT INSTR('AABAACAABBAA', 'B', -1, 2) FROM DUAL; -- �ڿ��� ���� �б� �����ؼ� �ι�°�� ������ B�� ��ġ ��ȯ
SELECT INSTR('AABAACAABBAA', 'C', 1, 2) FROM DUAL;  -- ó������ �б� �����ؼ� �ι�° C�� ��ȯ������ ���� ������ 0 ��ȯ

-- EMPLOYEE ���̺��� �̸����� @ ��ġ ��ȯ
SELECT EMAIL, INSTR(EMAIL, '@')
FROM EMPLOYEE;

-- LPAD / RPAD : �־��� �÷��̳� ���ڿ��� ������ ���ڿ��� ���� / �����ʿ� ���ٿ� ���� N�� ���ڿ� ��ȯ

SELECT LPAD(EMAIL, 20)          -- �� 20 ������ ��ĭ���� ä�� ����
FROM EMPLOYEE;

SELECT LPAD(EMAIL, 20, '#')     -- �� 20���� �߿� ���� �� ������ #���� ä��
FROM EMPLOYEE;

SELECT RPAD(EMAIL, 20)          -- �� 20���� �߿� �������� ��ĭ���� ä��
FROM EMPLOYEE;

SELECT RPAD(EMAIL, 20, '#')     -- �� 20���� �߿� ������ �� ������ #���� ä��
FROM EMPLOYEE;

-- LTRIM/RTRIM/TRIM : �־��� �÷��̳� ���ڿ��� ���� �Ǵ� ������ �Ǵ� ��/��/���ʿ��� ������ ���� ������ ������ ��ȯ
SELECT LTRIM('   KH') FROM DUAL;    -- ������ ���ڿ��� �������� �ʾ��� ��� ������ ����Ʈ�� ��
SELECT LTRIM('   KH', ' ') FROM DUAL;
SELECT LTRIM('000123456', '0') FROM DUAL;
SELECT LTRIM('123123KH','123') FROM DUAL;
SELECT LTRIM('123123KH123', '123') FROM DUAL;   -- KH123 ��ȯ
SELECT LTRIM('ACABACCKH' ,'ABC') FROM DUAL;     -- KH ��ȯ
SELECT LTRIM('5781KH', '0123456789') FROM DUAL;

SELECT RTRIM('KH   ') FROM DUAL;
SELECT RTRIM('123456000','000') FROM DUAL;
SELECT RTRIM('KHACABACC', 'ABC') FROM DUAL;

SELECT TRIM('   KH   ') FROM DUAL;
SELECT TRIM('Z' FROM 'ZZZKHZZZ') FROM DUAL;
SELECT TRIM('123' FROM '123132KH123321') FROM DUAL;     -- �� ���ڸ� ���� ����
SELECT TRIM(LEADING 'Z' FROM 'ZZZ123456') FROM DUAL;     -- ��
SELECT TRIM(TRAILING 'Z' FROM '123456ZZZ') FROM DUAL;     -- ��
SELECT TRIM(BOTH 'Z' FROM 'ZZZ123456ZZZZZZ') FROM DUAL;   -- �� ��

-- SUBSTR : �÷��̳� ���ڿ����� ������ ��ġ���� ���� ������ ���ڿ��� �߶� ��ȯ
SELECT SUBSTR('SHOWMETHEMONEY', 7) FROM DUAL;       -- ���������� ����
SELECT SUBSTR('SHOWMETHEMONEY', 5, 2) FROM DUAL;    -- ���������� ����� ���� ����
SELECT SUBSTR('SHOWMETHEMONRY', 5, 0) FROM DUAL;
SELECT SUBSTR('SHOWMETHEMONEY', 1, 6) FROM DUAL;
SELECT SUBSTR('SHOWMETHEMONEY', -8, 3) FROM DUAL;   -- ������ 3��
SELECT SUBSTR('SHOWMETHEMONEY', -10, 2) FROM DUAL;

-- EMPLOYEE ���̺��� �̸�, �̸���, @���ĸ� ������ ���̵� ��ȸ
-- SELECT EMP_NAME, EMAIL, RTRIM(EMAIL, '@kh.or.kr')
SELECT EMP_NAME, EMAIL, SUBSTR(EMAIL, 1, INSTR(EMAIL, '@') -1) ���̵�
FROM EMPLOYEE;

-- �ֹε�Ϲ�ȣ���� ������ ��Ÿ���� �κи� �߶󺸱�
SELECT SUBSTR(EMP_NO, 8, 1)
FROM EMPLOYEE;
-- EMPLOYEE ���̺��� �������� �ֹι�ȣ�� �̿��Ͽ� �����, ����, ����, ���� ��ȸ
SELECT EMP_NAME, SUBSTR(EMP_NO, 1, 2)||'��' ����, SUBSTR(EMP_NO, 3, 2)||'��' ����, SUBSTR(EMP_NO, 5, 2)||'��' ����
FROM EMPLOYEE;

-- LOWER/ UPPER / INITCAP
SELECT LOWER('WELCOME TO MY WORLD') FROM DUAL;
SELECT UPPER('welcome to my world') FROM DUAL;
SELECT INITCAP('welcome to my world') FROM DUAL;

-- CONCAT : ���ڿ��� �ڿ� ����
SELECT CONCAT('�����ٶ�', 'ABCD') FROM DUAL;       -- �����ٶ�ABCD ��ȯ
SELECT '�����ٶ�' || 'ABCD' FROM DUAL;      -- �����ٶ�ABCD ��ȯ

-- REPLACE
SELECT REPLACE('����� ������ ���ﵿ', '���ﵿ', '�Ｚ��') FROM DUAL;     -- ����� ������ �Ｚ�� ��ȯ
SELECT REPLACE('����ȣ �л��� ������ �����ϱ��?', '����', '����') FROM DUAL;     -- ����ȣ �л��� ������ �����ϱ��?

-- EMPLOYEE ���̺��� �̸����� �������� GMAIL.COM���� �����ϱ�
SELECT REPLACE(EMAIL, 'kh.or.kr', 'gmail.com') FROM EMPLOYEE;
-- EMPLOYEE ���̺��� �����, �ֹι�ȣ ��ȸ. ��, �ֹι�ȣ�� ������ϸ� ���̰� �ϰ� '-' ���� ���� '*'�� �ٲٱ�
-- 1)
SELECT EMP_NAME, REPLACE(EMP_NO,SUBSTR(EMP_NO,9) ,'******')     -- 621235-1******
FROM EMPLOYEE;
-- 2)
SELECT EMP_NAME, CONCAT(SUBSTR(EMP_NO, 0, 8), '******')
FROM EMPLOYEE;
-- 3)
SELECT EMP_NAME, RPAD(SUBSTR(EMP_NO, 0, 8),14,'*')
FROM EMPLOYEE;

-- 2. ���� ���� �Լ�

-- ABS : ���밪 �������ִ� �Լ�
-- ���밪 : ���
SELECT ABS(10.9) FROM DUAL;
SELECT ABS(-10.9) FROM DUAL;
SELECT ABS(10) FROM DUAL;
SELECT ABS(-10) FROM DUAL;

-- MOD
SELECT MOD(10, 3) FROM DUAL;        -- 1
SELECT MOD(-10, 3) FROM DUAL;       -- -1
SELECT MOD(10, -3) FROM DUAL;       -- 1
SELECT MOD(10.9, 3) FROM DUAL;      -- 1.9
SELECT MOD(-10.9, 3) FROM DUAL;     -- -1.9

SELECT MOD(-10, -3) FROM DUAL;      -- -1

-- ROUND : �ݿø�
SELECT ROUND(123.456) FROM DUAL;        -- 123 // �⺻�� �Ҽ� ù��° �ڸ� 
SELECT ROUND(123.678, 0) FROM DUAL;     -- 124 // �����ε��� ��� ���� ��

SELECT ROUND(123.456, 1) FROM DUAL;     -- 123.5
SELECT ROUND(123.456, 2) FROM DUAL;     -- 123.46
SELECT ROUND(123.456, -2) FROM DUAL;    -- 100

-- ����
SELECT ROUND(-10.61) FROM DUAL;     -- -11

-- FLOOR : ����(������)
SELECT FLOOR(123.456) FROM DUAL;    -- 123 
SELECT FLOOR(123.678) FROM DUAL;    -- 123

-- TRUNC : ����(����)
SELECT TRUNC(123.456) FROM DUAL;        -- 123
SELECT TRUNC(123.678) FROM DUAL;        -- 123
SELECT TRUNC(123.456, 1) FROM DUAL;     --123.4
SELECT TRUNC(123.456, -1) FROM DUAL;    -- 120

-- CEIL : �ø�
SELECT CEIL(123.456) FROM DUAL;     -- 124
SELECT CEIL(123.678) FROM DUAL;     -- 124

-- 3. ��¥ ���� �Լ�

-- SYSDATE : ���� ��¥ ��ȯ

-- MONTHS_BETWEEN : ��¥�� ��¥ ������ ���� �� ���̸� ���ڷ� �����ϴ� �Լ�
-- EMPLOYEE ���̺��� ����� �̸�, �Ի���, �ٹ� ���� �� ��ȸ
SELECT EMP_NAME, HIRE_DATE, MONTHS_BETWEEN(SYSDATE, HIRE_DATE)
FROM EMPLOYEE;

-- ADD_MONTHS : ��¥�� ���ڸ�ŭ�� ���� ���� ���� ��¥ ����
SELECT ADD_MONTHS(SYSDATE, 5) FROM DUAL;
SELECT ADD_MONTHS(SYSDATE, 15) FROM DUAL;

-- NEXT_DAY : ���� ��¥���� ���Ϸ��� ���Ͽ� ���� ����� ��¥�� �����ϴ� �Լ�
SELECT SYSDATE, NEXT_DAY(SYSDATE, '�����') FROM DUAL;     -- 20/02/05	20/02/06
SELECT SYSDATE, NEXT_DAY(SYSDATE, 1) FROM DUAL;
-- �� �� ȭ �� �� �� ��
-- 1  2  3  4 5  6  7
SELECT SYSDATE, NEXT_DAY(SYSDATE, '��') FROM DUAL;
SELECT SYSDATE, NEXT_DAY(SYSDATE, 'ȭ������ ���� ���� ������ �ϰ� ������?') FROM DUAL;  -- 20/02/05	20/02/11
SELECT SYSDATE, NEXT_DAY(SYSDATE, '��ȭ���� �ڱ� �̸��� �Ǵ��� �ñ��ϰ���') FROM DUAL;   -- ù���ڰ� ���̶� ����
SELECT SYSDATE, NEXT_DAY(SYSDATE, 'THURSDAY') FROM DUAL;

ALTER SESSION SET NLS_LANGUAGE = AMERICAN;
SELECT SYSDATE, NEXT_DAY(SYSDATE, 'THUR') FROM DUAL;
SELECT SYSDATE, NEXT_DAY(SYSDATE, 'THUROSEMARY') FROM DUAL;

ALTER SESSION SET NLS_LANGUAGE = KOREAN;

-- LAST_DAY : �ش� ���� ������ ��¥ ����
SELECT SYSDATE, LAST_DAY(SYSDATE) FROM DUAL;    -- 20/02/05	20/02/29

-- EXTRACT : ��¥���� ��, ��, �� �����Ͽ� ����
-- EXTRACT(YEAR FROM ��¥)
-- EXTRACT(MONTH FROM ��¥)
-- EXTRACT(DAY FROM ��¥)

-- EMPLOYEE ���̺��� ����� �̸�, �Խ� ��, �Ի� ��, �Ի��� ��ȸ
SELECT EMP_NAME, EXTRACT(YEAR FROM HIRE_DATE) �Ի�⵵,
                 EXTRACT(MONTH FROM HIRE_DATE) �Ի��,
                 EXTRACT(DAY FROM HIRE_DATE) �Ի���
FROM EMPLOYEE;


-- 4. �� ��ȯ �Լ�
-- TO_CHAR(��¥(, [����]) : ��¥�� �����͸� ������ �����ͷ� ��ȯ
-- TO_CHAR(����(, [����]) : ������ �����͸� ������ �����ͷ� ��ȯ
SELECT TO_CHAR(1234) �� FROM DUAL;
SELECT TO_CHAR(1234, '99999') �� FROM DUAL;  -- 5ĭ, ������ ����, ��ĭ ����
SELECT TO_CHAR(1234, '00000') �� FROM DUAL;  -- 5ĭ, ������ ����, ��ĭ 0
SELECT TO_CHAR(1234, 'L99999') �� FROM DUAL; -- ��ȭ ����
SELECT TO_CHAR(1234, 'FML99999') �� FROM DUAL;   -- ������ �ƿ� ���ְ� ���� ���� FM�� ���̸� ��
SELECT TO_CHAR(1234, '$99999') �� FROM DUAL;
SELECT TO_CHAR(1234, 'FM$99999') �� FROM DUAL;
SELECT TO_CHAR(1234, '99,999') �� FROM DUAL;
SELECT TO_CHAR(1234, 'FM99,999') �� FROM DUAL;
SELECT TO_CHAR(1234, '00,000') �� FROM DUAL;
SELECT TO_CHAR(1234, 'FM00,000') �� FROM DUAL;
SELECT TO_CHAR(1234, '9.9EEEE') �� FROM DUAL;    -- ���� ���   1.2E+03
SELECT TO_CHAR(1234, '999') �� FROM DUAL;        -- ���� ĭ�� ���̺��� ��� #���� ó��     ###

SELECT TO_CHAR(SYSDATE, 'PM HH24:MI:SS') FROM DUAL;     -- ���� 20:04:02
SELECT TO_CHAR(SYSDATE, 'AM HH:MI:SS') FROM DUAL;       -- ���� 08:05:11
SELECT TO_CHAR(SYSDATE, 'MON DY, YYYY') FROM DUAL;      -- 2��  ��, 2020
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD DAY') FROM DUAL;    -- 2020-02-05 ������
SELECT TO_CHAR(SYSDATE, 'YYYY-FMMM-DD DAY') FROM DUAL;  -- 2020-2-5 ������     // FM�� ������ �ڿ� ������ ������ ��
SELECT TO_CHAR(SYSDATE, 'YEAR, Q') || '�б�' FROM DUAL;       -- TWENTY TWENTY, 1�б�
SELECT TO_CHAR(SYSDATE, 'YYYY"��" MM"��" DD"��" DAY') FROM DUAL;

-- ���� ��¥�� ���� 
-- ���� ���
SELECT TO_CHAR(SYSDATE, 'YYYY'), TO_CHAR(SYSDATE, 'YY'), TO_CHAR(SYSDATE, 'YEAR')   
FROM DUAL;      -- 2020	20	TWENTY TWENTY

-- �� ���
SELECT TO_CHAR(SYSDATE, 'MM'), TO_CHAR(SYSDATE, 'MONTH'), TO_CHAR(SYSDATE, 'MON'), TO_CHAR(SYSDATE, 'RM')
FROM DUAL;      -- 02	2�� 	2�� 	II   // RM : �θ� ���ڷ� ���

-- �� ���
SELECT TO_CHAR(SYSDATE, 'DDD'), TO_CHAR(SYSDATE, 'DD'), TO_CHAR(SYSDATE, 'D')
FROM DUAL;      -- 036	05	4   // DDD: �� �������� ����, DD: �� �������� ����, D : �� �������� ����

-- �б�, ���� ���
SELECT TO_CHAR(SYSDATE, 'Q'), TO_CHAR(SYSDATE, 'DAY'), TO_CHAR(SYSDATE, 'DY')
FROM DUAL;      -- 1	������	��

-- TO_DATE : ����/ ������ ������ -> ��¥�� ������
SELECT TO_DATE('20100101', 'YYYYMMDD') FROM DUAL;   -- 10/01/01
SELECT TO_DATE(20100101, 'YYYYMMDD') FROM DUAL;     -- 10/01/01     ����Ŭ���� �⺻������ �⵵ ��� �� 2�ڸ��� ���

--2010.01.01 ==> 2010, 1��
SELECT TO_CHAR(TO_DATE('20100101', 'YYYYMMDD'), 'YYYY, MON')
FROM DUAL;      -- 2010, 1�� 

SELECT TO_CHAR(TO_DATE('041030 143000', 'YYMMDD HH24MISS'), 'YY-MON-DD HH:MI:SS PM')
FROM DUAL;      -- 04-10��-30 02:30:00 ����

-- RR�� YY�� ���� (�� �� �⵵ ��Ÿ��)
-- YY : ���� ���� �������� ���缭 ����
-- RR : 50�⵵ 50�� �����̸� ���� ����, 50�� �̸��̸� ���� ����
SELECT TO_CHAR(TO_DATE('980630', 'YYMMDD'), 'YYYYMMDD'), TO_CHAR(TO_DATE('140918', 'YYMMDD'), 'YYYYMMDD'),
       TO_CHAR(TO_DATE('980630', 'RRMMDD'), 'YYYYMMDD'), TO_CHAR(TO_DATE('140918', 'RRMMDD'), 'YYYYMMDD')
FROM DUAL;      -- 20980630     20140918	19980630    20140918

-- TO_NUMBER : ������ ������ ==> ������ ������
SELECT TO_NUMBER('123456789') FROM DUAL;
SELECT '123' + '456' FROM DUAL;     -- 579
SELECT '123' + '456A' FROM DUAL;    -- ����Ŭ���� ���ڸ� �ִ� ��Ʈ���� ��� �ڵ����� ���ڷ� ��ȯ�������� ����A�� �ֱ� ������ ��Ʈ������ �ν�
SELECT '1,000,000' + '550,000' FROM DUAL;   --, ������ �ν� �ȵ�
SELECT TO_NUMBER('1,000,000', '99,999,999') FROM DUAL;
SELECT TO_NUMBER('1,000,000', '99,999,999') + TO_NUMBER('550,000', '999,999') FROM DUAL;    -- 1550000

-- 5. NULL ó�� �Լ�
-- NVL(�÷���, �÷� ���� NULL�� �� �ٲ� ��)

SELECT EMP_NAME, NVL(BONUS, 0)
FROM EMPLOYEE;          -- NULL�� ����� 0���� �ٲ�

SELECT EMP_NAME, NVL(DEPT_CODE, '�����ϴ�')
FROM EMPLOYEE;

-- NVL2(�÷���, �ٲ� ��1, �ٲ� ��2)  : �÷� ���� NULL�� �ƴϸ� �ٲ� ��1�� �ٲٰ� NULL�̸� �ٲ� ��2�� �ٲ�
-- EMPLOYEE ���̺��� ���ʽ��� NULL�� ������ 0.5��, NULL�� �ƴ� ������ 0.7�� �����Ͽ� ��ȸ
SELECT EMP_NAME,BONUS,NVL2(BONUS, 0.7, 0.5)
FROM EMPLOYEE;

-- NULLIF(�񱳴��1, �񱳴��2) : �� ���� ���� �����ϸ� NULL, �������� ������ �񱳴��1 ����
SELECT NULLIF(123, 123) FROM DUAL;      -- NULL
SELECT NULLIF(123, 124) FROM DUAL;      -- 123


-- 6. �����Լ� : ���� ���� ��� ������ �� �ִ� ��� ����
-- DECODE(����|�÷���, ���ǰ�1, ���ð�1, ���ǰ�2, ���ð�2...)
-- ���ϰ��� �ϴ� �� �Ǵ� �÷��� ���ǽİ� ������ ��� �� ��ȯ
SELECT EMP_ID, EMP_NAME, EMP_NO,
       DECODE(SUBSTR(EMP_NO, 8, 1), 1, '��', 2, '��') ����
FROM EMPLOYEE;      -- 200	������	621235-1985634	��

SELECT EMP_ID, EMP_NAME, EMP_NO,
       DECODE(SUBSTR(EMP_NO, 8, 1), 1, '��', '��') ����
FROM EMPLOYEE;
-- ������ ���ڷ� ���� �� ���� ���� ���� �ۼ��ϸ�
-- �ƹ��͵� �ش���� ���� �� �������� �ۼ��� ���ð��� ������ ������

-- CASE WHEN ���ǽ� THEN ��� ��
--      WHEN ���ǽ� THEN ��� ��
--      ELSE ��� ��
-- END
-- ���ϰ��� �ϴ� �� �Ǵ� �÷��� ���ǽİ� ������ ��� �� ��ȯ(������ ���� ����)

SELECT EMP_ID, EMP_NAME, EMP_NO,
       CASE WHEN SUBSTR(EMP_NO, 8, 1) = 1 THEN '��'
            ELSE '��'
       END ����
FROM EMPLOYEE;  -- 200	������	621235-1985634	��

-- �޿��� 500�� �ʰ� 1���, 350 �ʰ� 2���, 200�� �ʰ� 3���, ������ 4���
SELECT EMP_NAME, SALARY,
        CASE WHEN SALARY > 5000000 THEN '1���' WHEN SALARY > 3500000 THEN '2���' 
        WHEN SALARY > 2000000 THEN '3���' ELSE '4���' END ���
FROM EMPLOYEE;


-- �׷��Լ� : ���� ���� ������ �� ���� ����� ��ȯ
-- SUM(���ڰ� ��ϵ� �÷�) : �հ� ����
-- EMPLOYEE ���̺��� �� ����� �޿� ���� ��ȸ
SELECT SUM(SALARY)
FROM EMPLOYEE;      -- 70096240

-- EMPLOYEE ���̺��� ���� ����� �޿� ���� ��ȸ
SELECT SUM(SALARY)
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO, 8, 1) = 1;

-- AVG(���ڰ� ��ϵ� �÷�) : ��� ����
-- EMPLOYEE ���̺��� �� ����� �޿� ��� ��ȸ
SELECT AVG(SALARY)
FROM EMPLOYEE;

-- EMPLOYEE ���̺��� �� ����� BONUS �հ� ��ȸ
SELECT SUM(BONUS)
FROM EMPLOYEE;

-- EMPLOYEE ���̺��� �� ����� BONUS ��� ��ȸ
SELECT AVG(BONUS), AVG(NVL(BONUS, 0))
FROM EMPLOYEE;      -- 0.2166666666666666666666666666666666666667	0.0847826086956521739130434782608695652174
-- NULL ���� ���� ���� ��� ��꿡�� ���� �Ǿ� ���

-- MIN / MAX : �ּ�/�ִ�
-- EMPLOYEE ���̺��� ���� ���� �޿�, ���ĺ� ������ ���� ���� �̸���, ���� ���� �Ի���
-- MIN�� ���ڷ� ����, ��¥, ���� ����
SELECT MIN(SALARY), MIN(EMAIL), MIN(HIRE_DATE)
FROM EMPLOYEE;  -- 1380000	bang_ms@kh.or.kr	90/02/06

SELECT MAX(SALARY), MAX(EMAIL), MAX(HIRE_DATE)
FROM EMPLOYEE;  -- 8000000	youn_eh@kh.or.kr	17/06/19


-- COUNT(* | �÷���) : ���� ���� ����
-- COUNT(DISTINCT �÷���) : �ߺ��� ������ �� ���� ����
-- COUNT(*) : NULL�� ������ ��ü �� ���� ����
-- COUNT(�÷���) : NULL�� ������ ��ü �� ���� ����
SELECT COUNT(*), COUNT(DEPT_CODE), COUNT(DISTINCT DEPT_CODE)
FROM EMPLOYEE;      -- 23	21	6


