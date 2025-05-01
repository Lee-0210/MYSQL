USE aloha;

-- 부서가 없는 사원도 포함하여 조회하시오.
SELECT emp_no, name, d.dept_name
FROM employees e
  LEFT JOIN departments d
  ON e.dept_no = d.dept_no;

-- 사원이 없는 부서도 포함하여 조회하시오.
-- * FULL JOIN 은 MySQL 에서 직접 지원하지 않는다.
SELECT e.emp_no, e.name, d.dept_name
FROM employees e
  LEFT JOIN departments d
  ON e.dept_no = d.dept_no
UNION
SELECT e.emp_no, e.name, d.dept_name
FROM employees e
  RIGHT JOIN departments d
  ON e.dept_no = d.dept_no;
