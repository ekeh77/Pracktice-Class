create or replace NONEDITIONABLE PACKAGE BODY PKG_SALES_INFO AS

/* ���� ���űݾ� Ȯ�� ���ν��� ���� */
  PROCEDURE PROC_SALES_CUSTOMER
  (
    IN_CT_ID            IN      VARCHAR2,--�ƹ��͵� ���������� ��簪�� �����ش�
    IN_W_SHOW           IN      VARCHAR2,--S(SALES)�� ��� �Ϲݰ����Ǹ� A(APPLY)�ϰ�� ��������Ǹ� �ƹ��͵� ���������� ��簪�� �����ش� 
    O_CUR               OUT     SYS_REFCURSOR
  ) AS
  BEGIN
    
    IF IN_CT_ID IS NULL THEN -- ��� ���� ���űݾ�(�����Ǹ�)�� �����ش�
    
        IF IN_W_SHOW = 'S' THEN --�Ϲݰ����Ǹ� ���� ���űݾ�
            
            OPEN O_CUR FOR
            SELECT T1.CT_NAME, NVL(T2.PROFIT_S,0) AS SALES, RANK() OVER(ORDER BY NVL(T2.PROFIT_S,0) DESC) AS RANK
            FROM CUSTOMERS_TBL T1,
            (
            SELECT CT_ID, SUM(S_PROFIT) AS PROFIT_S
            FROM SALES_TBL
            GROUP BY CT_ID
            ) T2
            WHERE T1.CT_ID = T2.CT_ID(+)
            ORDER BY RANK() OVER(ORDER BY NVL(T2.PROFIT_S,0) DESC)
            ;
            
        ELSIF IN_W_SHOW = 'A' THEN --��������Ǹ� ���� ���űݾ�
            
            OPEN O_CUR FOR
            SELECT T1.CT_NAME, NVL(T2.PROFIT_A,0) AS SALES, RANK() OVER(ORDER BY NVL(T2.PROFIT_A,0) DESC) AS RANK
            FROM CUSTOMERS_TBL T1,
            (
            SELECT CT_ID, SUM(A_PROFIT) AS PROFIT_A
            FROM SALE_APPLYS_TBL
            GROUP BY CT_ID
            ) T2
            WHERE T1.CT_ID = T2.CT_ID(+)
            ORDER BY RANK() OVER(ORDER BY NVL(T2.PROFIT_A,0) DESC)
            ;
            
        ELSE --�������Ǹ� ���� ���űݾ�
            
            OPEN O_CUR FOR
            SELECT T1.CT_NAME, NVL(T2.PROFIT_S,0) + NVL(T3.PROFIT_A,0) AS SALES, 
            RANK() OVER(ORDER BY NVL(T2.PROFIT_S,0) + NVL(T3.PROFIT_A,0) DESC) AS RANK
            FROM CUSTOMERS_TBL T1,
            (
            SELECT CT_ID, SUM(S_PROFIT) AS PROFIT_S
            FROM SALES_TBL
            GROUP BY CT_ID
            ) T2,(
            SELECT CT_ID, SUM(A_PROFIT) AS PROFIT_A
            FROM SALE_APPLYS_TBL
            GROUP BY CT_ID
            ) T3
            WHERE T1.CT_ID = T2.CT_ID(+)
            AND T1.CT_ID = T3.CT_ID(+)
            ORDER BY RANK() OVER(ORDER BY NVL(T2.PROFIT_S,0) + NVL(T3.PROFIT_A,0) DESC)
            ;
            
        END IF
        ;
        
    ELSE -- Ư���� ���� ���űݾ׸� �����ش�
    
        IF IN_W_SHOW = 'S' THEN --�Ϲݰ����Ǹ� Ư���� ���űݾ�
            
            OPEN O_CUR FOR
            SELECT T1.CT_NAME, NVL(T2.PROFIT_S,0) AS SALES, RANK() OVER(ORDER BY NVL(T2.PROFIT_S,0) DESC) AS RANK
            FROM CUSTOMERS_TBL T1,
            (
            SELECT CT_ID, SUM(S_PROFIT) AS PROFIT_S
            FROM SALES_TBL
            GROUP BY CT_ID
            ) T2
            WHERE T1.CT_ID = T2.CT_ID(+)
            AND T1.CT_ID = IN_CT_ID
            ORDER BY RANK() OVER(ORDER BY NVL(T2.PROFIT_S,0) DESC)
            ;
            
        ELSIF IN_W_SHOW = 'A' THEN --��������Ǹ� Ư���� ���űݾ�
            
            OPEN O_CUR FOR
            SELECT T1.CT_NAME, NVL(T2.PROFIT_A,0) AS SALES, RANK() OVER(ORDER BY NVL(T2.PROFIT_A,0) DESC) AS RANK
            FROM CUSTOMERS_TBL T1,
            (
            SELECT CT_ID, SUM(A_PROFIT) AS PROFIT_A
            FROM SALE_APPLYS_TBL
            GROUP BY CT_ID
            ) T2
            WHERE T1.CT_ID = T2.CT_ID(+)
            AND T1.CT_ID = IN_CT_ID
            ORDER BY RANK() OVER(ORDER BY NVL(T2.PROFIT_A,0) DESC)
            ;
            
        ELSE --�������Ǹ� Ư���� ���űݾ�
            
            OPEN O_CUR FOR
            SELECT T1.CT_NAME, NVL(T2.PROFIT_S,0) + NVL(T3.PROFIT_A,0) AS SALES, 
            RANK() OVER(ORDER BY NVL(T2.PROFIT_S,0) + NVL(T3.PROFIT_A,0) DESC) AS RANK
            FROM CUSTOMERS_TBL T1,
            (
            SELECT CT_ID, SUM(S_PROFIT) AS PROFIT_S
            FROM SALES_TBL
            GROUP BY CT_ID
            ) T2,(
            SELECT CT_ID, SUM(A_PROFIT) AS PROFIT_A
            FROM SALE_APPLYS_TBL
            GROUP BY CT_ID
            ) T3
            WHERE T1.CT_ID = T2.CT_ID(+)
            AND T1.CT_ID = T3.CT_ID(+)
             AND T1.CT_ID = IN_CT_ID
            ORDER BY RANK() OVER(ORDER BY NVL(T2.PROFIT_S,0) + NVL(T3.PROFIT_A,0) DESC)
            ;
        END IF
        ;
    
    END IF
    ;
    
  END PROC_SALES_CUSTOMER;

