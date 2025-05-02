-- 게시판 테이블
DROP TABLE IF EXISTS board;

CREATE Table board (
  no INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(100) NOT NULL
);

DROP TABLE reply;

CREATE Table reply (
  no INT AUTO_INCREMENT PRIMARY KEY,
  board_no INT,
  content TEXT,
  Foreign Key (board_no) REFERENCES board(no)
  ON UPDATE RESTRICT
  ON DELETE RESTRICT
);

INSERT INTO board (title)
VALUES
    ('제목1'),
    ('제목2'),
    ('제목3'),
    ('제목4'),
    ('제목5');

--
INSERT INTO reply (board_no, content)
  VALUES
    (1, '댓글내용'),
    (1, '댓글내용'),
    (1, '댓글내용')


SELECT * FROM board;
SELECT * FROM reply;

UPDATE board
SET no = 10
WHERE no = 1;

DELETE FROM board
WHERE no = 1;


