-- Active: 1745889699154@@127.0.0.1@3306@test

-- 계정 생성
CREATE USER 'test'@'localhost' IDENTIFIED BY '123456';
grant all PRIVILEGES on *.* to 'test'@'localhost' with grant option;

-- 데이터베이스 생성
-- 식별자가 키워드(예약어) 와 같은 경우 `이름` 형태로 정의할 수 있다.
create database `test`;
DROP TABLE IF EXISTS `board`;
CREATE TABLE `board` (
  `no`          INT           AUTO_INCREMENT PRIMARY KEY         COMMENT '번호',
  `id`          VARCHAR(64)   UNIQUE                             COMMENT '아이디',
  `title`       VARCHAR(100)  NOT NULL                           COMMENT '제목',
  `writer`      VARCHAR(45)   NOT NULL                           COMMENT '작성자',
  `content`     TEXT          NULL                               COMMENT '내용',
  `created_at`  TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록일자',
  `updated_at`  TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '수정일자'
) COMMENT '게시판';
-- 데이터베이스에서는 대소문자 구분이 없어서 스네이크 케이스를 쓴다.

-- 데이터 추가
INSERT INTO board (no, id, title, writer, content, created_at, updated_at)
VALUES (1, UUID(), '제목01', '작성자01', '내용01', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- AUTO_INCREMENT, DEFAULT 적용된 컬럼은 생략하고 추가 가능
INSERT INTO board (id, title, writer, content)
VALUES (UUID(), '제목02', '작성자02', '내용02');

-- 모든 컬럼 생략 시, 모든 갑슬 다 지정해야 한다.
INSERT INTO board
VALUES (3, UUID(), '제목03', '작성자03', '내용03', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- 데이터 조회
SELECT * FROM board WHERE title = '제목03';

-- 정렬 (ORDER BY)
SELECT * FROM board
ORDER BY created_at DESC;

-- 데이터 수정
UPDATE board
SET title = '수정', writer = '수정', content = '수정', updated_at = CURRENT_TIMESTAMP
WHERE no = 1;

-- 데이터 삭제
DELETE FROM board
WHERE no = 1;

-- 테이블 수정
-- * 컬럼 추가
ALTER TABLE board ADD COLUMN `views` INT NOT NULL DEFAULT 0 COMMENT '조회수';
-- * 컬럼 삭제
ALTER TABLE board DROP COLUMN `views`;
-- * 테이블 구조 확인
DESC board;

select * from board;

-- 테이블 내부 데이터 전체삭제
-- * 되돌리기 불가
TRUNCATE TABLE board;

-- TCL 실습
START TRANSACTION;

-- 게시글 데이터 추가 - 제목001
INSERT INTO board (id, title, writer, content) VALUES (UUID(), '제목001', '작성자001', '내용001');
INSERT INTO board (id, title, writer, content) VALUES (UUID(), '제목001', '작성자001', '내용001');
-- * ROLLBACK : 트랜잭션 수행 변경사항 취소
ROLLBACK;

START TRANSACTION;
INSERT INTO board (id, title, writer, content) VALUES (UUID(), '제목002', '작성자002', '내용002');
-- * COMMIT : 트랜잭션 수행 변경사항 적용
COMMIT;

ALTER TABLE test.board AUTO_INCREMENT = 5;
commit;