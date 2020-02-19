-- 1. �� ������б��� �а� �̸��� �迭�� ǥ���Ͻÿ�. ��, ��� ����� "�а� ��", "�迭"���� ǥ��
SELECT DEPARTMENT_NAME,CATEGORY
FROM TB_DEPARTMENT;

-- 2. �а��� �а� ������ ������ ���� ���·� ȭ�鿡 ���
SELECT DEPARTMENT_NAME ||'�� ������ ' || CAPACITY || '�� �Դϴ�.' "�а��� ����"
FROM TB_DEPARTMENT;

-- 3. "������а�"�� �ٴϴ� ���л� �� ���� �������� ���л��� ã����.(�����а��Ǥ� '�а��ڵ�'�� �а� ���̺�(TB_DEPARTMENT)�� ��ȸ�ؼ� ã����)
SELECT DEPARTMENT_NAME, DEPARTMENT_NO
FROM TB_DEPARTMENT
WHERE DEPARTMENT_NAME = '������а�';

SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE DEPARTMENT_NO = 001 AND ABSENCE_YN = 'Y' AND SUBSTR(STUDENT_SSN,8,1) = 2;

-- 4. ���������� ���� ���� ��� ��ü�ڵ��� ã�� �̸��� �Խ��ϰ��� �Ѵ�. �� ����ڵ��� �й��� ������ ���� �� ����ڵ��� ã����
SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE STUDENT_NO IN('A513079', 'A513090', 'A513091', 'A513110', 'A513119')
ORDER BY STUDENT_NAME DESC;

-- 5. ���������� 20�� �̻� 30�� ������ �а����� �а� �̸��� �迭�� ����϶�
SELECT DEPARTMENT_NAME, CATEGORY
FROM TB_DEPARTMENT
WHERE CAPACITY >= 20 AND CAPACITY <= 30;

-- 6. �б��� ������ �����ϰ� ��� �������� �Ҽ� �а��� ������ �ִ�. ������ �̸��� �˾Ƴ� �� �ִ� ������ �ۼ��϶�
SELECT PROFESSOR_NAME
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO IS NULL;

-- 7. Ȥ�� ������� ������ �а��� �����Ǿ� ���� ���� �л��� �ִ��� Ȯ���Ϸ��� �Ѵ�. � ������ ����ϸ� ���� �ۼ��϶�
SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE DEPARTMENT_NO IS NULL;

-- 8. ���������� �����ϴ� ������� � �������� �����ȣ�� ��ȸ�϶�
SELECT CLASS_NO
FROM TB_CLASS
WHERE PREATTENDING_CLASS_NO IS NOT NULL;

-- 9. �б��� � �迭���� �ִ��� ��ȸ�϶�
SELECT DISTINCT(CATEGORY)
FROM TB_DEPARTMENT
ORDER BY CATEGORY;

-- 10. 02�й� ���� �����ڵ��� ������ ������� �Ѵ�. ������ ������� ������ �������� �л����� �й�, �̸�, �ֹι�ȣ�� ����ϴ� ������ �ۼ��϶�
SELECT STUDENT_NO, STUDENT_NAME, STUDENT_SSN
FROM TB_STUDENT
WHERE ABSENCE_YN = 'N' AND SUBSTR(ENTRANCE_DATE,1,2) = '02' AND STUDENT_ADDRESS LIKE '%����%';


-- 1. ������(�а��ڵ� 002) �л����� �й��� �̸�, ���� �⵵�� ���� �⵵�� ���������� ǥ���ϴ� SQL ������ �ۼ��϶�
-- (��, ����� "�й�","�̸�","���г⵵" �� ǥ�õǵ��� �Ѵ�)
SELECT STUDENT_NO �й� ,STUDENT_NAME �̸�, TO_CHAR(ENTRANCE_DATE,'YYYY-MM-DD') ���г⵵
FROM TB_STUDENT
WHERE DEPARTMENT_NO = 002
ORDER BY ENTRANCE_DATE;

-- 2. �б��� ���� �� �̸��� �� ���ڰ� �ƴ� ������ �� �� �ִٰ� �Ѵ�. �� ������ �̸��� �ֹι�ȣ�� ȭ�鿡 ����ϴ� SQL������ �ۼ��� ����
-- �ùٸ��� �ۼ��� ���� ��� ���� ����� �ٸ��� ���� �� �ִ�. ������ �������� ������ �� ��
SELECT PROFESSOR_NAME,PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE NOT PROFESSOR_NAME LIKE '___';

