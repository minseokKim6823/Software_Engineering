--  order by (정렬)

-- 오름차순 (Ascending, ASC)
-- 내림차순 (Descending, DESC)
SELECT 
 		 menu_code  -- 첫번쨰
	  , menu_name	-- 두번쨰
	  , menu_price	-- 세번쨰
	FROM tbl_menu
--  ORDER BY menu_price ASC;
--  ORDER BY menu_price ASC, menu_name DESC; -- 정렬의 우선순위를 나누어 정렬할 수도 있다.
--  ORDER BY 3 ASC, 2 DESC;						-- select 절의 순번으로도 정렬 가능
 ORDER BY 3, 2 DESC;									-- ASC는 생략가능(ASC가 default다)
 
 -- 별칭을 이용한 정렬
 select
 		 menu_code AS '메뉴코드'
 	  , menu_name AS 'mn'
 	  , menu_price AS 'mp'
  FROM tbl_menu
 ORDER BY 메뉴코드 DESC; 			--  싱글쿼테이션 생략 불가(별칭에 특수기호 X)
 
 
--  -----------------------------------------------------------------------
-- mariadb는 field함수를 활용해서 정렬이 가능하다.
SELECT FIELD ('a','b','c','a');				-- b,c,a중 a의 위치 

SELECT 
		 orderable_status
	  , FIELD(orderable_status, 'N','Y')
  FROM tbl_menu;
  
--  field를 활용한 order by
--  주문 가능한 것 부터 보이게 정렬하기
SELECT 
		 menu_name
	  , orderable_status
  FROM tbl_menu
ORDER BY FIELD(orderable_status,'N','Y') DESC;

--  -----------------------------------------------------------------------
-- null 값(비어 있는 컬럼 값)에 대한 정렬
-- 1) 오름차순 시: null값이 먼저 나옴
SELECT 
		 *
  FROM tbl_category
 ORDER BY ref_category_code ASC;
 
-- 2) 내림차순 시 null값이 나중에 나옴  
SELECT 
		 *
  FROM tbl_category
 ORDER BY ref_category_code DESC;
 
-- 3)오름차순에서 null이 나중에 나오도록 바꿈

SELECT
		 *
  FROM tbl_category
  order by -ref_category_code DESC; -- DESC를 통해 null을 나중으로 보내고 '-'로 desc와 반대로 진행(asc)
  

-- 4) 내림차순에서 null이 먼저 나오도록 바꿈
SELECT
		 *
	FROM tbl_category
 order BY -ref_category_code ASC; 