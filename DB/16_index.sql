/* index */
SELECT * FROM tbl_menu;


CREATE TABLE phone(
  phone_code INT PRIMARY KEY,
  phone_name VARCHAR(100),
  phone_price DECIMAL(10,2)
);

INSERT
  INTO phone
VALUES
(1,'galaxyS24',1200000),
(2,'iphone14pro',1430000),
(3,'galaxyfold3',1730000);


SELECT * FROM phone;

-- where절을 활용한 단순 조회
SELECT * from phone WHERE phone_name ='galaxyS24';
EXPLAIN SELECT * FROM phone WHERE phone_name='galaxyS24';

-- phone_name에 INDEX 추가하기 
CREATE INDEX idx_name ON phone(phone_name);
SHOW INDEX FROM phone;

-- 다시 index가 추가된 컬럼으로 조회해서 index를 태웠는지 확인
SELECT * from phone WHERE phone_name ='galaxyS24';
EXPLAIN SELECT * FROM phone WHERE phone_name='galaxyS24';
