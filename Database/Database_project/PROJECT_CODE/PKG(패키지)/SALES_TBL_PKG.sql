--------------------------------------PKG_SALES_TBL ������
create or replace NONEDITIONABLE PACKAGE PKG_SALES_TBL AS 

        PROCEDURE PROC_SELECT_SALES
        (
                IN_S_ID                        VARCHAR2,
                IN_G_ID                        VARCHAR2,
                IN_CT_ID                       VARCHAR2,
                IN_S_DATE                      DATE,
                IN_PY_ID                       VARCHAR2,
                IN_S_GET_POINT                 NUMBER,
                IN_S_USE_POINT                 NUMBER,
                IN_S_PROFIT                    VARCHAR2,
                IN_S_SHOW                      VARCHAR2,
                O_CUR               OUT        SYS_REFCURSOR
        );

        PROCEDURE PROC_DELETE_SALES
        (
                IN_S_ID                         VARCHAR2
        );

        PROCEDURE PROC_UPDATE_SALES
        (
                IN_G_ID                         VARCHAR2
        );

        PROCEDURE PROC_INSERT_SALES
        (
                IN_G_ID                     VARCHAR2,
                IN_CT_ID                    VARCHAR2,
                IN_S_DATE                   DATE,
                IN_PY_ID                    VARCHAR2,
                IN_S_USE_POINT              NUMBER,
                O_MSG           OUT         VARCHAR2
        );

END PKG_SALES_TBL;
--------------------------------------PKG_SALES_TBL ��峡

--------------------------------------PKG_SALES_TBL �ٵ����

