-- Basic SELECT

-- 1.
SELECT	DEPARTMENT_NAME AS "�а� ��",
		CATEGORY AS �迭
FROM	TB_DEPARTMENT;

-- 2.
SELECT	DEPARTMENT_NAME || '�� ������ ' || CAPACITY || ' �� �Դϴ�.'
FROM	TB_DEPARTMENT;

-- 3.
SELECT	STUDENT_NAME
FROM	TB_STUDENT
WHERE	ABSENCE_YN = 'Y'
AND		DEPARTMENT_NO = '001'
AND		SUBSTR(STUDENT_SSN, 8, 1) = '2';

-- 4.
SELECT 	STUDENT_NAME
FROM	TB_STUDENT
WHERE	STUDENT_NO IN ('A513079', 'A513090', 'A513091', 'A513110', 'A513119');

-- 5.
SELECT	DEPARTMENT_NAME,
		CATEGORY
FROM	TB_DEPARTMENT
WHERE	CAPACITY BETWEEN 20 AND 30;

-- 6.
SELECT	PROFESSOR_NAME
FROM	TB_PROFESSOR
WHERE	DEPARTMENT_NO IS NULL;

-- 7.
SELECT	STUDENT_NAME
FROM	TB_STUDENT
WHERE	DEPARTMENT_NO IS NULL;

-- 8.
SELECT	CLASS_NO
FROM	TB_CLASS
WHERE	PREATTENDING_CLASS_NO IS NOT NULL;

-- 9.
SELECT 	DISTINCT CATEGORY
FROM 	TB_DEPARTMENT;

-- 10.
SELECT	STUDENT_NO,
		STUDENT_NAME,
		STUDENT_SSN
FROM	TB_STUDENT
WHERE	STUDENT_ADDRESS LIKE '%����%'
AND		ABSENCE_YN != 'Y'
AND		SUBSTR(ENTRANCE_DATE, 1, 2) = '02';


-- Additional SELECT 

--1.
SELECT	STUDENT_NO �й�,
		STUDENT_NAME �̸�,
		ENTRANCE_DATE ���г⵵
FROM	TB_STUDENT
WHERE	DEPARTMENT_NO = '002'
ORDER BY ���г⵵;

--2.
SELECT	PROFESSOR_NAME,
		PROFESSOR_SSN
FROM	TB_PROFESSOR
WHERE	LENGTH(PROFESSOR_NAME) != 3;

--3.
SELECT	PROFESSOR_NAME �����̸�,
		TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) - 
		TO_NUMBER('19'||(SUBSTR(PROFESSOR_SSN, 1, 2))) AS ����
FROM	TB_PROFESSOR
WHERE	SUBSTR(PROFESSOR_SSN, 8, 1) = 1
ORDER BY ����;

--4.
SELECT	SUBSTR(PROFESSOR_NAME, 2) �̸�
FROM	TB_PROFESSOR;

--5. 
SELECT	STUDENT_NO,
		STUDENT_NAME
FROM	TB_STUDENT
WHERE	TO_NUMBER(TO_CHAR(ENTRANCE_DATE,'YYYY')) - 
		TO_NUMBER(TO_CHAR(TO_DATE(SUBSTR(STUDENT_SSN, 1, 2), 'RR'), 'RRRR')) = 20;

--6. 
SELECT	TO_CHAR(TO_DATE('2020/12/25', 'YYYY/MM/DD'), 'DAY') AS ����
FROM 	DUAL;

--7.
SELECT	TO_DATE('99/10/11', 'YY/MM/DD'),
		TO_DATE('49/10/11', 'YY/MM/DD'),
		TO_DATE('99/10/11', 'RR/MM/DD'),
		TO_DATE('49/10/11', 'RR/MM/DD')
FROM 	DUAL;

--8.
SELECT	STUDENT_NO,
		STUDENT_NAME
FROM	TB_STUDENT
WHERE	SUBSTR(STUDENT_NO, 1, 1) != 'A';

--9.
SELECT	ROUND(AVG(POINT), 1) AS ����
FROM	TB_GRADE
WHERE	STUDENT_NO = 'A517178';

--10.
SELECT	DEPARTMENT_NO AS �а���ȣ,
		COUNT(STUDENT_NO) AS "�л���(��)"
FROM	TB_STUDENT
GROUP BY DEPARTMENT_NO
ORDER BY DEPARTMENT_NO;

--11.
SELECT 	COUNT(*)
FROM	TB_STUDENT
WHERE	COACH_PROFESSOR_NO IS NULL;

-----------------------------------------

--12.
SELECT	SUBSTR(TERM_NO,1,4) AS �⵵,
		ROUND(AVG(POINT), 1)  AS "�⵵ �� ����"
FROM	TB_GRADE
WHERE	STUDENT_NO = 'A112113'
GROUP BY SUBSTR(TERM_NO,1,4);


--13. ******
-- COUNT �Լ��� ���� NULL�� ��� ī��Ʈ���� ���Ѵ�.
-- SUM(CASE WHEN ABSENCE_YN = 'Y' THEN 1 ELSE 0 END) AS "���л� ��"
SELECT	DEPARTMENT_NO AS �а��ڵ��,
		SUM(DECODE(ABSENCE_YN, 'Y', 1, 0)) AS "���л� ��"
FROM	TB_STUDENT
GROUP BY DEPARTMENT_NO
ORDER BY 1;

--14. 
SELECT	STUDENT_NAME AS �����̸�,
		COUNT(STUDENT_NAME) AS "������ ��"
FROM	TB_STUDENT
GROUP BY STUDENT_NAME
HAVING	COUNT(STUDENT_NAME) > 1;


--15. ROLL UP ��. GROUP BY(�⵵, �б�)
SELECT	SUBSTR(TERM_NO, 1, 4) AS �⵵,
		SUBSTR(TERM_NO, 5, 2) AS �б�,
		ROUND(AVG(POINT) ,1) AS ����
FROM	TB_GRADE
WHERE	STUDENT_NO = 'A112113'
GROUP BY ROLLUP(SUBSTR(TERM_NO, 1, 4), SUBSTR(TERM_NO, 5, 2));