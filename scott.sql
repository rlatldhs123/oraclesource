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

--사원 이름이 S로 시작하는 사원 조회


SELECT *
FROM EMP e 
WHERE  ENAME LIKE 'S%';

-- 사원 이름이 두번째 글자가 L 인 사원 조회

SELECT *
FROM EMP e 
WHERE  ENAME LIKE '_L%';

-- 사원 이름에 AM 문자가 포함된 사원 조회

SELECT *
FROM EMP e 
WHERE  ENAME NOT  LIKE '%AM%';

SELECT *
FROM  EMP e;

SELECT * FROM  EMP e  WHERE  COMM IS NULL ;


--mgr 이 null 인 사원 조회
--mgr 이 null 이 아닌  사원 조회


SELECT * FROM  EMP e  WHERE  MGR  IS NULL ;

SELECT * FROM  EMP e  WHERE  MGR  IS NOT  NULL ;

--집합연산자

--합집합 ( UNION,UNION ALL), 교집합(INTERSECT), 차집합(MINUS),

--부서번호가 10 혹인 20 사원 조회
-- OR 사용 해서 추출
--합집합으로도 가능

--SELECT EMPNO ,SAL ,DEPTNO 
--FROM EMP e 
--WHERE deptno = 10
--UNION
--SELECT deptno,sal,deptno
--FROM EMP e 
--WHERE deptno = 20;

SELECT EMPNO ,ENAME ,DEPTNO,SAL  
FROM EMP e 
WHERE deptno = 10
UNION
SELECT SAL ,JOB ,DEPTNO,SAL 
FROM EMP e 
WHERE deptno = 20;


열의 갯수랑 (셀렉트 문으로 찾으려는 갯수), 타입 ( 넘버타입이나 문자 타입 같은)
유니온으로 합집합을 할때 두 구문을 맞추면 오류 없이 작동
--결과 값의 중복 제거 (UNION)
SELECT EMPNO ,ENAME ,DEPTNO,SAL  
FROM EMP e 
WHERE deptno = 10
UNION
SELECT SAL ,JOB ,DEPTNO,SAL 
FROM EMP e 
WHERE deptno = 10;

--결과 값의 중복 제거 안함 (UNION ALL)

SELECT EMPNO ,ENAME ,DEPTNO,SAL  
FROM EMP e 
WHERE deptno = 10
UNION ALL 
SELECT SAL ,JOB ,DEPTNO,SAL 
FROM EMP e 
WHERE deptno = 10;

--차집합 (MINUS)

SELECT EMPNO ,ENAME ,DEPTNO,SAL

FROM EMP e 
MINUS
SELECT EMPNO ,ENAME ,DEPTNO,SAL
FROM EMP e 
WHERE DEPTNO = 10;


SELECT EMPNO ,ENAME ,DEPTNO,SAL

FROM EMP e 
INTERSECT
SELECT EMPNO ,ENAME ,DEPTNO,SAL
FROM EMP e 
WHERE DEPTNO = 10;

SELECT EMPNO ,ENAME ,DEPTNO,SAL 
FROM EMP e 
WHERE deptno = 10
UNION 
SELECT SAL ,JOB ,DEPTNO,SAL 
FROM EMP e 
WHERE deptno = 10;

--오라클 함수(내장 함수)

--함수는 사용하는 DBMS 에 따라 다르게 제공
--1. 문자 함수 
--대소문자 변경

SELECT *
FROM EMP e 
WHERE ENAME ='clark';

SELECT * ENAME ,UPPER(ENAME),LOWER(ENAME),INITCAP(ENAME)  
FROM EMP e ; 

SELECT *
FROM EMP e 
WHERE ENAME  =UPPER('clark'); 


SELECT *
FROM EMP e 
WHERE LOWER(ENAME)= 'clark';


-- 문자열 길이: LENGTH, LENGTHB

SELECT ENAME, LENGTH (ENAME)
FROM EMP e ;


SELECT LENGTH ('한글') FROM DUAL;

SELECT LENGTHB('한글')  FROM DUAL;

--직책 이름이 6글자 이상인 사원 조회



SELECT *
FROM EMP e 
WHERE LENGTH (JOB) >= 6;


--문자열 일부 추출 : SUBSTR(문자열 데이터, 시작 위치,추출 길이)


SELECT JOB,SUBSTR(JOB,-1,2),SUBSTR(JOB,-3,2),SUBSTR(JOB,-5)
FROM EMP e ;



SELECT ENAME,SUBSTR(ENAME,3) 
FROM EMP e ;


--INSTR ( 문자열 데이터,위치를 찾으려는 문자,시작위치,시작위치에서 몇번째 위치)



