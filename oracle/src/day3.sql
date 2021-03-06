-- GROUP BY
SELECT	DECODE(SUBSTR(EMP_NO, 8, 1), '1', '남', '3', '남', '여') AS 성별,
		ROUND(AVG(SALARY), -4) AS 평균급여
FROM	EMPLOYEE
GROUP BY DECODE(SUBSTR(EMP_NO, 8, 1), '1', '남', '3', '남', '여')
ORDER BY 2;

-- GROUP BY ROLL UP
SELECT	DEPT_ID,
		SUM(SALARY),
		MAX(SALARY),
		MIN(SALARY),
		AVG(SALARY)
FROM	EMPLOYEE
WHERE	DEPT_ID IS NOT NULL
GROUP BY ROLLUP(DEPT_ID);

SELECT	DEPT_ID,
		JOB_ID,
		SUM(SALARY)
FROM	EMPLOYEE
WHERE	DEPT_ID IS NOT NULL
GROUP BY ROLLUP(DEPT_ID, JOB_ID)
ORDER BY 1, 2;

-- HAVING
SELECT	DEPT_ID,
		SUM(SALARY)
FROM	EMPLOYEE
GROUP BY DEPT_ID
HAVING	SUM(SALARY) > 9000000;

-- JOIN **
--USING
SELECT	EMP_NAME,
		DEPT_NAME
FROM	EMPLOYEE
JOIN	DEPARTMENT USING (DEPT_ID)
WHERE	JOB_ID = 'J6';

--ON
SELECT	DEPT_NAME,
		LOC_DESCRIBE
FROM	DEPARTMENT
JOIN	LOCATION ON	(LOC_ID = LOCATION_ID);

-- OUTER JOIN
-- (+)가 붙은 컬럼의 *반대* 테이블의 모든 데이터 불러옴
-- LEFT, RIGHT, FULL OUTER JOIN은 JOIN 키워드를 기준으로 왼/오/FULL 테이블의 전체 데이터를 불러온다.
SELECT	EMP_NAME, DEPT_NAME
FROM	EMPLOYEE
RIGHT	JOIN DEPARTMENT USING (DEPT_ID)
ORDER BY 1;

-- 사원의 이름과 SLEVEL
SELECT	EMP_NAME,
		SLEVEL
FROM	EMPLOYEE
JOIN	SAL_GRADE ON (SALARY BETWEEN LOWEST AND HIGHEST)

SELECT *
FROM EMPLOYEE

SELECT	E.EMP_NAME, M.EMP_NAME, S.EMP_NAME
FROM 	EMPLOYEE E
LEFT JOIN	EMPLOYEE M ON (E.MGR_ID = M.EMP_ID)
LEFT JOIN	EMPLOYEE S ON (M.MGR_ID = S.EMP_ID)


SELECT 	COUNTRY_NAME,
		SUM(SALARY)
FROM	EMPLOYEE
LEFT JOIN JOB USING (JOB_ID)
LEFT JOIN DEPARTMENT USING(DEPT_ID)
LEFT JOIN LOCATION ON (LOC_ID = LOCATION_ID)
LEFT JOIN COUNTRY USING(COUNTRY_ID)
LEFT JOIN SAL_GRADE ON (SALARY BETWEEN LOWEST AND HIGHEST)
GROUP BY COUNTRY_NAME
ORDER BY COUNTRY_NAME NULLS LAST;


-- 단일행 SUBQUERY
-- * SUBQUERY의 결과부터 확인한 후 메인쿼리에 적용
-- 승원이랑 같은 부서이면서 연봉 더 높은 사람 조회
SELECT	EMP_NAME,
		JOB_ID,
		SALARY
FROM	EMPLOYEE
WHERE	JOB_ID = (SELECT JOB_ID
				  FROM EMPLOYEE
				  WHERE EMP_NAME = '나승원')
AND
		SALARY > (SELECT SALARY
				  FROM EMPLOYEE
				  WHERE EMP_NAME = '나승원');

-- 부서별 급여총합, 그 급여총합이 가장 높은 부서 아이디, (이름) 조회
SELECT	DEPT_ID, SUM(SALARY)
FROM	DEPARTMENT
JOIN	EMPLOYEE USING(DEPT_ID)
GROUP BY DEPT_ID
HAVING SUM(SALARY) = (SELECT MAX(SUM(SALARY)) 
					  FROM EMPLOYEE
					  GROUP BY DEPT_ID);
					  
-- 전체 직원에 대해 관리자, 직원 구분
SELECT	EMP_ID,
		EMP_NAME,
		CASE
		WHEN EMP_ID IN (SELECT MGR_ID FROM EMPLOYEE)
		THEN '관리자'
		ELSE '직원'
		END AS 구분
FROM 	EMPLOYEE;

-- < ANY, ALL *****
SELECT	EMP_NAME,
		SALARY
FROM	EMPLOYEE
JOIN	JOB USING(JOB_ID)
WHERE	JOB_TITLE = '대리'
AND		SALARY > ANY
	(	SELECT	SALARY
		FROM	EMPLOYEE
		JOIN	JOB USING(JOB_ID)
		WHERE	JOB_TITLE = '과장'
	)

-- < ANY
SELECT	EMP_NAME,
		SALARY
FROM	EMPLOYEE
JOIN	JOB USING(JOB_ID)
WHERE	JOB_TITLE = '대리'
AND		SALARY < ANY
	(	SELECT	SALARY
		FROM	EMPLOYEE
		JOIN	JOB USING(JOB_ID)
		WHERE	JOB_TITLE = '과장'
	)
	
-- = ANY (IN과 동일)	
SELECT	EMP_NAME,
		SALARY
FROM	EMPLOYEE
JOIN	JOB USING(JOB_ID)
WHERE	JOB_TITLE = '대리'
AND		SALARY = ANY
	(	SELECT	SALARY
		FROM	EMPLOYEE
		JOIN	JOB USING(JOB_ID)
		WHERE	JOB_TITLE = '과장'
	)
	
	
-- 자기 직급의 평균 급여를 받는 직원을 조회하라.
-- 다중 열 처리
SELECT	EMP_NAME,
		JOB_TITLE,
		SALARY
FROM	EMPLOYEE
LEFT JOIN JOB USING (JOB_ID)
WHERE (JOB_ID, SALARY) IN 
	  (SELECT JOB_ID, TRUNC(AVG(SALARY),-5)
       FROM	EMPLOYEE
	   GROUP BY JOB_ID);