-- 3. �б��� ���� �������� �̸��� ���̸� ����ϴ� SQL ������ �ۼ��϶�. ��, �� �� ���̰� ���� ������� ���� ��� ������ ȭ�鿡 ��µǰ� �϶�
-- (��, ���� �� 2000�� ���� ����ڴ� ������ ��� ����� "�����̸�", "����"�� �Ѵ�. ���̴� '��'���� ����Ѵ�)
-- SELECT PROFESSOR_NAME, EXTRACT(YEAR FROM SYSDATE)-TO_CHAR(EXTRACT(YEAR FROM (TO_DATE(SUBSTR(PROFESSOR_SSN, 1,6), 'YYYYMMDD'))), 'YYYY') ����
SELECT EXTRACT(YEAR FROM SYSDATE) - TO_CHAR(TO_DATE(SUBSTR(PROFESSOR_SSN, 1,2), 'YY'),'YYYY') +100  "����" -- TO_DATE YYYY X
FROM TB_PROFESSOR
ORDER BY ����;

-- 4. �������� �̸� �� ���� ������ �̸��� ����ϴ� ������ �ۼ��϶�. ��� ����� "�̸�"�� �������� �Ѵ�
SELECT SUBSTR(PROFESSOR_NAME, 2) "�̸�"
FROM TB_PROFESSOR;

-- 5. �б��� ����� �����ڸ� ���Ϸ� �Ѵ�. ��� ã�Ƴ� ���ΰ�? �� ��, 19�쿡 �����ϸ� ����� ���� ���� ������ �����Ѵ�
SELECT STUDENT_NO, STUDENT_NAME
FROM TB_STUDENT
WHERE TO_CHAR(TO_DATE(SUBSTR(ENTRANCE_DATE, 1,2), 'RR'),'YYYY') - TO_CHAR(TO_DATE(SUBSTR(STUDENT_SSN, 1, 2), 'RR'),'YYYY') > 19;

-- 6. 2020�� ũ���������� ���� �����ΰ�?