create or replace NONEDITIONABLE PACKAGE BODY PKG_SALES_TBL AS

  PROCEDURE PROC_SELECT_SALES
        (
                IN_S_ID                        VARCHAR2,
                IN_G_ID                        VARCHAR2,
                IN_CT_ID                       VARCHAR2,
                IN_S_DATE                      DATE,
                IN_PY_ID                       VARCHAR2,
                IN_S_GET_POINT                 NUMBER,
                IN_S_USE_POINT                 NUMBER,
                IN_S_PROFIT                    VARCHAR2,
                IN_S_SHOW                      VARCHAR2,
                O_CUR               OUT        SYS_REFCURSOR
        ) AS
  BEGIN
        
        -- S_SHOW ���� 'Y'�� �����͸� ��ȸ�Ѵ�.
        /*
        OPEN O_CUR FOR
        SELECT *
        FROM SALES_TBL
        WHERE S_SHOW = 'Y'
                AND S_ID = IN_S_ID
                AND G_ID LIKE          '%' || IN_G_ID || '%'
                AND CT_ID LIKE         '%' || IN_CT_ID || '%'
                AND S_DATE LIKE        '%' || IN_S_DATE || '%'
                AND PY_ID LIKE         '%' || IN_PY_ID || '%'
                AND S_GET_POINT LIKE   '%' || IN_S_GET_POINT || '%'
                AND S_USE_POINT LIKE   '%' || IN_S_USE_POINT || '%'
                AND S_PROFIT LIKE      '%' || IN_S_PROFIT || '%'
        ;
        */
        
        IF IN_S_ID IS NULL 
            AND IN_G_ID IS NULL 
            AND IN_CT_ID IS NULL 
            AND IN_S_DATE IS NULL 
            AND IN_PY_ID IS NULL 
            AND IN_S_GET_POINT IS NULL 
            AND IN_S_USE_POINT IS NULL 
            AND IN_S_PROFIT IS NULL
            AND IN_S_SHOW IS NULL
            
            THEN
                OPEN O_CUR FOR
                SELECT T1.S_ID, T2.G_NAME, T3.CT_NAME, T1.S_DATE, T4.PY_NAME, T1.S_GET_POINT, T1.S_USE_POINT, T1.S_PROFIT
                FROM SALES_TBL T1, GAMES_TBL T2, CUSTOMERS_TBL T3, PAYMENT_TBL T4
                WHERE S_SHOW = 'Y'
                        AND T1.G_ID = T2.G_ID
                        AND T1.CT_ID = T3.CT_ID
                        AND T1.PY_ID = T4.PY_ID
                ;
            ELSE
                OPEN O_CUR FOR
                SELECT T1.S_ID, T2.G_NAME, T3.CT_NAME, T1.S_DATE, T4.PY_NAME, T1.S_GET_POINT, T1.S_USE_POINT, T1.S_PROFIT, T1.S_SHOW
                FROM SALES_TBL T1, GAMES_TBL T2, CUSTOMERS_TBL T3, PAYMENT_TBL T4
                WHERE  T1.G_ID = T2.G_ID
                        AND T1.CT_ID = T3.CT_ID
                        AND T1.PY_ID = T4.PY_ID
                        AND S_ID = IN_S_ID
                        AND T1.G_ID LIKE       '%' || IN_G_ID || '%'
                        AND T1.CT_ID LIKE      '%' || IN_CT_ID || '%'
                        AND S_DATE LIKE        '%' || IN_S_DATE || '%'
                        AND T1.PY_ID LIKE      '%' || IN_PY_ID || '%'
                        AND S_GET_POINT LIKE   '%' || IN_S_GET_POINT || '%'
                        AND S_USE_POINT LIKE   '%' || IN_S_USE_POINT || '%'
                        AND S_PROFIT LIKE      '%' || IN_S_PROFIT || '%'
                        AND S_SHOW = CASE 
                            WHEN IN_S_SHOW IS NULL THEN 'Y'
                            ELSE 'N'                        
                            END
                ;
                
            END IF;
        
  
  END PROC_SELECT_SALES;

  PROCEDURE PROC_DELETE_SALES
        (
                IN_S_ID         VARCHAR2
        ) AS
  BEGIN
        
        -- S_SHOW ���� 'N' ���� �����Ѵ�.
        UPDATE SALES_TBL
        SET S_SHOW = 'N'
        WHERE S_ID = IN_S_ID
        ;
    
  END PROC_DELETE_SALES;

  PROCEDURE PROC_UPDATE_SALES
        (
                IN_G_ID                     VARCHAR2
        ) AS
        
  BEGIN
  
        NULL;

  END PROC_UPDATE_SALES;

 PROCEDURE PROC_INSERT_SALES
        (
                IN_G_ID                     VARCHAR2,
                IN_CT_ID                    VARCHAR2,
                IN_S_DATE                   DATE,
                IN_PY_ID                    VARCHAR2,
                IN_S_USE_POINT              NUMBER,
                O_MSG           OUT         VARCHAR2
        ) AS
                V_S_ID                       CHAR(4);
                V_S_PROFIT                      NUMBER(7);
                V_PT_SCORE                      NUMBER(7);
                V_PT_ID_1                       CHAR(5);
                V_PT_ID_2                       CHAR(5);
                V_G_PRICE                       NUMBER;
                V_PY_DISCOUNT_PER               NUMBER;
                V_CT_POINT                      NUMBER;
                V_USE_POINT                     NUMBER;
                V_CT_USABLE_POINT               NUMBER;
                V_GAME_PURCHASE_PSBL            CHAR(1);
        
  BEGIN
  
        -- SALES_TBL�� SALE_APPLY_TBL�� S_ID������ ���ϰ� �� �߿� ���� ū ���� 1�� ���Ͽ� ���ο� S_ID ���� �����.
        
        SELECT 'S' || TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(S_ID),'S000'), 2)) + 1, 'FM000')
        INTO V_S_ID
        FROM SALES_TBL
        ;
        
        -- PT_ID�� �ִ񰪿� 1�� ���Ͽ� ���ο� PT_ID���� �����.
        SELECT 'PT' || TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(PT_ID), 'PT000'), 3)) + 1, 'FM000')
        INTO V_PT_ID_1
        FROM POINT_TBL
        ;
        
        -- PT_ID�� �ִ񰪿� 2�� ���Ͽ� ���ο� PT_ID���� �����.
        -- ����Ʈ�� ����� ��쿡�� �����Ѵ�.
        SELECT 'PT' || TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(PT_ID), 'PT000'), 3)) + 2, 'FM000')
        INTO V_PT_ID_2
        FROM POINT_TBL
        ;
        
        -- ���� ������ �ִ� ����Ʈ�� ���Ѵ�.
        SELECT CT_POINT
        INTO V_CT_POINT
        FROM CUSTOMERS_TBL
        WHERE CT_ID = IN_CT_ID
        ;
        
        -- ���� SALE_APPLYS_TBL���� ����� ����Ʈ�� ���Ѵ�.
        SELECT NVL(SUM(A_USE_POINT), 0)
        INTO V_USE_POINT
        FROM SALE_APPLYS_TBL
        WHERE CT_ID = IN_CT_ID
        ;
        
        -- V_CT_POINT���� V_USE_POINT�� ����. ���� ���� ����� �� �ִ� ����Ʈ�� ���Ѵ�.
        SELECT V_CT_POINT - V_USE_POINT
        INTO V_CT_USABLE_POINT
        FROM DUAL
        ;
        
        -- ������ ������ ���Ű����� ������ ���θ� �Ǵ��Ѵ�.
        SELECT G_SHOW
        INTO V_GAME_PURCHASE_PSBL
        FROM GAMES_TBL
        WHERE G_ID = IN_G_ID
        ;
        
        -- 1. GAMES_TBL���� ���� �ǸŰ��� �����´�  
        SELECT G_SALES_PRICE
        INTO V_G_PRICE
        FROM GAMES_TBL
        WHERE G_ID = IN_G_ID
        ; 
        
        -- 2. �������� ���Ѵ�.
        SELECT PY_DC_PER
        INTO V_PY_DISCOUNT_PER
        FROM PAYMENT_TBL
        WHERE PY_ID = IN_PY_ID
        ;
        
        -- ���� �����ϴٸ� ���Ÿ� �����Ѵ�.
        IF V_GAME_PURCHASE_PSBL = 'Y'
            THEN
                -- �� ����ϴ� ����Ʈ�� ���� ���� ���� ����Ʈ���� ����߸� ������ ������ �� �ִ�.
                IF IN_S_USE_POINT > V_CT_USABLE_POINT
                    THEN
                        O_MSG := '�ִ� ��밡���� ����Ʈ�� ' || V_CT_USABLE_POINT || '���Դϴ�.';
                    ELSE
                        -- 3. �Ѿ׿��� ����� ����Ʈ�� ���� ���Ⱚ�� ���Ѵ�.
                        SELECT ((V_G_PRICE * (100 - V_PY_DISCOUNT_PER)) / 100) - NVL(IN_S_USE_POINT, 0)
                        INTO V_S_PROFIT
                        FROM DUAL;
                                
                        -- 4. SALES TABLE�� INSERT �Ѵ�.
                        INSERT INTO SALES_TBL
                        (S_ID, G_ID, CT_ID, S_DATE, PY_ID, S_GET_POINT, S_USE_POINT, S_PROFIT)
                        VALUES
                        (V_S_ID, IN_G_ID, IN_CT_ID, IN_S_DATE, IN_PY_ID, 5, NVL(IN_S_USE_POINT, 0), V_S_PROFIT)
                        ;
        
                        -- 5. POINT_TBL�� ����  �������� ������ ��� Ʈ���Ű� �ߵ��ǰ� ����ȴ�
                       
                    END IF;
                    
            -- ���� ������ ������ �ƴҶ� �޽����� ����Ѵ�.
            ELSE
                O_MSG := '�ش� ������ ���� �Ǹ����� �����Դϴ�.����Ⱓ�� ���� ��û�� ���ּ���';
            END IF;

  END PROC_INSERT_SALES;

END PKG_SALES_TBL;

--------------------------------------PKG_SALES_TBL �ٵ