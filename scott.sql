-- scott

--SELECT (데이터 조회)
-- e : 별칭 (임의 지정 가능)
-- * : 전체 필드(컬럼)를 의미함
SELECT * FROM EMP e;
-- 특정 컬럼에 해당하는 내용보기도 가능
SELECT EMPNO, ENAME, JOB FROM EMP;

-- emp 테이블
-- empno(tkdnjsqjsgh), ename(사원명), job(직책), mgr(매니저번호), hiredate(고용일), 
-- sal(급여), comm(보너스)
-- deptno(부서번호)

-- emp 테이블에서 사원번호, 매니저번호, 부서번호만 조회 



SELECT
	empno,
	mgr,
	deptno
FROM
	emp;


	
--emp 테이블에서 부서 번호만(중복 데이터는 제거)하고 조회 하고 싶다

SELECT DISTINCT  deptno 
FROM EMP e ;
SELECT 
     empno AS 사원번호,
     mgr 매니저번호,
     deptno as "부서 번호"
     FROM EMP e;
 
    
   
   SELECT job AS 직장위치
   FROM
   EMP e 
   
   
   --연봉 계산
   --월급 * 12 + 수당
   --sal * 12 + com
   
   SELECT empno,SAL * 12 + COMM AS "연봉"
   FROM emp e;
  
  
  
SELECT * FROM emp;
   
  --정렬
-- order by 정렬기준 컬럼명 DESC or ASC
--DESC ( 내림차순) , ASC (오름차순)
ORDER BY SAL DESC;


--emp 테이블에서  empno, ename, sal 조회 (단, empno 내림차순)

SELECT  empno, ename, sal
FROM
EMP
ORDER BY sal DESC;

--전체 조회 부서번호, 오름차순, sal 내림차순


SELECT  * 
FROM EMP e 
ORDER BY EMPNO DESC, sal ASC;

--조건
--부서번호가 30번인 사원 조회
--sal > 1000 이상인 사원 조회

SELECT  *
FROM  EMP e 
WHERE  DEPTNO = 30;

SELECT  *
FROM  EMP e 
WHERE  sal >= 1000;

--위에 나온 데이터를 내림차순으로 정리하고 싶을떄

SELECT  *
FROM  EMP e 
WHERE  sal >= 1000
ORDER BY sal DESC;


--empno 가 7782인 사람 조회


SELECT  *
FROM  EMP e 
WHERE EMPNO =7782;

--edptno 가 30번이고 job salesman 인 사원을 조회해보아라

SELECT  *
FROM  EMP e 
WHERE DEPTNO =30 AND JOB ='SALESMAN';


--사원번호가 7499이고 부서번호가 30인 사원 조회

SELECT  *
FROM  EMP e 
WHERE DEPTNO =30 AND EMPNO = 7499;

--부서번호가 30 이거나 job 이 SALESMAN 인 사원 조회

SELECT  *
FROM EMP e 
WHERE  DEPTNO = 30 OR JOB ='SALESMAN';

-- 연봉이 36000인 사원을 조회
SELECT  * 
FROM EMP e 
WHERE SAL*12 +COMM =36000;

--알파벳 순서로 F 다음에 있는 
SELECT  * 
FROM EMP e
WHERE ENAME >= 'F'; 


--SAL 이 3000이 아닌 사원 조회

SELECT  * 
FROM EMP e
WHERE SAL <> 3000;

-- ~이 아닌 : !=,<>,^= 을 사용한다

JOB이 MANAGER', 'SALESMAN', 'CLERK' 인 사람을 뽑고 싶다

SELECT  * 
FROM EMP e
WHERE JOB IN ('MANAGER', 'SALESMAN', 'CLERK');


--JOB이  MANAGER', 'SALESMAN', 'CLERK'이지 않은 사람을 뽑고 싶다

SELECT  * 
FROM EMP e
WHERE JOB NOT IN(';NAGER'


-- HIREDATE 가 1981 10 31 이후에 고용된 사원 조회
--날짜 데이터 산술 연산 가능< 날짜 데이터 ''로 처리

SELECT  * 
FROM  EMP e 
WHERE HIREDATE >'1981 10 31';


--2017-01-01 ~ 2017-12-31 사이에 고용된 사원들의 LAST_NAME,EMPLOYEE_ID, HIRE.DATE 조회
--HIRE_DATE 내림차순 정렬
SELECT LAST_NAME, EM
FROM  EMP e 
WHERE HIREDATE <'2017 01 01 > 2017 12 31' 



--BETWEEN A AND B
--SAL 이 2000이상 3000이하인 사원 조회

SELECT *
FROM EMP e 
WHERE SAL >=2000 AND SAL <=3000;

SELECT *
FROM EMP e 
WHERE SAL NOT BETWEEN 2000 AND 3000;












   
   
   
   