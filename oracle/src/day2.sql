-- LENGTH 함수
SELECT	LENGTH(CHARTYPE),
		LENGTH(VARCHARTYPE)
FROM	COLUMN_LENGTH;

-- INSTR 함수 : return값 number(찾으려하는 데이터값의 index) *
SELECT	EMAIL,
		INSTR(EMAIL, 'c', -1, 2)
FROM	EMPLOYEE;

SELECT 	EMAIL,
		INSTR(EMAIL, 'c', INSTR(EMAIL, '.')-1)
FROM	EMPLOYEE;


-- LPAD / RPAD 함수 (PADDING) : 컬럼에 임의의 문자를 남아있는 공간에 (왼/오) 덧붙여서 출력 * 주로 정렬할 때 사용, RETURN CHARACTER
SELECT 	EMAIL AS 원본데이터,
		LENGTH(EMAIL) AS 원본길이,
		LPAD(EMAIL, 20, '.') AS 적용결과,
		LENGTH(LPAD(EMAIL, 20, '.')) AS 결과길이
FROM	EMPLOYEE;

SELECT	EMAIL AS 원본데이터,
		LENGTH(EMAIL) AS 원본길이,
		RPAD(EMAIL, 20, '.') AS 적용결과,
		LENGTH(RPAD(EMAIL, 20, '.')) AS 결과길이
FROM	EMPLOYEE;

-- LTRIM / RTRIM 함수 ** 제거하려는 문자는 패턴이 아닌 *or*의 개념 
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

-- TRIM 함수 * LTRIM/RTRIM 과의 차이 : 지우려고 하는 문자의 길이는 1밖에 안됨
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


-- SUBSTR 함수 **INDEX시작번호 1, 가져올 문자 개수는 INDEX 포함해서
SELECT	HIRE_DATE,
		SUBSTR(HIRE_DATE, 1,2)||'년 '||
		SUBSTR(HIRE_DATE, 4,2)||'월 '||
		SUBSTR(HIRE_DATE, 7,2)||'일' 입사일
FROM	EMPLOYEE;


-- *주의, -1는 뒤에서부터 시작, 가져올 문자는 오른쪽 방향으로
SELECT	SUBSTR('TechOnTheNet', -3, 3)
FROM	DUAL;


-- ROUND 함수 CF. TRUC 함수
SELECT	ROUND(-123.257, 2)
FROM	DUAL;


-- ADD_MONTHS 함수 / SYSDATE 함수
SELECT	EMP_NAME 사원명,
		HIRE_DATE 입사일,
		ADD_MONTHS(HIRE_DATE, 240) "20년 후" 
FROM	EMPLOYEE;		


-- MONTHS_BETWEEN 함수
SELECT	EMP_NAME, HIRE_DATE
FROM	EMPLOYEE
WHERE	MONTHS_BETWEEN(SYSDATE, HIRE_DATE) > 180

SELECT	EMP_NAME, 
		HIRE_DATE,
		TRUNC(MONTHS_BETWEEN(SYSDATE, HIRE_DATE) / 12) 근속년수
FROM	EMPLOYEE
WHERE	MONTHS_BETWEEN(SYSDATE, HIRE_DATE) > 180


SELECT 	*
FROM 	EMPLOYEE	
WHERE	SUBSTR(HIRE_DATE, 4,2) = '01';


-- TO_CHAR 함수(DATA : NUMBER) (명시적 형변환) / 9 : 자릿수, 0 : 남는 자릿수, $ OR L : 통화기호, . OR , : 지정 위치에 해당점 표시 
-- 숫자 -> 문자
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

-- TO_CHAR 함수(DATA: DATE) / 날짜 -> 문자
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

-- TO_DATE 함수 / 인자 : (문자열(날짜형식으로 변환 가능한 숫자의 문자열), 패턴(앞에 나온 문자열의 형식과 일치해야함)) / 문자열 -> 날짜
SELECT	TO_DATE( '20100101', 'YYYYMMDD')
FROM	DUAL;

