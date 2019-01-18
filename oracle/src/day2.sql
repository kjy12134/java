-- LENGTH �Լ�
SELECT	LENGTH(CHARTYPE),
		LENGTH(VARCHARTYPE)
FROM	COLUMN_LENGTH;

-- INSTR �Լ� : return�� number(ã�����ϴ� �����Ͱ��� index) *
SELECT	EMAIL,
		INSTR(EMAIL, 'c', -1, 2)
FROM	EMPLOYEE;

SELECT 	EMAIL,
		INSTR(EMAIL, 'c', INSTR(EMAIL, '.')-1)
FROM	EMPLOYEE;


-- LPAD / RPAD �Լ� (PADDING) : �÷��� ������ ���ڸ� �����ִ� ������ (��/��) ���ٿ��� ��� * �ַ� ������ �� ���, RETURN CHARACTER
SELECT 	EMAIL AS ����������,
		LENGTH(EMAIL) AS ��������,
		LPAD(EMAIL, 20, '.') AS ������,
		LENGTH(LPAD(EMAIL, 20, '.')) AS �������
FROM	EMPLOYEE;

SELECT	EMAIL AS ����������,
		LENGTH(EMAIL) AS ��������,
		RPAD(EMAIL, 20, '.') AS ������,
		LENGTH(RPAD(EMAIL, 20, '.')) AS �������
FROM	EMPLOYEE;

-- LTRIM / RTRIM �Լ� ** �����Ϸ��� ���ڴ� ������ �ƴ� *or*�� ���� 
SELECT	LTRIM('   tech')
FROM 	DUAL;

SELECT	LTRIM('   tech', ' ')
FROM 	DUAL;

SELECT	LTRIM('000123', '0')
FROM 	DUAL;

SELECT	LTRIM('123123Tech', '123')
FROM 	DUAL;

SELECT	LTRIM('123123Tech123', '123')
FROM 	DUAL;

SELECT	LTRIM('xyxzyyyTech', 'xyz')
FROM 	DUAL;

SELECT	LTRIM('6372Tech', '0123456789')
FROM 	DUAL;

-- TRIM �Լ� * LTRIM/RTRIM ���� ���� : ������� �ϴ� ������ ���̴� 1�ۿ� �ȵ�
SELECT	TRIM('  tech  ') 
FROM	DUAL;

SELECT	TRIM('a' FROM 'aatechaaa') 
FROM	DUAL;

SELECT	TRIM(LEADING '0' FROM '000123')
FROM	DUAL;

SELECT 	TRIM(TRAILING '1' FROM 'Tech1')
FROM	DUAL;

SELECT	TRIM(BOTH '1' FROM '123Tech111')
FROM	DUAL;

SELECT 	TRIM(LEADING FROM '  Tech  ')
FROM  	DUAL;


-- SUBSTR �Լ� **INDEX���۹�ȣ 1, ������ ���� ������ INDEX �����ؼ�
SELECT	HIRE_DATE,
		SUBSTR(HIRE_DATE, 1,2)||'�� '||
		SUBSTR(HIRE_DATE, 4,2)||'�� '||
		SUBSTR(HIRE_DATE, 7,2)||'��' �Ի���
FROM	EMPLOYEE;


-- *����, -1�� �ڿ������� ����, ������ ���ڴ� ������ ��������
SELECT	SUBSTR('TechOnTheNet', -3, 3)
FROM	DUAL;


-- ROUND �Լ� CF. TRUC �Լ�
SELECT	ROUND(-123.257, 2)
FROM	DUAL;


-- ADD_MONTHS �Լ� / SYSDATE �Լ�
SELECT	EMP_NAME �����,
		HIRE_DATE �Ի���,
		ADD_MONTHS(HIRE_DATE, 240) "20�� ��" 
FROM	EMPLOYEE;		


