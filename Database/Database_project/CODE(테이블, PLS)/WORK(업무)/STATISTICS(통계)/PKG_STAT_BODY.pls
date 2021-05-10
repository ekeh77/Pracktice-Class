create or replace NONEDITIONABLE PACKAGE BODY PKG_STAT AS

  PROCEDURE PROC_STAT_REVIEW
    (
            IN_G_ID               VARCHAR2,
            O_CUR               OUT             SYS_REFCURSOR
    ) AS
  BEGIN
            -- 1. IN_G_ID���� NULL�̶�� ��� ������ ������� ��� ������ �����ش�.
            IF IN_G_ID IS NULL
                    THEN               
                            OPEN O_CUR FOR
                            SELECT G_NAME, COUNT(*), AVG(RV_SCORE)
                            FROM SALES_TBL T1, GAMES_TBL T2, REVIEW_TBL T3
                            WHERE T1.G_ID = T2.G_ID
                                    AND T1.S_ID = T3.S_ID
                                    AND T3.RV_SHOW = 'Y'
                            GROUP BY G_NAME
                            ;
            -- 2. �׿ܷ�, IN_G_ID���� ���� ������ ������� ��� ������ �����ش�.
                    ELSE
                            OPEN O_CUR FOR
                            SELECT G_NAME, COUNT(*), AVG(RV_SCORE)
                            FROM SALES_TBL T1, GAMES_TBL T2, REVIEW_TBL T3
                            WHERE T1.G_ID = T2.G_ID
                                    AND T1.S_ID = T3.S_ID
                                    AND T2.G_ID = IN_G_ID
                                    AND T3.RV_SHOW = 'Y'
                            GROUP BY G_NAME
                            ;
                    END IF;
    
  END PROC_STAT_REVIEW;

  PROCEDURE PROC_STAT_CUSTOMERS
    (
            IN_COUNTRY          VARCHAR2,
            IN_GENDER          VARCHAR2,
            IN_AGE                    VARCHAR2,    
            O_CUR               OUT             SYS_REFCURSOR            
    ) AS
  BEGIN
         -- 1. ������ �������� NULL�̶�� ��� ���� ���̴뺰, ������, ���� ��踦 �����ش�.
        IF IN_COUNTRY IS NULL 
                AND IN_GENDER IS NULL
                AND IN_AGE IS NULL
                THEN
                        OPEN O_CUR FOR
                         SELECT         
                                CASE WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, CT_BIRTH) / 12) BETWEEN 10 AND 19 THEN '10��'
                                            WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, CT_BIRTH) / 12) BETWEEN 20 AND 29 THEN '20��'
                                            WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, CT_BIRTH) / 12) BETWEEN 30 AND 39 THEN '30��'
                                            WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, CT_BIRTH) / 12) BETWEEN 40 AND 49 THEN '40��'
                                            WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, CT_BIRTH) / 12) BETWEEN 50 AND 59 THEN '50��'
                                            WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, CT_BIRTH) / 12) BETWEEN 60 AND 69 THEN '60��'
                                            WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, CT_BIRTH) / 12) BETWEEN 70 AND 79 THEN '70��'
                                            WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, CT_BIRTH) / 12) BETWEEN 80 AND 89 THEN '80��'
                                            END AS AGES, 
                                   CMS_NAME, CT_GENDER, COUNT(*), SUM(T1.S_PROFIT)
                            FROM SALES_TBL T1, CUSTOMERS_TBL T2, COMMONS_TBL T3
                            WHERE T1.CT_ID = T2.CT_ID AND T2.CT_REGION = T3.CMS_ID
                            GROUP BY CT_GENDER, CMS_NAME,CASE WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, CT_BIRTH) / 12) BETWEEN 10 AND 19 THEN '10��' 
                                                                                        WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, CT_BIRTH) / 12) BETWEEN 20 AND 29 THEN '20��' 
                                                                                        WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, CT_BIRTH) / 12) BETWEEN 30 AND 39 THEN '30��' 
                                                                                        WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, CT_BIRTH) / 12) BETWEEN 40 AND 49 THEN '40��' 
                                                                                        WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, CT_BIRTH) / 12) BETWEEN 50 AND 59 THEN '50��' 
                                                                                        WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, CT_BIRTH) / 12) BETWEEN 60 AND 69 THEN '60��' 
                                                                                        WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, CT_BIRTH) / 12) BETWEEN 70 AND 79 THEN '70��' 
                                                                                        WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, CT_BIRTH) / 12) BETWEEN 80 AND 89 THEN '80��' END
                            ORDER BY AGES, CMS_NAME, CT_GENDER ASC
                            ;
        -- 2. �Է��� ���Ǻ��� ���� ���̴뺰, ������, ���� �� ����Ƚ���� �� ���ž��� ���δ�.
                ELSE
                        OPEN O_CUR FOR
                        SELECT         
                                CASE WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, CT_BIRTH) / 12) BETWEEN 10 AND 19 THEN '10��'
                                            WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, CT_BIRTH) / 12) BETWEEN 20 AND 29 THEN '20��'
                                            WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, CT_BIRTH) / 12) BETWEEN 30 AND 39 THEN '30��'
                                            WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, CT_BIRTH) / 12) BETWEEN 40 AND 49 THEN '40��'
                                            WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, CT_BIRTH) / 12) BETWEEN 50 AND 59 THEN '50��'
                                            WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, CT_BIRTH) / 12) BETWEEN 60 AND 69 THEN '60��'
                                            WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, CT_BIRTH) / 12) BETWEEN 70 AND 79 THEN '70��'
                                            WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, CT_BIRTH) / 12) BETWEEN 80 AND 89 THEN '80��'
                                            END AS AGES, 
                                CMS_NAME, CT_GENDER, COUNT(*), SUM(T1.S_PROFIT)
                        FROM SALES_TBL T1, CUSTOMERS_TBL T2, COMMONS_TBL T3
                        WHERE T1.CT_ID = T2.CT_ID AND T2.CT_REGION = T3.CMS_ID
                                AND CASE WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, CT_BIRTH) / 12) BETWEEN 10 AND 19 THEN '10��' 
                                                                        WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, CT_BIRTH) / 12) BETWEEN 20 AND 29 THEN '20��' 
                                                                        WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, CT_BIRTH) / 12) BETWEEN 30 AND 39 THEN '30��' 
                                                                        WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, CT_BIRTH) / 12) BETWEEN 40 AND 49 THEN '40��' 
                                                                        WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, CT_BIRTH) / 12) BETWEEN 50 AND 59 THEN '50��' 
                                                                        WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, CT_BIRTH) / 12) BETWEEN 60 AND 69 THEN '60��' 
                                                                        WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, CT_BIRTH) / 12) BETWEEN 70 AND 79 THEN '70��' 
                                                                        WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, CT_BIRTH) / 12) BETWEEN 80 AND 89 THEN '80��' END LIKE '%' || IN_AGE || '%'
                                AND CT_GENDER LIKE '%' || IN_GENDER || '%'
                                AND CMS_NAME LIKE '%' || IN_COUNTRY || '%'
                        GROUP BY CT_GENDER, CMS_NAME,CASE WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, CT_BIRTH) / 12) BETWEEN 10 AND 19 THEN '10��' 
                                                                                WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, CT_BIRTH) / 12) BETWEEN 20 AND 29 THEN '20��' 
                                                                                WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, CT_BIRTH) / 12) BETWEEN 30 AND 39 THEN '30��' 
                                                                                WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, CT_BIRTH) / 12) BETWEEN 40 AND 49 THEN '40��' 
                                                                                WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, CT_BIRTH) / 12) BETWEEN 50 AND 59 THEN '50��' 
                                                                                WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, CT_BIRTH) / 12) BETWEEN 60 AND 69 THEN '60��' 
                                                                                WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, CT_BIRTH) / 12) BETWEEN 70 AND 79 THEN '70��' 
                                                                                WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, CT_BIRTH) / 12) BETWEEN 80 AND 89 THEN '80��' END
                        ORDER BY AGES, CMS_NAME, CT_GENDER ASC
                        ;
                END IF;
                
  END PROC_STAT_CUSTOMERS;

  PROCEDURE PROC_STAT_PERIOD
    (
            IN_YEAR          VARCHAR2,
            IN_QUARTER  VARCHAR2,
            IN_MONTH        NUMBER,
            O_CUR               OUT             SYS_REFCURSOR         
    ) AS
  BEGIN
         -- 1. ��� �Ⱓ�� ���� NULL�̶�� �⵵��, �б⺰, ���� ��踦 �����ش�.  
            IF IN_YEAR IS NULL
                    AND IN_QUARTER IS NULL
                    AND IN_MONTH IS NULL
                    THEN
                            OPEN O_CUR FOR
                            SELECT TO_CHAR(S_DATE, 'YYYY') AS YEAR,
                                    CASE WHEN TO_CHAR(S_DATE, 'MM') BETWEEN 1 AND 3 THEN '1�б�'
                                                WHEN TO_CHAR(S_DATE, 'MM') BETWEEN 4 AND 6 THEN '2�б�'
                                                WHEN TO_CHAR(S_DATE, 'MM') BETWEEN 6 AND 9 THEN '3�б�'
                                                WHEN TO_CHAR(S_DATE, 'MM') BETWEEN 10 AND 12 THEN '4�б�'
                                    END AS QUARTER,
                                    TO_CHAR(S_DATE, 'MM') AS MONTH, COUNT(*), SUM(S_PROFIT)
                            FROM SALES_TBL T1, GAMES_TBL T2, CUSTOMERS_TBL T3
                            WHERE T1.G_ID = T2.G_ID AND T1.CT_ID = T3.CT_ID
                            GROUP BY TO_CHAR(S_DATE, 'YYYY'),
                                    CASE WHEN TO_CHAR(S_DATE, 'MM') BETWEEN 1 AND 3 THEN '1�б�'
                                                WHEN TO_CHAR(S_DATE, 'MM') BETWEEN 4 AND 6 THEN '2�б�'
                                                WHEN TO_CHAR(S_DATE, 'MM') BETWEEN 6 AND 9 THEN '3�б�'
                                                WHEN TO_CHAR(S_DATE, 'MM') BETWEEN 10 AND 12 THEN '4�б�'
                                    END,
                                    TO_CHAR(S_DATE, 'MM')
                            ORDER BY YEAR, QUARTER, MONTH DESC
                            ;     
        -- 2. �Է��� ���Ǻ���  �⵵��, �б⺰, ���� ��踦 ���δ�.                            
                    ELSE
                        OPEN O_CUR FOR
                            SELECT TO_CHAR(S_DATE, 'YYYY') AS YEAR,
                                    CASE WHEN TO_CHAR(S_DATE, 'MM') BETWEEN 1 AND 3 THEN '1�б�'
                                                WHEN TO_CHAR(S_DATE, 'MM') BETWEEN 4 AND 6 THEN '2�б�'
                                                WHEN TO_CHAR(S_DATE, 'MM') BETWEEN 6 AND 9 THEN '3�б�'
                                                WHEN TO_CHAR(S_DATE, 'MM') BETWEEN 10 AND 12 THEN '4�б�'
                                    END AS QUARTER,
                                    TO_CHAR(S_DATE, 'MM') AS MONTH,  COUNT(*), SUM(S_PROFIT)
                            FROM SALES_TBL T1, GAMES_TBL T2, CUSTOMERS_TBL T3
                            WHERE T1.G_ID = T2.G_ID AND T1.CT_ID = T3.CT_ID
                                    AND (TO_CHAR(S_DATE, 'YYYY') LIKE '%' || IN_YEAR || '%' 
                                    AND CASE WHEN TO_CHAR(S_DATE, 'MM') BETWEEN 1 AND 3 THEN '1�б�'
                                                WHEN TO_CHAR(S_DATE, 'MM') BETWEEN 4 AND 6 THEN '2�б�'
                                                WHEN TO_CHAR(S_DATE, 'MM') BETWEEN 6 AND 9 THEN '3�б�'
                                                WHEN TO_CHAR(S_DATE, 'MM') BETWEEN 10 AND 12 THEN '4�б�'
                                                END LIKE '%' || IN_QUARTER || '%'
                                    AND TO_CHAR(S_DATE, 'MM') LIKE '%' || IN_MONTH || '%' )
                            GROUP BY TO_CHAR(S_DATE, 'YYYY'),
                                    CASE WHEN TO_CHAR(S_DATE, 'MM') BETWEEN 1 AND 3 THEN '1�б�'
                                                WHEN TO_CHAR(S_DATE, 'MM') BETWEEN 4 AND 6 THEN '2�б�'
                                                WHEN TO_CHAR(S_DATE, 'MM') BETWEEN 6 AND 9 THEN '3�б�'
                                                WHEN TO_CHAR(S_DATE, 'MM') BETWEEN 10 AND 12 THEN '4�б�'
                                    END,
                                    TO_CHAR(S_DATE, 'MM')
                            ORDER BY YEAR, QUARTER, MONTH DESC
                            ;                             
                    END IF;
  END PROC_STAT_PERIOD;

END PKG_STAT;