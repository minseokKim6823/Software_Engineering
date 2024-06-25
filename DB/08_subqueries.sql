-- subqueries

-- '민트 미역국'의 카테고리 번호 조회(서브 쿼리 개념)
SELECT * FROM tbl_menu;

SELECT 
		 category_code
  FROM tbl_menu
 WHERE menu_name = '민트미역국'; -- 4

-- '미트 미역국'과 같은 카테고리의 메뉴를 조회
SELECT 
		 menu_name
  FROM tbl_menu
 WHERE category_code = 4;
 
SELECT 
		 menu_name
--	  , category_code
  FROM tbl_menu
 WHERE category_code = (SELECT category_code
 								  FROM tbl_menu
								 WHERE menu_name = '민트미역국');
-- 서브쿼리의 종류								 
-- 1) 다중행 다중열 서브쿼리
SELECT
		 *
  FROM tbl_menu;
  
-- 2) 다중행 단일열 서브쿼리
SELECT
		 *
	FROM tbl_menu;

-- 3) 단일행 다중열 서브쿼리
SELECT 
		 *
	FROM tbl_menu
 WHERE menu_name ='우럭스무디';
	
-- 4) 단일행 단일열 서브쿼리
SELECT
		 category_code
  FROM tbl_menu
 WHERE menu_name='우럭스무디';
 
-- 가장 많은 메뉴가 포함된 카테고리의 메뉴 갯수 조회(count(),max())
	
SELECT	
		 COUNT(*)
	FROM tbl_menu
 GROUP BY category_code
 ORDER BY COUNT(*) DESC LIMIT 1;


SELECT
		 MAX(a.count)
	  , a.category_code
  FROM (SELECT COUNT(*) AS count
  				 , category_code
 			 FROM tbl_menu
			GROUP BY category_code) a;
			
-- 선행해서 쿼리에서 동작해야 할 쿼리를 서브쿼리로 작성한다.
-- mariadb에서는 서브쿼리를 from절에 사용시 (인라인 뷰)에는 반드시 별칭을
-- 달아야 된다.(-> a)
-- 서브쿼리의 그룹함수의 결과를 메인쿼리에서 쓰기 위해서는 역시나 반드시 별칭을
-- 달아야 한다.(-> count)