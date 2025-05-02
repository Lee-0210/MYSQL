-- Active: 1745889699154@@127.0.0.1@3306@test_db
-- 데이터베이스 생성
CREATE DATABASE test_db;

-- 데이터베이스 사용
USE test_db;

-- 데이터베이스 변경
ALTER DATABASE test_db
CHARACTER SET utf8mp4
COLLATE = utf8mp4_unicode_ci
;

-- 데이터베이스 삭제
DROP DATABASE test_db;