-- 오류
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


-- RR / YY 구분 (세기 문제)
SELECT	SYSDATE AS 현재,
		'95/10/27' AS 입력,
		TO_CHAR(TO_DATE('95/10/27', 'YY/MM/DD'), 'YYYY/MM/DD') YY형식1,
		TO_CHAR(TO_DATE('95/10/27', 'YY/MM/DD'), 'RRRR/MM/DD') YY형식2,
		TO_CHAR(TO_DATE('95/10/27', 'RR/MM/DD'), 'YYYY/MM/DD') RR형식1,
		TO_CHAR(TO_DATE('95/10/27', 'RR/MM/DD'), 'RRRR/MM/DD') RR형식2
FROM	DUAL;


-- TO_NUMBER 함수 (CHAR -> NUMBER)
SELECT	EMP_NAME, EMP_NO,
		SUBSTR(EMP_NO, 1, 6) AS 앞부분,
		SUBSTR(EMP_NO, 8) AS 뒷부분,
		TO_NUMBER(SUBSTR(EMP_NO, 1, 6)) + TO_NUMBER(SUBSTR(EMP_NO, 8)) AS 결과
FROM	EMPLOYEE
WHERE	SUBSTR(EMP_NO, 8, 1) = '1';


-- NVL 함수 (데이터 값이 NULL인 경우) 
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


-- DECODE 함수 (ORACLE 전용) - IF-ELSE의 논리적제한(표현식, 조건(IF), 결과, (IF ELSE)... , (ELSE)디폴트값)
SELECT	EMP_NAME,
		DECODE(SUBSTR(EMP_NO, 8, 1), '1', '남', '2', '여', '3', '남', '4', '여') AS 성별
FROM	EMPLOYEE
WHERE	DEPT_ID = '50';

SELECT	EMP_NAME,
		DECODE(SUBSTR(EMP_NO, 8, 1), '1', '남', '3', '남', '여') AS 성별
FROM	EMPLOYEE
WHERE 	DEPT_ID = '50';

SELECT	*
FROM	EMPLOYEE;

-- MGR_ID가 있으면 사원, 없으면 임원으로
SELECT	EMP_NAME AS 이름,
		DECODE(MGR_ID, NULL, '임원', '사원') AS 구분
FROM	EMPLOYEE;

SELECT	EMP_NAME AS 이름,
		SALARY AS 급여,
		JOB_ID AS 직급,
		DECODE(JOB_ID, 'J7', (SALARY)+(SALARY*0.1), 
		'J6',(SALARY)+(SALARY*0.15), 
		'J5', (SALARY)+(SALARY*0.2), 
		SALARY) AS 인상급여
FROM	EMPLOYEE;

-- CASE - WHEN - THEN - ELSE - END
SELECT	EMP_NAME AS 이름,
		SALARY AS 급여,
		JOB_ID AS 직급,
		CASE JOB_ID 
		WHEN 'J7' THEN (SALARY*1.1)
		WHEN 'J6' THEN (SALARY*1.15)
		WHEN 'J5' THEN (SALARY*1.2)
		ELSE SALARY 
		END 
		AS 인상급여
FROM	EMPLOYEE;


-- CASE WHEN 활용(CASE WHEN 조건, THEN 결과, ELSE, END) 
SELECT	EMP_ID 아이디,
		EMP_NAME 이름,
		SALARY 급여,
		CASE WHEN (SALARY <= 3000000) THEN '초급'
		WHEN (SALARY <= 4000000) THEN '중급'
		ELSE '고급'
		END
		AS 급여등급
FROM	EMPLOYEE;


-- 중첩 함수 활용
SELECT	EMP_NAME 이름,
		EMAIL 이메일,
		SUBSTR(EMAIL, 1, INSTR(EMAIL, '@') - 1) AS 아이디
FROM 	EMPLOYEE;


