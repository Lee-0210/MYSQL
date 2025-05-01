-- NOW(), CURDATE(), CURTIME()
SELECT NOW() AS "현재 날짜시간"
      ,CURDATE() AS "현재 날짜"
      ,CURTIME() AS "현재 시간"
FROM dual;

-- 사원 테이블에서 입사일자로 부터 날짜, 연/월/일 을 추출하시오.
SELECT emp_no, first_name
      ,DATE(hire_date) AS '입사 일자'
      ,YEAR(hire_date) AS '연'
      ,LPAD(MONTH(hire_date), 2, 0) AS '월'
      ,DAY(hire_date) AS '일'
FROM employees;

-- 이번 달(4월)에 입사한 사원을 조회하시오.
SELECT *
FROM employees
WHERE MONTH(hire_date) = MONTH(NOW());

-- 이번 달(4월)에 생일인 사원을 조회하시오.
SELECT *
FROM employees
WHERE MONTH(birth_date) = MONTH(NOW());

-- 오늘로부터 5년 뒤는 몇년도인가요?
SELECT YEAR(DATE_ADD(NOW(), INTERVAL 5 YEAR)) AS "5년 후"
FROM dual;

-- 입사한지 30년이 넘은 사원을 조회하시오.
SELECT *
FROM employees
WHERE (YEAR(now()) - YEAR(hire_date)) >= 30;

-- TIMESTAMP 를 이용해서 30년 이상 근무한 사원을 조회하시오.
SELECT *
FROM employees
WHERE TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) >= 30;

-- 종강일로 부터 10일 남은 날을 구해보시오.
SELECT STR_TO_DATE('2025-09-17', '%Y-%m-%d')
FROM dual;

SELECT DATE_SUB(STR_TO_DATE('2025-09-17', '%Y-%m-%d'), INTERVAL 10 DAY) AS '종강일 10일 전'
FROM dual;

SELECT
  DATE_SUB(STR_TO_DATE('2025-09-17', '%Y-%m-%d'), INTERVAL 10 DAY) AS '종강일 10일 전'
  ,DATE_SUB(STR_TO_DATE('2025-09-17', '%Y-%m-%d'), INTERVAL 2 MONTH) AS '종강일 2달 전'
  ,DATE_SUB(STR_TO_DATE('2025-09-17', '%Y-%m-%d'), INTERVAL 1 YEAR) AS '종강일 1년 전'
FROM dual;

SELECT TIMESTAMPDIFF(YEAR, from_date, to_date) AS '부서 근속연수'
FROM dept_emp
WHERE YEAR(to_date) != 9999
ORDER BY TIMESTAMPDIFF(YEAR, from_date, to_date) DESC;

SELECT STR_TO_DATE('2025-01-01', '%Y-%m-%d') - STR_TO_DATE('2024-01-01', '%Y-%m-%d')
FROM dual;