-- MONTHS_BETWEEN �Լ�
SELECT	EMP_NAME, HIRE_DATE
FROM	EMPLOYEE
WHERE	MONTHS_BETWEEN(SYSDATE, HIRE_DATE) > 180

SELECT	EMP_NAME, 
		HIRE_DATE,
		TRUNC(MONTHS_BETWEEN(SYSDATE, HIRE_DATE) / 12) �ټӳ��
FROM	EMPLOYEE
WHERE	MONTHS_BETWEEN(SYSDATE, HIRE_DATE) > 180


SELECT 	*
FROM 	EMPLOYEE	
WHERE	SUBSTR(HIRE_DATE, 4,2) = '01';


-- TO_CHAR �Լ�(DATA : NUMBER) (����� ����ȯ) / 9 : �ڸ���, 0 : ���� �ڸ���, $ OR L : ��ȭ��ȣ, . OR , : ���� ��ġ�� �ش��� ǥ�� 
-- ���� -> ����
SELECT	TO_CHAR(1234, '99999')
FROM	DUAL;

SELECT	TO_CHAR(1234, '09999')
FROM	DUAL;

SELECT	TO_CHAR(1234, 'L99999')
FROM	DUAL;

SELECT	TO_CHAR(1234, '99,999')
FROM	DUAL;

SELECT	TO_CHAR(1234, '09,999')
FROM	DUAL;

SELECT	TO_CHAR(1000, '9.9EEEE')
FROM	DUAL;

SELECT 	TO_CHAR(1234, '999')
FROM	DUAL;

-- TO_CHAR �Լ�(DATA: DATE) / ��¥ -> ����
SELECT 	TO_CHAR(SYSDATE, 'PM HH24:MI:SS')
FROM	DUAL;

SELECT 	TO_CHAR(SYSDATE, 'AM HH:MI:SS')
FROM 	DUAL;

SELECT 	TO_CHAR(SYSDATE, 'MON DY, YYYY')
FROM	DUAL;

SELECT	TO_CHAR(SYSDATE, 'YYYY-fmMM-DD DAY')
FROM 	DUAL;

SELECT	TO_CHAR(SYSDATE, 'YYYY-MM-fmDD DAY')
FROM	DUAL;

SELECT	TO_CHAR(SYSDATE, 'Year, Q')
FROM	DUAL;

-- TO_DATE �Լ� / ���� : (���ڿ�(��¥�������� ��ȯ ������ ������ ���ڿ�), ����(�տ� ���� ���ڿ��� ���İ� ��ġ�ؾ���)) / ���ڿ� -> ��¥
SELECT	TO_DATE( '20100101', 'YYYYMMDD')
FROM	DUAL;

-- ����
SELECT	TO_CHAR( '20100101', 'YYYY, MON')
FROM 	DUAL;

SELECT	TO_CHAR(TO_DATE('20100101', 'YYYYMMDD'), 'YYYY, MON')
FROM	DUAL;

SELECT	TO_DATE( '041030 143000', 'YYMMDD HH24MISS')
FROM	DUAL;

SELECT	TO_CHAR(TO_DATE( '041030 143000', 'YYMMDD HH24MISS'),
				'DD-MON-fmYY HH:MI:SS PM')
FROM	DUAL;

SELECT	TO_DATE( '980630', 'YYMMDD')
FROM	DUAL;

SELECT	TO_CHAR(TO_DATE('980630', 'YYMMDD'), 'YYYY.MM.DD')
FROM	DUAL;


-- RR / YY ���� (���� ����)
SELECT	SYSDATE AS ����,
		'95/10/27' AS �Է�,
		TO_CHAR(TO_DATE('95/10/27', 'YY/MM/DD'), 'YYYY/MM/DD') YY����1,
		TO_CHAR(TO_DATE('95/10/27', 'YY/MM/DD'), 'RRRR/MM/DD') YY����2,
		TO_CHAR(TO_DATE('95/10/27', 'RR/MM/DD'), 'YYYY/MM/DD') RR����1,
		TO_CHAR(TO_DATE('95/10/27', 'RR/MM/DD'), 'RRRR/MM/DD') RR����2