-- 7. TO_DATE('99/10/11','YY/MM/DD), TO_DATE('49/10/11', 'YY/MM/DD')�� ���� �� �� �� �� �� ���� �ǹ��ұ�?
-- �� TO_DATE('99/10/11','RR/MM/DD'), TO_DATE('49/10/11', 'RR/MM/DD')�� ���� �� �� �� �� �� ���� �ǹ��ұ�?


-- 8. �б��� 2000�⵵ ���� �����ڵ��� �й��� A�� �����ϰ� �Ǿ��ִ�. 2000�⵵ ���� �й��� ���� �л����� �й��� �̸��� �����ִ� ���� �ۼ�
SELECT STUDENT_NO, STUDENT_NAME
FROM TB_STUDENT
WHERE STUDENT_NO NOT LIKE 'A%';

-- 9. �й��� A517178�� �ѾƸ� �л��� ���� �� ������ ���ϴ� ������ �ۼ��϶�. ��, �� �� ��� ȭ���� ����� "����"�̶�� ������ �ϰ�, 
-- ������ �ݿø��Ͽ� �Ҽ��� ���� �� �ڸ������� ǥ��
SELECT ROUND(AVG(POINT), 1)
FROM TB_GRADE
WHERE STUDENT_NO = 'A517178';

-- 10. �а��� �л����� ���Ͽ� "�а���ȣ", "�л���(��)"�� ���·� ����� ����� ������� ��µǵ��� �϶�
SELECT DEPARTMENT_NO �а���ȣ, COUNT(STUDENT_NO) "�л���(��)"
FROM TB_STUDENT
GROUP BY DEPARTMENT_NO
ORDER BY DEPARTMENT_NO;

-- 11. ���� ������ �������� ���� �л��� ���� �� �� ���� �Ǵ��� �˾Ƴ���
SELECT COUNT(*)
FROM TB_STUDENT
WHERE COACH_PROFESSOR_NO IS NULL;

-- 12. �й��� A112113�� ���� �л��� �⵵ �� ������ ���϶�. ��, �� �� ��� ȭ���� ����� "�⵵", "�⵵ �� ����" �̶�� ������ �ϰ�
-- ������ �ݿø��Ͽ� �Ҽ��� ���� ���ڸ������� ǥ��
SELECT SUBSTR(TERM_NO,1,4) �⵵, ROUND(AVG(POINT), 1) "�⵵ �� ����"
FROM TB_GRADE
WHERE STUDENT_NO = 'A112113'
GROUP BY SUBSTR(TERM_NO,1,4)
ORDER BY SUBSTR(TERM_NO,1,4);

-- 13. �а� �� ���л� ���� �ľ��ϰ��� �Ѵ�. �а� ��ȣ�� ���л� ���� ǥ���϶�
SELECT DEPARTMENT_NO, COUNT(DECODE(ABSENCE_YN, 'Y', 1, NULL)) "���л� ��"
FROM TB_STUDENT
GROUP BY DEPARTMENT_NO
ORDER BY DEPARTMENT_NO;

-- 14. �������� �л����� �̸��� ã����
SELECT STUDENT_NAME "�����̸�", COUNT(*) "������ ��"
FROM TB_STUDENT
GROUP BY STUDENT_NAME
HAVING COUNT(*) > 1
ORDER BY "�����̸�";

-- 15. �й��� A112113�� ���� �л��� �⵵, �б� �� ������ �⵵ �� ���� ����, �� ������ ���϶�
-- (��, ������ �Ҽ��� 1�ڸ������� �ݿø��Ͽ� ǥ��) 
SELECT SUBSTR(TERM_NO,1,4) �⵵, SUBSTR(TERM_NO,5,2) �б�, ROUND(AVG(POINT), 1) ����
FROM TB_GRADE
WHERE STUDENT_NO = 'A112113'
GROUP BY ROLLUP(SUBSTR(TERM_NO,1,4), SUBSTR(TERM_NO,5,2))
ORDER BY SUBSTR(TERM_NO,1,4);


-- SELECT - OPTION
-- 1. �л��̸��� �ּ����� ǥ���϶�. ��, ��� ����� "�л� �̸�", "�ּ���"�� �ϰ�, ������ �̸����� �������� ǥ���϶�
SELECT STUDENT_NAME "�л� �̸�", STUDENT_ADDRESS "�ּ���"
FROM TB_STUDENT ORDER BY "�л� �̸�";

-- 2. �������� �л����� �̸��� �ֹι�ȣ�� ���̰� ���� ������ ȭ�鿡 ����϶�
SELECT STUDENT_NAME, STUDENT_SSN
FROM TB_STUDENT
WHERE ABSENCE_YN = 'Y'
ORDER BY SUBSTR(STUDENT_SSN, 1, 6) DESC;


-- 3. �ּ����� �������� ��⵵�� �л��� �� 1990��� �й��� ���� �л����� �̸��� �й�, �ּҸ� �̸��� ������������ ȭ�鿡 ����϶�
--    ��, ���������� "�л��̸�", "�й�", "������ �ּ�"�� ��µǵ��� �Ѵ�
SELECT STUDENT_NAME �л��̸�, STUDENT_NO �й�, STUDENT_ADDRESS "������ �ּ�"
FROM TB_STUDENT
WHERE (STUDENT_ADDRESS LIKE '%������%' OR STUDENT_ADDRESS LIKE '%��⵵%') AND STUDENT_NO LIKE '9%'
ORDER BY STUDENT_NAME;

-- 4. ���� ���а� ���� �� ���� ���̰� ���� ������� �̸��� Ȯ�� �� �� �ִ� SQL ������ �ۼ��϶�
--    (���а��� '�а��ڵ�'�� �а� ���̺�(TB_DEPARTMENT)�� ��ȸ�ؼ� ã�Ƴ���)
SELECT PROFESSOR_NAME, PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO = (SELECT DEPARTMENT_NO
                       FROM TB_DEPARTMENT
                       WHERE DEPARTMENT_NAME LIKE '��%')
ORDER BY SUBSTR(PROFESSOR_SSN,1,6);

-- 5. 2004�� 2�б⿡ 'C3118100' ������ ������ �л����� ������ ��ȸ�Ϸ��� �Ѵ�. ������ ���� �л����� ǥ���ϰ�, ������ ������ �й��� ���� �л�����
--    ǥ���ϴ� ������ �ۼ��϶�
SELECT STUDENT_NO, POINT
FROM TB_GRADE
WHERE TERM_NO = 200402 AND CLASS_NO = 'C3118100'
ORDER BY POINT DESC, STUDENT_NO;

-- 6. �л� ��ȣ, �л� �̸�, �а� �̸��� �л� �̸����� �������� �����Ͽ� ����ϴ� SQL���� �ۼ��϶�
SELECT STUDENT_NO, STUDENT_NAME, DEPARTMENT_NAME
FROM TB_STUDENT
    JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
ORDER BY STUDENT_NAME;

-- 7. �� ������б��� ���� �̸��� ������ �а� �̸��� ����ϴ� SQL������ �ۼ��϶�
SELECT CLASS_NAME, DEPARTMENT_NAME
FROM TB_CLASS
    JOIN TB_DEPARTMENT USING (DEPARTMENT_NO);

-- 8. ���� ���� �̸��� ã������ �Ѵ�. ���� �̸��� ���� �̸��� ����ϴ� SQL���� �ۼ��϶�
SELECT CLASS_NAME, PROFESSOR_NAME
FROM TB_CLASS
    JOIN TB_CLASS_PROFESSOR USING(CLASS_NO)
    JOIN TB_PROFESSOR USING(PROFESSOR_NO);
    
-- 9. 8���� ��� �� '�ι���ȸ' �迭�� ���� ������ ���� �̸��� ã������ �Ѵ�. �̿� �ش��ϴ� ���� �̸��� ���� �̸��� ����ϴ� SQl���� �ۼ��϶�
SELECT CLASS_NAME, PROFESSOR_NAME
FROM TB_CLASS
    JOIN TB_CLASS_PROFESSOR USING(CLASS_NO)
    JOIN TB_PROFESSOR P USING(PROFESSOR_NO)
    JOIN TB_DEPARTMENT D ON(P.DEPARTMENT_NO = D.DEPARTMENT_NO)
WHERE CATEGORY = '�ι���ȸ';

-- 10. '�����а�' �л����� ������ ���Ϸ��� �Ѵ�. �����а� �л����� "�й�", '�л� �̸�", "��ü ����"�� ����ϴ� SQL ������ �ۼ��϶�.
--     (��, ������ �Ҽ��� 1�ڸ������� �ݿø��Ͽ� ǥ��)
SELECT STUDENT_NO �й�, STUDENT_NAME "�л� �̸�", ROUND(AVG(POINT), 1) "��ü ����"
FROM TB_STUDENT
    JOIN TB_GRADE USING (STUDENT_NO)
    JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
WHERE DEPARTMENT_NAME = '�����а�'
GROUP BY STUDENT_NO, STUDENT_NAME
ORDER BY STUDENT_NO;

-- 11. �й��� A313047�� �л��� �б��� ������ ���� �ʴ�. ���� �������� ������ �����ϱ� ���� �а� �̸�, �л� �̸��� ���� ���� �̸��� �ʿ��ϴ�.
--     �� �� ����� SQL���� �ۼ��϶�. ��, �������� "�а��̸�", "�л��̸�", "���������̸�"���� ��µǵ��� �Ѵ�
SELECT DEPARTMENT_NAME �а��̸�, STUDENT_NAME �л��̸�, PROFESSOR_NAME ���������̸�
FROM TB_DEPARTMENT
    JOIN TB_STUDENT USING (DEPARTMENT_NO)
    JOIN TB_PROFESSOR ON (COACH_PROFESSOR_NO = PROFESSOR_NO)
WHERE STUDENT_NO = 'A313047';

-- 12. 2007�⵵�� '�ΰ������' ������ ������ �л��� ã�� �л��̸��� �����б⸦ ǥ���ϴ� SQL������ �ۼ��϶�
SELECT STUDENT_NAME, TERM_NO
FROM TB_STUDENT
    JOIN TB_GRADE USING (STUDENT_NO)
    JOIN TB_CLASS USING (CLASS_NO)
WHERE CLASS_NAME = '�ΰ������' AND TERM_NO LIKE '2007%';

