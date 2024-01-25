-- employees 테이블에서 전체 내용 조회
SELECT  *
FROM EMPLOYEES e ;

-- first_name, last_name, job_id 조회
SELECT first_name, last_name, job_id
FROM EMPLOYEES e ;



--사원 번호가 176인 사람의 LAST_NAME 과 DEPARTMENT_ID 조회

SELECT * 

FROM EMPLOYEES e 

--연봉이 12000 이상 되는 직원들의  LAST_NAME 과  SALARY 조회

--연봉이 5000에서  12000의 범위 이외인 사람들의 lAST NAME과 SALARY 조회


--2017-01-01 ~ 2017-12-31 사이에 고용된 사원들의 LAST_NAME,EMPLOYEE_ID, HIRE.DATE 조회
--HIRE_DATE 내림차순 정렬
SELECT  LAST_NAME, EMPLOYEE_ID,HIRE_DATE
FROM EMPLOYEES e 
WHERE HIRE_DATE >= '2017-01-01'AND HIRE_DATE <='2017-12-31'

SELECT  LAST_NAME, EMPLOYEE_ID,HIRE_DATE
FROM EMPLOYEES e 
WHERE HIRE_DATE BETWEEN '2017-01-01'AND '2017-12-31';
ORDER BY HIRE_DATE ASC;


SELECT  LAST_NAME, EMPLOYEE_ID,HIRE_DATE
FROM EMPLOYEES e 
WHERE HIRE_DATE BETWEEN '2017-01-01'AND '2017-12-31'

--부서번호가 20,50 부서에서 근무하고 연봉이 5000~12000 사이인 사원들의 LAST_NAME, SALARY 조회
--SALARY 오름차순 정렬


SELECT LAST_NAME, SALARY
FROM EMPLOYEES e 
WHERE 


--FIRST_NAME 이  'curtis' 인 사원의  first_NAME, LAST_NAME, EAILL,PHON_NUMBER,JOB _ID 를 
--조회한다 .단 JOB_ID 는 소문자로 출력 된다

SELECT  FIRST_NAME,LAST_NAME,EMAIL ,PHONE_NUMBER ,LOWER(JOB_ID)
FROM EMPLOYEES e 
WHERE FIRST_NAME ='Curtis';

--부서 번호가 60 70 80 90 인 사원들의 employee_id, first_name,hire_date , job_id 조회

SELECT employee_id,first_name,hire_date,REPLACE (job_id,'IT_PROG','프로그래머')
FROM EMPLOYEES e 
WHERE DEPARTMENT_ID in(60,70,80,90);



SELECT  LAST_NAME 
FROM EMPLOYEES e 
WHERE LAST_NAME LIKE '%u%';

SELECT  LAST_NAME
FROM EMPLOYEES e 
WHERE LAST_NAME LIKE '%a%' OR LAST_NAME LIKE '%e%'
ORDER BY LAST_NAME DESC;


SELECT *
FROM EMPLOYEES e;


SELECT
	LAST_NAME,
	SALARY ,
	DEPARTMENT_ID,
	CASE  TRUNC(SALARY/2000,0)
	WHEN 0 THEN '0%'
	WHEN 1 THEN '9%'
	WHEN 2 THEN '20%'
	WHEN 3 THEN '30%'
	WHEN 4 THEN '40%'
	WHEN 5 THEN '42%'
	WHEN 6 THEN '44%'
	ELSE '45%'
	END AS TAX_RATE
	FROM EMPLOYEES e
WHERE DEPARTMENT_ID = 80;
	
	
WHERE 
	
	
	
SUM(),AVG(),COUNT(),MAX(),MIN()
--다중 행 함수


SELECT  SUM(SALARY)
FROM EMPLOYEES e); 





--
	 
FROM
	EMPLOYEES e;


--최대 연봉-최소연봉 차이 조회




SELECT ,MAX(SALARY) - MIN(SALARY) AS GAP

FROM EMPLOYEES e;



SELECT COUNT(DISTINCT MANAGER_ID)
FROM EMPLOYEES e;





--부서별 급여 합계 구하기

SELECT SUM(SALARY) 
FROM EMPLOYEES e 







-- 부서별 직원 수 구하기 (부서번호의 오름차순 출력)

SELECT DEPARTMENT_ID,COUNT(*) 
FROM EMPLOYEES e 
GROUP BY DEPARTMENT_ID



--부서별 평균 급여(부서번호 나오게 평균 연봉 나오게 오름차순)

