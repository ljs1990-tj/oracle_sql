-- EMP
--1. ENAME 열에서 모든 이름을 소문자로 변경하여 출력해 보시오.
-- 문자 함수 관련 연습문제
SELECT LOWER(ENAME) 
FROM EMP;
--2. ENAME 열에서 'SMITH'를 찾고, 그 값을 'JOHN'으로 변경하여 출력해 보시오.
SELECT REPLACE(ENAME, 'SMITH', 'JOHN') 이름
FROM EMP
WHERE ENAME = 'SMITH';

--3. JOB 열에서 'SALESMAN'만 추출하고, 해당 컬럼(SALESMAN)의 길이를 구해 보시오.
SELECT E.*, LENGTH(JOB) AS 길이
FROM EMP E
WHERE JOB = 'SALESMAN';

--4. ENAME 열에서 이름의 첫 글자만 대문자로 변경하여 출력해 보시오.
SELECT SUBSTR(ENAME, 1, 1) || LOWER(SUBSTR(ENAME, 2, LENGTH(ENAME)-1))
FROM EMP;

--5. ENAME 열에서 이름의 마지막 3글자를 추출하여 출력해 보시오.
SELECT SUBSTR(ENAME, LENGTH(ENAME)-2, 3)
FROM EMP;

--6. JOB 열의 값 중 'MANAGER'로 시작하는 직책을 가진 사람들의 수를 구해 보시오.
SELECT COUNT(*)
FROM EMP
WHERE JOB = 'MANAGER';

--7. ENAME과 JOB 열을 합쳐서 'ENAME(JOB)' 형태로 출력해 보시오.
SELECT ENAME || '(' || JOB || ')'
FROM EMP;

--8. ENAME 열에서 'A'가 포함된 모든 사람의 이름을 추출해 보시오.
SELECT ENAME
FROM EMP
WHERE ENAME LIKE '%A%';

------------------------------------
--1. 모든 직원의 SAL 값에 10%를 추가한 값을 출력해 보시오.
SELECT SAL * 1.1
FROM EMP;

--2. SAL 값이 1500 이상인 직원들의 평균 급여를 구해 보시오.
SELECT AVG(SAL)
FROM EMP
WHERE SAL >= 1500;

--3. 각 부서(DEPTNO)별로 급여의 총합을 구해 보시오.
SELECT DEPTNO, SUM(SAL)
FROM EMP
GROUP BY DEPTNO;

--4. SAL 값이 1300 이상이면서 부서번호가 20인 직원들의 평균 급여를 구해 보시오.
SELECT AVG(SAL)
FROM EMP
WHERE SAL >= 1300 AND DEPTNO = 20;
--5. 각 부서별로 급여가 가장 높은 직원의 이름을 구해 보시오.
-- * 서브쿼리 배운 후 수정, + 조인
SELECT DEPTNO, MAX(SAL)
FROM EMP
GROUP BY DEPTNO;

SELECT ENAME, MAX_SAL 
FROM EMP E
INNER JOIN (
    SELECT DEPTNO, MAX(SAL) MAX_SAL
    FROM EMP
    GROUP BY DEPTNO
) E2 ON E.DEPTNO = E2.DEPTNO AND E.SAL = E2.MAX_SAL;

--6. 직원들의 급여를 오름차순으로 정렬하시오.
SELECT * 
FROM EMP
ORDER BY SAL ASC;

-----------------------------

--1. HIREDATE에서 직원이 입사한 년도를 추출하여 출력해 보시오.
SELECT ENAME, TO_CHAR(HIREDATE, 'YYYY')
FROM EMP;

--2. HIREDATE가 1981년 1월 1일 이후인 직원들의 이름을 출력해 보시오.
SELECT *
FROM EMP
WHERE HIREDATE >= TO_DATE('1981/01/01', 'YYYY/MM/DD');
-- WHERE HIREDATE >= '1981/01/01'
--3. 입사일이 1981년 5월 1일 이전인 직원들의 이름과 입사일을 출력해 보시오.
SELECT *
FROM EMP
WHERE HIREDATE < TO_DATE('1981/05/01', 'YYYY/MM/DD');