SELECT INSTR('HELLO,ORACLE!','L') AS INSTR_1, 
       INSTR('HELLO,ORACLE!','L',5) AS INSTR_2,
       INSTR('HELLO,ORACLE!','L',2,2) AS INSTR_3

FROM DUAL;


--사원 이름에  S 가 들어 있는 사원 조회
--LIKE 를 쓰지 않아도

SELECT *
FROM EMP e 
WHERE INSTR(ENAME,'S') > 0; 

--REPLACE : 특정 문자를 다른 문자로 변경
--           REPLACE(문자열 데이터,찾는문자,변경할 문자)


SELECT '010-1234-7896' AS REPALCE_BEFORE
       REPLACE ('010-1234-5678','-','')AS  REPALCE_BEFORE1,
        REPLACE ('010-1234-5678','-')AS  REPALCE_BEFORE2,
         REPLACE ('010-1234-5678','-','  ')AS  REPALCE_BEFORE3,
         FROM DUAL ;
       

      -- CONCAT 함수:두 문자열 데이터를 합하는 함수
        
        
        SELECT  CONCAT(EMPNO,ENAME)
        FROM EMP e 
        WHERE ENAME = 'SMITH';
       
         SELECT  CONCAT(EMPNO,CONCAT(':',ENAME))
        FROM EMP e 
        WHERE ENAME = 'SMITH';
       SELECT EMPNO ||':'|| ENAME
       FROM EMP e 
       WHERE ENAME ='SMITH';
      
      
      
      --TRIM 함수 공백 제거
      
      --'SMITH' = 'SMITH '  두 문자는 서로 다르다 공백도 문자이기 때문이다
       
      --TRIM(삭제옵션(선택), 삭제할 문자)
      
    SELECT  '[' || '__ORACLE__' || ']' AS TRIM BEFORE,
            '[' || TRIM('__ORALCE__') || ']' AS TRIM
            
            
  SELECT *
  FROM EMP e ;
 
 SELECT EMPNO ,ENAME ,DEPTNO,SAL
 FROM EMP e 
 UNION 
SELECT EMPNO ,ENAME ,DEPTNO,SAL
FROM EMP e 
WHERE DEPTNO =10;

SELECT DEPTNO ,ENAME ,HIREDATE ,LENGTH (DEPTNO),LENGTH(ENAME),LENGTH (HIREDATE)
FROM EMP e ;

-- 숫자 함수 숫자 데이터에 적용

--반올림,올림,버림,나머지값 구하기

SELECT ROUND(1234.5678) AS ROUND,
       ROUND(1234.5678,0) AS ROUND 1,
       ROUND(1234.5678,1) AS ROUND 2,
       ROUND(1234.5678,2) AS ROUND 3,
       ROUND(1234.5678,-1) AS ROUND MINUS -1,
       ROUND(1234.5678,-2) AS ROUND MINUS-2 

FROM DUAL;


SELECT  TRUNC(1234.5678) AS TRUNC,
        TRUNC(1234.5678,0) AS TRUNC,
        TRUNC(1234.5678,1) AS TRUNC2,
        TRUNC(1234.5678,2) AS TRUNC2,
        TRUNC(1234.5678,-1) AS TRUNC_MINUS1,
        TRUNC(1234.5678,-2) AS TRUNC_MINUS2
        
      
        FROM DUAL;
       
       
       SELECT CEIL (3.14),FLOOR(3.14),CEIL(3.14), FLOOR(-3.14)
       FROM DUAL ;
      
      --MOD 나머지 구하는 함수
      
      SELECT 11/5,MOD (15,5)
      FROM DUAL ;
      
     
     -- 오늘 날짜
     
   SELECT SYSDATE ,CURRENT_TIMESTAMP ,CURRENT_TIMESTAMP 
   FROM DUAL;
  
  
   SELECT SYSDATE ,SYSDATE +1,SYSDATE -1
   FROM DUAL;
  
    SELECT SYSDATE ,ADD_MONTHS(SYSDATE,3)
   FROM DUAL;
  
 SELECT EMPNO ,ENAME ,HIREDATE ,ADD_MONTHS(HIREDATE,360)
 
 FROM EMP e ;
 SELECT MONTHS_BETWEEN();
 
 
 
 
 
SELECT EMPNO,
ENAME ,
HIREDATE ,
SYSDATE,
      MONTHS_BETWEEN(SYSDATE ,HIREDATE), 
      MONTHS_BETWEEN( HIREDATE,SYSDATE) 
      
FROM EMP e ;


--NEXT_DAY, LAST_DAY

SELECT SYSDATE ,NEXT_DAY(SYSDATE,'월요일'),LAST_DAY(SYSDATE )
FROM DUAL;

NUMBER + 문자


SELECT EMPNO ,ENAME ,EMPNO + '500'
FROM EMP e 
WHERE ENAME ='FORD';


