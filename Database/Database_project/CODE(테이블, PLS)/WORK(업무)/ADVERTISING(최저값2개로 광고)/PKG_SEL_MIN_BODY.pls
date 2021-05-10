create or replace NONEDITIONABLE PACKAGE BODY PKG_SEL_MIN AS

  PROCEDURE PROC_SEL_SALES_MIN
  (
   O_CUR         OUT    SYS_REFCURSOR
  ) 
  AS
  BEGIN
       OPEN O_CUR FOR
      SELECT G_ID, 매출 , 최저매출순위 
      FROM (
         SELECT  G_ID ,SUM(S_PROFIT) AS 매출,
               RANK () OVER(ORDER BY SUM(S_PROFIT) ASC)  AS 최저매출순위
         FROM SALES_TBL 
        
         GROUP BY G_ID
         /*
         
            SELECT T1.G_NAME, NVL(SUM(S_PROFIT),0) AS SALES, 
            RANK() OVER(ORDER BY NVL(SUM(S_PROFIT),0) ASC) AS RANK
            FROM GAMES_TBL T1, SALES_TBL T2
            WHERE T1.G_ID = T2.G_ID(+)
            GROUP BY T1.G_ID, T1.G_NAME
            ;
         
         */
         )T1
      WHERE 최저매출순위 = 1
      ;
  END PROC_SEL_SALES_MIN;

  PROCEDURE PROC_SEL_COUNT_MIN
  (
   O_CUR         OUT    SYS_REFCURSOR
  ) AS
  BEGIN
    -- 횟수 기준
      OPEN O_CUR FOR
      SELECT G_ID, 횟수, 최저판매횟수순위
      FROM (
            SELECT  G_ID , COUNT(*) AS 횟수,
                  RANK () OVER(ORDER BY COUNT(*) ASC)  AS 최저판매횟수순위
            FROM SALES_TBL
            GROUP BY G_ID
            
            /*
                SELECT T1.G_NAME, COUNT(T2.S_ID) AS COUNT, RANK() OVER(ORDER BY COUNT(T2.S_ID) ASC) AS RANK
                FROM GAMES_TBL T1, SALES_TBL T2
                WHERE T1.G_ID = T2.G_ID(+)
                GROUP BY T1.G_ID, T1.G_NAME
                ;
            */
            
            )
      WHERE 최저판매횟수순위 = 1
      ;
  END PROC_SEL_COUNT_MIN;

END PKG_SEL_MIN;