FROM	DUAL;


-- TO_NUMBER �Լ� (CHAR -> NUMBER)
SELECT	EMP_NAME, EMP_NO,
		SUBSTR(EMP_NO, 1, 6) AS �պκ�,
		SUBSTR(EMP_NO, 8) AS �޺κ�,
		TO_NUMBER(SUBSTR(EMP_NO, 1, 6)) + TO_NUMBER(SUBSTR(EMP_NO, 8)) AS ���
FROM	EMPLOYEE
WHERE	SUBSTR(EMP_NO, 8, 1) = '1';


-- NVL �Լ� (������ ���� NULL�� ���) 
SELECT	EMP_NAME, SALARY, NVL(BONUS_PCT, 0)
FROM	EMPLOYEE
WHERE	SALARY > 3500000;

SELECT	EMP_NAME, SALARY, BONUS_PCT
FROM	EMPLOYEE
WHERE	SALARY > 3500000;


SELECT	EMP_NAME,
		(SALARY*12) + ((SALARY*12)*NVL(BONUS_PCT,0))
FROM	EMPLOYEE
WHERE	SALARY > 3500000;


-- DECODE �Լ� (ORACLE ����) - IF-ELSE�� ��������(ǥ����, ����(IF), ���, (IF ELSE)... , (ELSE)����Ʈ��)
SELECT	EMP_NAME,
		DECODE(SUBSTR(EMP_NO, 8, 1), '1', '��', '2', '��', '3', '��', '4', '��') AS ����
FROM	EMPLOYEE
WHERE	DEPT_ID = '50';

SELECT	EMP_NAME,
		DECODE(SUBSTR(EMP_NO, 8, 1), '1', '��', '3', '��', '��') AS ����
FROM	EMPLOYEE
WHERE 	DEPT_ID = '50';

SELECT	*
FROM	EMPLOYEE;

-- MGR_ID�� ������ ���, ������ �ӿ�����
SELECT	EMP_NAME AS �̸�,
		DECODE(MGR_ID, NULL, '�ӿ�', '���') AS ����
FROM	EMPLOYEE;

SELECT	EMP_NAME AS �̸�,
		SALARY AS �޿�,
		JOB_ID AS ����,
		DECODE(JOB_ID, 'J7', (SALARY)+(SALARY*0.1), 
		'J6',(SALARY)+(SALARY*0.15), 
		'J5', (SALARY)+(SALARY*0.2), 
		SALARY) AS �λ�޿�
FROM	EMPLOYEE;

-- CASE - WHEN - THEN - ELSE - END
SELECT	EMP_NAME AS �̸�,
		SALARY AS �޿�,
		JOB_ID AS ����,
		CASE JOB_ID 
		WHEN 'J7' THEN (SALARY*1.1)
		WHEN 'J6' THEN (SALARY*1.15)
		WHEN 'J5' THEN (SALARY*1.2)
		ELSE SALARY 
		END 
		AS �λ�޿�
FROM	EMPLOYEE;


-- CASE WHEN Ȱ��(CASE WHEN ����, THEN ���, ELSE, END) 
SELECT	EMP_ID ���̵�,
		EMP_NAME �̸�,
		SALARY �޿�,
		CASE WHEN (SALARY <= 3000000) THEN '�ʱ�'
		WHEN (SALARY <= 4000000) THEN '�߱�'
		ELSE '���'
		END
		AS �޿����
FROM	EMPLOYEE;


-- ��ø �Լ� Ȱ��
SELECT	EMP_NAME �̸�,
		EMAIL �̸���,
		SUBSTR(EMAIL, 1, INSTR(EMAIL, '@') - 1) AS ���̵�
FROM 	EMPLOYEE;


