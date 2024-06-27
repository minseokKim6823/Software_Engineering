-- type casting
-- 명시적 형변환

-- 1) 숫자 -> 숫자
SELECT CAST(AVG(menu_price) AS UNSIGNED INTEGER) AS '가격평균'
  FROM tbl_menu;
DESC tbl_menu;

-- 소수점 이하 한자리까지만 표기할 수도 있다.
SELECT cast(AVG(menu_price) AS FLOAT) AS '가격평균'
  FROM tbl_menu;
  
SELECT cast(AVG(menu_price) AS DOUBLE) AS '가격평균'
  FROM tbl_menu;
  
-- 2) 문자 -> 날짜
-- 2024년 6월 27일을 date형으로 변화
SELECT CAST('2024$6$27' AS DATE);
SELECT CAST('2024/6/27' as DATE);
SELECT CAST('2024#6#27' as DATE);

--  3) 숫자 -> ANSWK
SELECT CONCAT(CAST(1000 AS CHAR), '원');


-- 암시적 형변환
SELECT 1 + '2';  -- mariadb가 연산 시 치환하기 힘든 문자열은 0으로 치환하여 적용한다.
SELECT 5 > '반가워'; 