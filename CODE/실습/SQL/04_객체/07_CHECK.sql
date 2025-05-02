-- CHECK 생성

CREATE TABLE products (
  no BIGINT auto_increment primary key,
  price INT NOT NULL CHECK(price >= 0),
  discount INT NOT NULL,
  CONSTRAINT check_discount CHECK (price >= discount)
);

INSERT INTO products(price, discount)
VALUES (-1000, 0);
INSERT INTO products(price, discount)
VALUES (10000, 20000);

INSERT INTO products(price, discount)
VALUES (20000, 10000);

SELECT DATABASE();
SELECT *
FROM information_schema.TABLE_CONSTRAINTS
WHERE TABLE_SCHEMA = DATABASE()
AND TABLE_NAME = 'products'
;

-- CHECK 제약 조건 삭제
ALTER TABLE PRODUCTS
DROP CONSTRAINT products_chk_1;
ALTER TABLE PRODUCTS
DROP CONSTRAINT check_discount;