/* ���� ���űݾ� Ȯ�� ���ν��� �� */

/* ������ �Ǹűݾ� Ȯ�� ���ν��� ���� */

PROCEDURE PROC_SALES_COUNTRY
    (
        IN_CMS_ID       IN      VARCHAR2,--�ƹ��͵� ���������� ��簪�� �����ش�
        IN_W_SHOW       IN      VARCHAR2,--S(SALES)�� ��� �Ϲݰ����Ǹ� A(APPLY)�ϰ�� ��������Ǹ� �ƹ��͵� ���������� ��簪�� �����ش�
        O_CUR           OUT     SYS_REFCURSOR
    )
    AS
    BEGIN
        
        IF IN_CMS_ID IS NULL THEN -- ��� ������ �ǸŸ� �����ش�
    
        IF IN_W_SHOW = 'S' THEN --�Ϲݰ����Ǹ� ��籹�� �Ǹűݾ�
            
            OPEN O_CUR FOR
            SELECT CMS_NAME, SALES, RANK() OVER(ORDER BY NVL(SALES,0) DESC) AS RANK
            FROM (
            SELECT T3.CMS_NAME, SUM(NVL(T2.S_PROFIT,0)) AS SALES
            FROM CUSTOMERS_TBL T1, SALES_TBL T2 , COMMONS_TBL T3
            WHERE T1.CT_ID = T2.CT_ID(+)
            AND T1.CT_REGION(+) = T3.CMS_ID
            AND T3.PARENT_CMS_ID = 'CMS003'
            GROUP BY T3.CMS_ID, T3.CMS_NAME
            )
            ;
            
        ELSIF IN_W_SHOW = 'A' THEN --��������Ǹ� ��籹�� �Ǹűݾ�
            
            OPEN O_CUR FOR
            SELECT CMS_NAME, SALES, RANK() OVER(ORDER BY NVL(SALES,0) DESC) AS RANK
            FROM (
            SELECT T3.CMS_NAME, SUM(NVL(T2.A_PROFIT,0)) AS SALES
            FROM CUSTOMERS_TBL T1, SALE_APPLYS_TBL T2 , COMMONS_TBL T3
            WHERE T1.CT_ID = T2.CT_ID(+)
            AND T1.CT_REGION(+) = T3.CMS_ID
            AND T3.PARENT_CMS_ID = 'CMS003'
            GROUP BY T3.CMS_ID, T3.CMS_NAME
            )
            ;
            
        ELSE --�������Ǹ� ��籹�� �Ǹűݾ�
            
            OPEN O_CUR FOR
            SELECT T1.CMS_NAME, NVL(T2.SALES_S,0) + NVL(T3.SALES_A,0) AS SALES, 
            RANK() OVER(ORDER BY NVL(T2.SALES_S,0) + NVL(T3.SALES_A,0) DESC) AS RANK
            FROM COMMONS_TBL T1,
            (
            SELECT T3.CMS_ID, SUM(NVL(T2.S_PROFIT,0)) AS SALES_S
            FROM CUSTOMERS_TBL T1, SALES_TBL T2 , COMMONS_TBL T3
            WHERE T1.CT_ID = T2.CT_ID
            AND T1.CT_REGION = T3.CMS_ID
            GROUP BY T3.CMS_ID
            ) T2, (
                SELECT T3.CMS_ID, SUM(NVL(T2.A_PROFIT,0)) AS SALES_A
                FROM CUSTOMERS_TBL T1, SALE_APPLYS_TBL T2 , COMMONS_TBL T3
                WHERE T1.CT_ID = T2.CT_ID
                AND T1.CT_REGION = T3.CMS_ID
                GROUP BY T3.CMS_ID
            ) T3
            WHERE T1.CMS_ID = T2.CMS_ID(+)
            AND T1.CMS_ID = T3.CMS_ID(+)
            AND T1.PARENT_CMS_ID = 'CMS003'
            ORDER BY RANK() OVER(ORDER BY NVL(T2.SALES_S,0) + NVL(T3.SALES_A,0) DESC)
            ;
            
        END IF
        ;
        
    ELSE -- Ư���� ������ �ǸŰ��� �����ش�
        
            IF IN_W_SHOW = 'S' THEN --�Ϲݰ����Ǹ� Ư������ �Ǹűݾ�
                
                OPEN O_CUR FOR
                SELECT CMS_NAME, SALES, RANK() OVER(ORDER BY NVL(SALES,0) DESC) AS RANK
                FROM (
                SELECT T3.CMS_NAME, SUM(NVL(T2.S_PROFIT,0)) AS SALES
                FROM CUSTOMERS_TBL T1, SALES_TBL T2 , COMMONS_TBL T3
                WHERE T1.CT_ID = T2.CT_ID(+)
                AND T1.CT_REGION(+) = T3.CMS_ID
                AND T3.PARENT_CMS_ID = 'CMS003'
                AND T3.CMS_ID = IN_CMS_ID
                GROUP BY T3.CMS_ID, T3.CMS_NAME
                )
                ;
                
            ELSIF IN_W_SHOW = 'A' THEN --��������Ǹ� Ư������ �Ǹűݾ�
                
                OPEN O_CUR FOR
                SELECT CMS_NAME, SALES, RANK() OVER(ORDER BY NVL(SALES,0) DESC) AS RANK
                FROM (
                SELECT T3.CMS_NAME, SUM(NVL(T2.A_PROFIT,0)) AS SALES
                FROM CUSTOMERS_TBL T1, SALE_APPLYS_TBL T2 , COMMONS_TBL T3
                WHERE T1.CT_ID = T2.CT_ID(+)
                AND T1.CT_REGION(+) = T3.CMS_ID
                AND T3.PARENT_CMS_ID = 'CMS003'
                AND T3.CMS_ID = IN_CMS_ID
                GROUP BY T3.CMS_ID, T3.CMS_NAME
                )
                ;
                
            ELSE --�������Ǹ� Ư������ �Ǹűݾ�
                
                OPEN O_CUR FOR
                SELECT T1.CMS_NAME, NVL(T2.SALES_S,0) + NVL(T3.SALES_A,0) AS SALES, 
                RANK() OVER(ORDER BY NVL(T2.SALES_S,0) + NVL(T3.SALES_A,0) DESC) AS RANK
                FROM COMMONS_TBL T1,
                (
                SELECT T3.CMS_ID, SUM(NVL(T2.S_PROFIT,0)) AS SALES_S
                FROM CUSTOMERS_TBL T1, SALES_TBL T2 , COMMONS_TBL T3
                WHERE T1.CT_ID = T2.CT_ID
                AND T1.CT_REGION = T3.CMS_ID
                GROUP BY T3.CMS_ID
                ) T2, (
                    SELECT T3.CMS_ID, SUM(NVL(T2.A_PROFIT,0)) AS SALES_A
                    FROM CUSTOMERS_TBL T1, SALE_APPLYS_TBL T2 , COMMONS_TBL T3
                    WHERE T1.CT_ID = T2.CT_ID
                    AND T1.CT_REGION = T3.CMS_ID
                    GROUP BY T3.CMS_ID
                ) T3
                WHERE T1.CMS_ID = T2.CMS_ID(+)
                AND T1.CMS_ID = T3.CMS_ID(+)
                AND T1.PARENT_CMS_ID = 'CMS003'
                AND T1.CMS_ID = IN_CMS_ID
                ORDER BY RANK() OVER(ORDER BY NVL(T2.SALES_S,0) + NVL(T3.SALES_A,0) DESC)
                ;
            END IF
            ;
    
    END IF
    ;
    
    END PROC_SALES_COUNTRY
    ;
    
