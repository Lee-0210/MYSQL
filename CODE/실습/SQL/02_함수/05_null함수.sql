-- Active: 1745889699154@@127.0.0.1@3306@aloha
SELECT name 이름, salary 급여, IFNULL(TRUNCATE(commission_pct, 1), 0) 커미션
      ,COALESCE(TRUNCATE((salary * commission_pct) + salary, 0), salary) AS '최종급여'
FROM employees
ORDER BY `최종급여` DESC;

-- NULLIF()
SELECT emp_no, salary, NULLIF(salary, 3300000)
FROM employees;

-- COALESCE()
-- 사원이 1년동안 받는 기본급 외의 수당을 출력하시오.
SELECT *, COALESCE((salary * commission_pct)*12 + IFNULL(bonus, 0), bonus, 0) AS "수당"
FROM employees;