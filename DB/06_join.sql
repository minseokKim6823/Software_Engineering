-- join

--  alias(별칭)
-- 컬럼에 별칭을 다는 것 외에도 from 절에 작성되는 것들에 별칭도 추가 가능하다.
-- 테이블 또는 from 절에 별칭을 추가할 때는 싱글 쿼테이션(') 없이 별칭을 작성한다.
-- AS는 생략가능하다
SELECT 
		 a.category_code
	  , a.menu_name
  FROM tbl_menu AS a
 ORDER BY a.category_code, a.menu_name;
 
-- inner join
-- inner라는 키워드는 생략해도 inner join이다.
-- 1) on을 활용
SELECT
		 a.menu_name
	  , b.category_name
	  , a.category_code
	  -- , b.category_code
  FROM tbl_menu a
 INNER JOIN tbl_category b ON a.category_code = b.category_code;  -- b.category_code => pk 
 
-- 2) using을 활용
-- join할 테이블들의 매핑 컬럼명들이 동일할 경우에만 사용가능한 문법
SELECT 
		 a.menu_name
	  , b.category_name
	  , a.category_code
  FROM tbl_menu a
  JOIN tbl_category b USING (category_code);
  
-- ---------------------------------------------------------
-- outer join
-- 1) left join
SELECT 
		 a.category_name
	  , b.menu_name
  FROM tbl_category a
  LEFT JOIN tbl_menu b ON (a.category_code = b.category_code);

-- 2) right join  
SELECT 
		 a.menu_name
	  , b.category_name
  FROM tbl_menu a
 RIGHT JOIN tbl_category b ON (a.category_code = b.category_code);
 
-- 3) cross join
SELECT 
		  a.menu_name
		, b.category_name
  FROM tbl_menu a
 CROSS JOIN tbl_category b;
 
--  4) self join
--  a에 해당하는 것은 하위 카테고리, b에 해당하는 것은 상위 카테고리
SELECT
		 a.category_name
	   , b.category_name
  FROM tbl_category a
  JOIN tbl_category b ON (a.ref_category_code = b.category_code);
  
SELECT * FROM tbl_menu;
SELECT * FROM tbl_category;