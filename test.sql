-- Active: 1745889699154@@127.0.0.1@3306@employees
-- 1. 상사 정보 조회
SELECT *
FROM employees e
	JOIN dept_manager dm ON e.emp_no = dm.emp_no;

-- 2. 상사의 부하 조회
SELECT e.first_name
FROM employees e
	JOIN dept_manager de ON e.emp_no = de.emp_no
;


WITH emp_mgr AS (
		SELECT de.dept_no,
				e.emp_no, e.first_name, e.last_name, e.gender,
				m.emp_no mgr_emp_no,
				m.first_name mgr_first_name,
				m.last_name mgr_last_name,
				m.gender mgr_gender
		FROM dept_emp de
		JOIN employees e ON de.emp_no = e.emp_no
		JOIN dept_manager dm ON de.dept_no = dm.dept_no
		JOIN employees m ON dm.emp_no = m.emp_no
		WHERE de.from_date <= CURDATE() AND de.to_date >= CURDATE()
		AND dm.from_date <= CURDATE() AND dm.to_date >= CURDATE()
)
SELECT *
FROM emp_mgr
;

-- 입사 날짜별 사원 수 조회
WITH hire_count AS (
	SELECT hire_date, COUNT(*) AS emp_count
	FROM employees
	GROUP BY hire_date
	ORDER BY hire_date DESC
)
SELECT hire_date, emp_count
FROM hire_count
ORDER BY hire_date DESC;
