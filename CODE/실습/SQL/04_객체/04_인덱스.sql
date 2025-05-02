-- Active: 1745889699154@@127.0.0.1@3306@employees
-- INDEX 생성 전 성능 확인
SET PROFILING = 1;

-- 쿼리
SELECT *
FROM employees
WHERE last_name = 'Baba'
AND gender = 'M';

-- 프로파일 확인
SHOW PROFILE FOR QUERY 1;

SELECT NOW(6);
SELECT *
FROM employees
WHERE last_name = 'Baba'
AND gender = 'M';
SELECT NOW(6);

-- 인덱스 생성
CREATE INDEX index_lastname_gender ON employees(last_name, gender);

SELECT NOW(6);
SELECT * FROM employees WHERE last_name = 'Baba' AND gender = 'M';
SELECT NOW(6);

-- 인덱스 삭제
DROP INDEX index_lastname_gender ON employees;