SELECT EMPNO ,ENAME ,EMPNO + 'ABCD'
FROM EMP e 
WHERE ENAME ='FORD';

--명시적 형변환 
-- TO_CHAR(), TO_NUMBER(),TO_DATE() 





SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD') ,SYSDATE ,TO_CHAR(SYSDATE,'YY/MM/DD/HH
/MI/SS AM') 
FROM DUAL ;



SELECT 1300-'1500','1300'+1500
FROM DUAL;

SELECT '1300'+'1500'
FROM DUAL;


SELECT TO_NUMBER('1,300','999,999')+TO_NUMBER('1,500','999,999') 
FROM DUAL;
 


SELECT TO_CHAR(SAL,'999,999.00') AS SALL,
       TO_CHAR(SAL,'000,999,999.00') AS SALL2
FROM EMP e ;




-----수치가 부적합 하다
SELECT '2024-01-24' - '2023-12-31'
FROM DUAL;


SELECT TO_DATE('2024-01-24') - TO_DATE('2023-12-31')
FROM DUAL;
  

-- NULL  처리 함수

-- NULL * 숫자 = NULL, NULL+ 숫자 =NULL

--NULL을 다른 값으로 변경 하는 함수가 있다


SELECT EMPNO,ENAME ,SAL ,COMM, SAL + COMM 
FROM EMP e ;
--NVL(널인지 검사할 열이름(OR 데이터),데체할 데이터)


SELECT EMPNO,ENAME ,SAL ,COMM, SAL + NVL(COMM ,0)
FROM EMP e ;


--NVL2(널인지 검사할 열이름(OR 데이터),NULL 이 아닌 경우 반환 데이터(계산식),NULL 인 경우 반환 데이터 (계산식))

SELECT EMPNO ,ENAME ,SAL,COMM,NVL2(COMM,'0','X')
FROM EMP e ;



  --COMM 이 널이면 연봉 =SAL * 12 , 널이 아니면 연봉= SAL  * 12+COMM

SELECT EMPNO ,ENAME ,SAL,COMM,NVL2(COMM,SAL * 12 +COMM ,SAL*12) AS 연봉
FROM EMP e ;



--JOB 이 MANGER 라면  SAL * 1.1 을 해서 인상 급여 구하기
--JOB 이 SAKESMAN 라면  SAL * 1.05 을 인상 급여 구하기
--JOB 이 ANALYST 라면  SAL  을 인상 급여 구하기
--나머지 직무들은 SAL * 1.03 을 인상 급여 구하기

--DECODE ( 검사대상, 조건1,조건1이 참이라면 반환할 결과[계산식],조건2,조건2가 참일경우 반환할 결과......., 조건1~조건N 까지 일치하지 않을 경우 반환할 결과)


SELECT EMPNO ,JOB,SAL,DECODE(JOB,'MANGER',SAL*1.1,'SALESMAN',SAL *1.05,'ANALYST',SAL * 1.03) AS UPSAL
FROM EMP e ;



SELECT EMPNO ,
JOB,
SAL,
CASE JOB WHEN 'MANAGER' THEN  SAL* 1.1
WHEN 'SALESMAN' THEN  SAL* 1.05
WHEN 'ANALYST' THEN  SAL
ELSE SAL * 1.03

END AS UPSAL2,
DECODE(JOB,'MANGER',SAL*1.1,'SALESMAN',SAL *1.05,'ANALYST',SAL * 1.03) AS UPSAL
FROM EMP e ;
  

--COMM 널일떄 해당 사항 없음 이라는 문자를 주고싶다
--COMM 0일떄 수당 없음 문자를 주고싶다
-- 0보다 크다면 수당:COMM  금액을 노출 시키고 싶다



SELECT 
EMPNO,
ENAME,
COMM,
CASE 
          WHEN IS NULL THEN '해당 사항 없음'
          WHEN COMM 0 = THEN '수당 없음'
          WHEN > 0 THEN '수당 : ' || COMM
         END AS COMM_TEXT
FROM EMP e  ;


  


SELECT
	EMPNO,
	ENAME,
	SAL ,
	TRUNC(SAL / 21.5, 3) AS DAY_PAY,
	ROUND (SAL / 8,
	2) AS TIME_PAY
FROM
	EMP e ;



SELECT
	HIREDATE ,
	SYSDATE ,
	EMPNO ,
	ENAME ,
	NEXT_DAY(ADD_MONTHS(HIREDATE,3),'월요일') AS R_JOB,
	NVL(TO_CHAR(COMM),'N/A') AS COMM
FROM
	EMP e;




   



 
  
  
  

            




    
  



      
       
       
       
       
       
 
        
       
       



























   
   
   
   