SELECT DEPARTMENT_ID,TRUNC(AVG(SALARY) ) 
FROM EMPLOYEES e 
GROUP BY DEPARTMENT_ID
ORDER BY DE

--동일한 직무를 가진 사원들의 총 수 조회

SELECT JOB_ID ,COUNT(*)
FROM EMPLOYEES e 
GROUP BY JOB_ID;




 --매니저가 관리하는 사원들 중에서 최소급여 조회
--매니저 관리하는 사원들중에서  최소 급여가 6000 미만인 최소급여는 제외

--매니저가 없는 사원 제외


SELECT MIN(SALARY),MANAGER_ID  
FROM EMPLOYEES e 
WHERE MANAGER_ID IS NOT NULL 
GROUP BY MANAGER_ID HAVING MIN(SALARY)  >= 6000
ORDER BY MANAGER_ID;


SELECT 


--JOIN: 여러 테이블을 하나의 테이블처럼 사용 하기 위해서 조인을 사용

--EMP 와  DEPT  조인

SELECT *
FROM EMP



--매니저 관리하는 사원들중에서  최소 급여가 6000 미만인 최소급여는 제외


--매니저가 없는 사원 제외



---- 자신의 담당 매니저의 고용일보다 빠른 입사자 찾기


SELECT
	E.EMPLOYEE_ID AS "내 사원번호",
	E.HIRE_DATE AS "내입사일",
	E.MANAGER_ID AS "매니저 번호",
	E2.HIRE_DATE AS "매니저 입사일"
FROM EMPLOYEES e
JOIN EMPLOYEES e2 ON
	E.MANAGER_ID = E2.EMPLOYEE_ID
	AND E.HIRE_DATE < E2.HIRE_DATE ;
	
	











---- 도시 이름이 T로 시작하는 지역에 사는 사원들의 사번, LAST_NAME , 부서번호 조회

---- (도시명은 locations 테이블에) 

SELECT  E.EMPLOYEE_ID , E.LAST_NAME ,D.DEPARTMENT_ID, L.CITY 
FROM
	EMPLOYEES e
JOIN DEPARTMENTS d ON
	E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN LOCATIONS l ON
	D.LOCATION_ID = L.LOCATION_ID
	WHERE L.CITY LIKE 'T%';




--위치 아이디가 1700인 사원들의 LAST_NAME, 부서번호 , 연봉 조회


SELECT
	E.LAST_NAME ,
	D.DEPARTMENT_ID ,
	E.SALARY
FROM
	EMPLOYEES e
JOIN DEPARTMENTS d ON
	E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE
	LOCATION_ID = 1700;










-- 부서명, 위치 ID, 각 부서별 사원수 ,  각 부서별 평균 연봉 조회

--평균 연봉은 소수점 2자리 까지만 표현


SELECT
	D.DEPARTMENT_ID ,
	D.LOCATION_ID ,
	COUNT(E.EMPLOYEE_ID),
	ROUND(AVG(E.SALARY), 2)
FROM
	EMPLOYEES e
JOIN DEPARTMENTS d ON
	E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY
	D.DEPARTMENT_NAME ,
	D.LOCATION_ID
GROUP BY
	D.LOCATION_ID;







-- EXCUTIVE부서에 근무하는 사원들의 부서번호. LAST_NAME, JOB_ID 조회


SELECT
	d.DEPARTMENT_ID ,
	e.LAST_NAME ,
	e.JOB_ID
FROM
	EMPLOYEES e
JOIN DEPARTMENTS d ON
	e.DEPARTMENT_ID = d.DEPARTMENT_ID
	AND d.DEPARTMENT_NAME = 'EXCUTIVE';

SELECT
	DISTINCT e.department_id AS 부서번호,
	e.first_name || ' ' || e.last_name AS "내이름",
	e.salary AS 내 급여,
	e.hire_date AS 내 입사일
FROM
	EMPLOYEES e
JOIN EMPLOYEES e2 ON
	e.department_id = e2.DEPARTMENT_ID
	AND e.salary <e2.SALARY
	AND e.hire_date <e2.HIRE_DATE;










--각 부서별 소속 부서에서 자신보다 늦게 고용 되었으나 많은 연봉을 받는 사원이 존재하는  

-- 사원들의 이름 조회 이름은(FIRST_NAME 과  LAST_NAME 을 결합하여 하나로 나오게 하기

-- 부서번호, 결합된 이름,SALRAY ,HIRE_DATE 출력