/* ������ �Ǹűݾ� Ȯ�� ���ν��� �� */

/* �帣�� �Ǹűݾ� Ȯ�� ���ν��� ���� */

    PROCEDURE PROC_SALES_GENRE
    (
        IN_CMS_ID       IN      VARCHAR2,--�ƹ��͵� ���������� ��簪�� �����ش� 
        IN_W_SHOW       IN      VARCHAR2,--S(SALES)�� ��� �Ϲݰ����Ǹ� A(APPLY)�ϰ�� ��������Ǹ� �ƹ��͵� ���������� ��簪�� �����ش� 
        O_CUR           OUT     SYS_REFCURSOR
    )
    AS
    BEGIN
    IF IN_CMS_ID IS NULL THEN -- ��� �帣�� �ǸŸ� �����ش�
    
        IF IN_W_SHOW = 'S' THEN --�Ϲݰ����Ǹ� ����帣 �Ǹűݾ�
            
            OPEN O_CUR FOR
            SELECT CMS_NAME, SALES, RANK() OVER(ORDER BY SALES DESC) AS RANK
            FROM(
            SELECT T2.CMS_NAME, SUM(NVL(T3.S_PROFIT,0)) AS SALES
            FROM GAMES_TBL T1, COMMONS_TBL T2, SALES_TBL T3
            WHERE T1.G_GENRE(+) = T2.CMS_ID
            AND T1.G_ID = T3.G_ID(+)
            AND T2.PARENT_CMS_ID = 'CMS004'
            GROUP BY T2.CMS_NAME
            )
            ORDER BY RANK() OVER(ORDER BY SALES DESC)
            ;
            
        ELSIF IN_W_SHOW = 'A' THEN --��������Ǹ� ����帣 �Ǹűݾ�
            
            OPEN O_CUR FOR
            SELECT CMS_NAME, SALES, RANK() OVER(ORDER BY SALES DESC) AS RANK
            FROM(
            SELECT T2.CMS_NAME, SUM(NVL(T3.A_PROFIT,0)) AS SALES
            FROM GAMES_TBL T1, COMMONS_TBL T2, SALE_APPLYS_TBL T3
            WHERE T1.G_GENRE(+) = T2.CMS_ID
            AND T1.G_ID = T3.G_ID(+)
            AND T2.PARENT_CMS_ID = 'CMS004'
            GROUP BY T2.CMS_NAME
            )
            ORDER BY RANK() OVER(ORDER BY SALES DESC)
            ;
            
        ELSE --�������Ǹ� ����帣 �Ǹűݾ�
            
            OPEN O_CUR FOR
            SELECT T1.CMS_NAME, SALES_S + SALES_A AS SALES, RANK() OVER(ORDER BY SALES_S + SALES_A DESC) AS RNAK
            FROM
            (
            SELECT T2.CMS_ID, T2.CMS_NAME, SUM(NVL(T3.S_PROFIT,0)) AS SALES_S
            FROM GAMES_TBL T1, COMMONS_TBL T2, SALES_TBL T3
            WHERE T1.G_GENRE(+) = T2.CMS_ID
            AND T1.G_ID = T3.G_ID(+)
            AND T2.PARENT_CMS_ID = 'CMS004'
            GROUP BY T2.CMS_ID, T2.CMS_NAME
            ) T1,
            (
            SELECT T2.CMS_ID, T2.CMS_NAME, SUM(NVL(T3.A_PROFIT,0)) AS SALES_A
            FROM GAMES_TBL T1, COMMONS_TBL T2, SALE_APPLYS_TBL T3
            WHERE T1.G_GENRE(+) = T2.CMS_ID
            AND T1.G_ID = T3.G_ID(+)
            AND T2.PARENT_CMS_ID = 'CMS004'
            GROUP BY T2.CMS_ID, T2.CMS_NAME
            ) T2
            WHERE T1.CMS_ID = T2.CMS_ID
            ORDER BY RANK() OVER(ORDER BY SALES_S + SALES_A DESC)
            ;
            
        END IF
        ;
        
    ELSE -- Ư���� �帣�� �ǸŰ��� �����ش�
        
              IF IN_W_SHOW = 'S' THEN --�Ϲݰ����Ǹ� Ư���帣 �Ǹűݾ�
            
            OPEN O_CUR FOR
            SELECT CMS_NAME, SALES, RANK() OVER(ORDER BY SALES DESC) AS RANK
            FROM(
            SELECT T2.CMS_NAME, SUM(NVL(T3.S_PROFIT,0)) AS SALES
            FROM GAMES_TBL T1, COMMONS_TBL T2, SALES_TBL T3
            WHERE T1.G_GENRE(+) = T2.CMS_ID
            AND T1.G_ID = T3.G_ID(+)
            AND T2.PARENT_CMS_ID = 'CMS004'
            AND T2.CMS_ID = IN_CMS_ID
            GROUP BY T2.CMS_NAME
            )
            ORDER BY RANK() OVER(ORDER BY SALES DESC)
            ;
            
        ELSIF IN_W_SHOW = 'A' THEN --��������Ǹ� Ư���帣 �Ǹűݾ�
            
            OPEN O_CUR FOR
            SELECT CMS_NAME, SALES, RANK() OVER(ORDER BY SALES DESC) AS RANK
            FROM(
            SELECT T2.CMS_NAME, SUM(NVL(T3.A_PROFIT,0)) AS SALES
            FROM GAMES_TBL T1, COMMONS_TBL T2, SALE_APPLYS_TBL T3
            WHERE T1.G_GENRE(+) = T2.CMS_ID
            AND T1.G_ID = T3.G_ID(+)
            AND T2.PARENT_CMS_ID = 'CMS004'
            AND T2.CMS_ID = IN_CMS_ID
            GROUP BY T2.CMS_NAME
            )
            ORDER BY RANK() OVER(ORDER BY SALES DESC)
            ;
            
        ELSE --�������Ǹ� Ư���帣 �Ǹűݾ�
            
            OPEN O_CUR FOR
            SELECT T1.CMS_NAME, SALES_S + SALES_A AS SALES, RANK() OVER(ORDER BY SALES_S + SALES_A DESC) AS RNAK
            FROM
            (
            SELECT T2.CMS_ID, T2.CMS_NAME, SUM(NVL(T3.S_PROFIT,0)) AS SALES_S
            FROM GAMES_TBL T1, COMMONS_TBL T2, SALES_TBL T3
            WHERE T1.G_GENRE(+) = T2.CMS_ID
            AND T1.G_ID = T3.G_ID(+)
            AND T2.PARENT_CMS_ID = 'CMS004'
            AND T2.CMS_ID = IN_CMS_ID
            GROUP BY T2.CMS_ID, T2.CMS_NAME
            ) T1,
            (
            SELECT T2.CMS_ID, T2.CMS_NAME, SUM(NVL(T3.A_PROFIT,0)) AS SALES_A
            FROM GAMES_TBL T1, COMMONS_TBL T2, SALE_APPLYS_TBL T3
            WHERE T1.G_GENRE(+) = T2.CMS_ID
            AND T1.G_ID = T3.G_ID(+)
            AND T2.PARENT_CMS_ID = 'CMS004'
            AND T2.CMS_ID = IN_CMS_ID
            GROUP BY T2.CMS_ID, T2.CMS_NAME
            ) T2
            WHERE T1.CMS_ID = T2.CMS_ID
            ORDER BY RANK() OVER(ORDER BY SALES_S + SALES_A DESC)
            ;
            
        END IF
        ;
    
    END IF
    ;
    END PROC_SALES_GENRE
    ;

/* �帣�� �Ǹűݾ� Ȯ�� ���ν��� �� */

END PKG_SALES_INFO;