-- Active: 1745889699154@@127.0.0.1@3306@employees
-- CAST(값 AS 타입)
-- 문자열을 숫자로 변환
SELECT CAST('123' AS UNSIGNED INT) AS "숫자로 변환"
FROM dual;
SELECT CAST('123' AS UNSIGNED) AS "숫자로 변환"
FROM dual;
-- 날짜 문자열을 날자타입(DATE) 로 변환
SELECT CAST('2025-04-30' AS DATE) AS '날짜로 변환'
      ,CAST('2025-04-30 11:37:06' AS DATETIME) AS '날짜로 변환';
-- 숫자를 문자로 변환
SELECT CAST(123 AS CHAR) AS '문자로 변환';

-- CONVERT()
-- 문자열을 date 타입으로 변환
SELECT CONVERT('2025-05-01', DATE) AS "DATE 로 변환";
-- 숫자를 CHAR 로 변환
SELECT CONVERT(456, CHAR) AS '문자로 변환';

-- FORMAT()
-- 123456.789 를 소수점 아래 둘째 자리까지
SELECT FORMAT(123456.789, 2);
-- 123456.789 를 정수만 천단위 구분기호(,) 포함 출력
SELECT FORMAT(123456.789, 0) AS '포맷 숫자';

-- DATE_FORMAT()
-- 오늘 날짜를 2025년04월30일 12시00분00초 형식으로 출력하시오.
SELECT DATE_FORMAT(NOW(), '%Y년%m월%d일 %H시%i분%s초');
SELECT STR_TO_DATE('2025/04/30 12:00:00', '%Y/%m/%d %H:%i:%s');
SELECT STR_TO_DATE(hire_date, '%Y-%m-%d') FROM employees;
SELECT hire_date FROM employees;