-- Active: 1745889699154@@127.0.0.1@3306@employees
-- 사원번호, 이름, 부서명을 조회하시오.
SELECT e.emp_no 사원번호, first_name 이름, d.dept_no 부서번호, de.dept_name 부서명
FROM employees e
INNER JOIN dept_emp d
ON e.emp_no = d.emp_no
INNER JOIN departments de
ON d.dept_no = de.dept_no;


