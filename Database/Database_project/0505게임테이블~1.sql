create or replace NONEDITIONABLE PACKAGE PKG_RESERVATION_GAMES_TBL AS 
        
        PROCEDURE PROC_SELECT_RESERVATION
        (
                IN_G_ID                                       VARCHAR2,
                IN_G_NAME                                  VARCHAR2,
                IN_G_MAKER                              VARCHAR2,
                IN_G_GENRE                               VARCHAR2,
                IN_G_R_BEGINDATE                  DATE,
                IN_G_R_RELEASE                           DATE,
                IN_G_R_DISCOUNT_PER            NUMBER,
                IN_G_R_SUPPLY_PRICE                   NUMBER,
                IN_G_R_SALES_PRICE                    NUMBER,
                O_CUR           OUT             SYS_REFCURSOR
        );
        
        PROCEDURE PROC_DELETE_RESERVATION
        (
                IN_G_ID         VARCHAR2
        );
        
        PROCEDURE PROC_UPDATE_RESERVATION
        (
                IN_G_ID                           VARCHAR2,
                IN_G_NAME                        VARCHAR2,
                IN_G_MAKER                     VARCHAR2,
                IN_G_GENRE                       VARCHAR2,
                IN_G_R_BEGINDATE            DATE,
                IN_G_R_RELEASE                  DATE,
                IN_G_R_DISCOUNT_PER     NUMBER,
                IN_G_R_SUPPLY_PRICE         NUMBER,
                IN_G_R_SALES_PRICE              NUMBER
        );
        
        PROCEDURE PROC_INSERT_RESERVATION
        (
                IN_G_NAME                        VARCHAR2,
                IN_G_MAKER                     VARCHAR2,
                IN_G_GENRE                       VARCHAR2,
                IN_G_R_REGINDATE            DATE,
                IN_G_R_RELEASE                  DATE,
                IN_G_R_SUPPLY_PRICE         NUMBER,
                IN_G_R_SALES_PRICE              NUMBER
        );

END PKG_RESERVATION_GAMES_TBL;
------------------------------
create or replace NONEDITIONABLE PACKAGE BODY PKG_RESERVATION_GAMES_TBL AS

  PROCEDURE PROC_SELECT_RESERVATION
        (
                IN_G_ID                                       VARCHAR2,
                IN_G_NAME                                  VARCHAR2,
                IN_G_MAKER                              VARCHAR2,
                IN_G_GENRE                               VARCHAR2,
                IN_G_R_BEGINDATE                  DATE,
                IN_G_R_RELEASE                           DATE,
                IN_G_R_DISCOUNT_PER            NUMBER,
                IN_G_R_SUPPLY_PRICE                   NUMBER,
                IN_G_R_SALES_PRICE                    NUMBER,
                O_CUR           OUT             SYS_REFCURSOR
        ) AS
  BEGIN
        
        -- G_R_SHOW�� ���� 'Y' �� �����͸� ���δ�.
        OPEN O_CUR FOR
        SELECT *
        FROM RESERVATION_GAMES_TBL
        WHERE G_R_SHOW = 'Y'
                AND G_ID= IN_G_ID
                AND G_NAME LIKE '%' || IN_G_NAME || '%'
                AND G_MAKER LIKE '%' || IN_G_MAKER || '%'
                AND G_GENRE LIKE '%' || IN_G_GENRE || '%'
                AND G_R_BEGINDATE LIKE '%' || IN_G_R_BEGINDATE || '%'
                AND G_R_RELEASE LIKE '%' || IN_G_R_RELEASE || '%'
                AND G_R_DISCOUNT_PER LIKE '%' || IN_G_R_DISCOUNT_PER || '%'
                AND G_R_SUPPLY_PRICE LIKE '%' || IN_G_R_SUPPLY_PRICE || '%'
                AND G_R_SALES_PRICE LIKE '%' || IN_G_R_SALES_PRICE || '%'
        ;
        
        /*
        -- G_MAKER�� G_GENRE�� ǥ���Ѵ�.
        SELECT T1.G_ID, T1.G_NAME, T3.CMS_NAME, T4.CMS_NAME, T1.G_R_BEGINDATE, T1.G_R_RELEASE, T1.G_R_DISCOUNT_PER, T1.G_R_SUPPLT_PRICE, T1.G_R_SALES_PRICE
        FROM RESERVATION_GAMES_TBL T1, COMMONS_TBL T2, COMMONS_TBL T3
        WHERE T1.GID= T2.GID 
                AND T1.G_MAKER = T2.CMS_ID
                AND T1.G_GENRE = T3.CMS_ID
                AND G_ID LIKE '%' || IN_G_ID || '%'
                AND G_NAME LIKE '%' || IN_G_NAME || '%'
                AND G_MAKER LIKE '%' || IN_G_MAKER || '%'
                AND G_GENRE LIKE '%' || IN_G_GENRE || '%'
                AND G_R_BEGINDATE LIKE '%' || IN_G_R_BEGINDATE || '%'
                AND G_R_RELEASE LIKE '%' || IN_G_R_RELEASE || '%'
                AND G_R_DISCOUNT_PER LIKE '%' || IN_G_R_DISCOUNT_PER || '%'
                AND G_R_SUPPLY_PRICE LIKE '%' || IN_G_R_SUPPLY_PRICE || '%'
                AND G_R_SALES_PRICE LIKE '%' || IN_G_R_SALES_PRICE || '%'
        ;
        */

  END PROC_SELECT_RESERVATION;

  PROCEDURE PROC_DELETE_RESERVATION
        (
                IN_G_ID         VARCHAR2
        ) AS
  BEGIN
  
        -- G_R_SHOW�� ���� 'N'���� �����Ѵ�.
        UPDATE RESERVATION_GAMES_TBL
        SET G_R_SHOW = 'N'
        WHERE G_ID = IN_G_ID
        ;
        /*
        -- SALE_APPLYS_TBL���� A_SHOW�� ���� 'N'���� �����Ѵ�.
        UPDATE SALE_APPLYS_TBL
        SET A_SHOW = 'N'
        WHERE G_ID = IN_G_ID
        ;
        */
        
  END PROC_DELETE_RESERVATION;

  PROCEDURE PROC_UPDATE_RESERVATION
        (
                IN_G_ID                           VARCHAR2,
                IN_G_NAME                        VARCHAR2,
                IN_G_MAKER                     VARCHAR2,
                IN_G_GENRE                       VARCHAR2,
                IN_G_R_BEGINDATE            DATE,
                IN_G_R_RELEASE                  DATE,
                IN_G_R_DISCOUNT_PER     NUMBER,
                IN_G_R_SUPPLY_PRICE         NUMBER,
                IN_G_R_SALES_PRICE              NUMBER
        ) AS
        
                V_G_NAME                        VARCHAR2(200);
                V_G_MAKER                     CHAR(6);
                V_G_GENRE                       CHAR(6);
                V_G_R_BEGINDATE            DATE;
                V_G_R_RELEASE                  DATE;
                V_G_R_DISCOUNT_PER     NUMBER;
                V_G_R_SUPPLY_PRICE         NUMBER;
                V_G_R_SALES_PRICE              NUMBER;
        
  BEGIN
        -- IN_G_NAME�� �Է°��� ���ٸ� ������ ���� �����ϰ�, �Է°��� �ִٸ� �Է°��� �����Ѵ�.
        IF IN_G_NAME IS NULL
                THEN
                        SELECT G_NAME
                        INTO V_G_NAME
                        FROM RESERVATION_GAMES_TBL
                        WHERE G_ID = IN_G_ID
                        ;
                ELSE
                        V_G_NAME := IN_G_NAME;
                END IF;
                
        -- IN_G_MAKER�� �Է°��� ���ٸ� ������ ���� �����ϰ�, �Է°��� �ִٸ� �Է°��� �����Ѵ�.                
        IF IN_G_MAKER IS NULL
                THEN
                        SELECT G_MAKER
                        INTO V_G_MAKER
                        FROM RESERVATION_GAMES_TBL
                        WHERE G_ID = IN_G_ID
                        ;
                ELSE
                        V_G_MAKER := IN_G_MAKER;
                END IF;
                
        -- IN_G_GENRE�� �Է°��� ���ٸ� ������ ���� �����ϰ�, �Է°��� �ִٸ� �Է°��� �����Ѵ�.                                
        IF IN_G_GENRE IS NULL
                THEN
                        SELECT G_GENRE
                        INTO V_G_GENRE
                        FROM RESERVATION_GAMES_TBL
                        WHERE G_ID = IN_G_ID
                        ;
                ELSE
                        V_G_GENRE := IN_G_GENRE;
                END IF;
                
        -- IN_G_R_BEGINDATE�� �Է°��� ���ٸ� ������ ���� �����ϰ�, �Է°��� �ִٸ� �Է°��� �����Ѵ�.                
        IF IN_G_R_BEGINDATE IS NULL
                THEN
                        SELECT G_R_BEGINDATE
                        INTO V_G_R_BEGINDATE
                        FROM RESERVATION_GAMES_TBL
                        WHERE G_ID = IN_G_ID
                        ;
                ELSE
                        V_G_R_BEGINDATE := IN_G_R_BEGINDATE;
                END IF;

        -- IN_G_R_RELEASE�� �Է°��� ���ٸ� ������ ���� �����ϰ�, �Է°��� �ִٸ� �Է°��� �����Ѵ�.                
        IF IN_G_R_RELEASE IS NULL
                THEN
                        SELECT G_R_RELEASE
                        INTO V_G_R_RELEASE
                        FROM RESERVATION_GAMES_TBL
                        WHERE G_ID = IN_G_ID
                        ;
                ELSE
                        V_G_R_RELEASE := IN_G_R_RELEASE;
                END IF;
                
        -- IN_G_R_DISCOUNT_PER�� �Է°��� ���ٸ� ������ ���� �����ϰ�, �Է°��� �ִٸ� �Է°��� �����Ѵ�.                                
        IF IN_G_R_DISCOUNT_PER IS NULL
                THEN
                        SELECT G_R_DISCOUNT_PER
                        INTO V_G_R_DISCOUNT_PER
                        FROM RESERVATION_GAMES_TBL
                        WHERE G_ID = IN_G_ID
                        ;
                ELSE
                        V_G_R_DISCOUNT_PER := IN_G_R_DISCOUNT_PER;
                END IF;
                
        -- IN_G_R_SUPPLY_PRICE�� �Է°��� ���ٸ� ������ ���� �����ϰ�, �Է°��� �ִٸ� �Է°��� �����Ѵ�.                                
        IF IN_G_R_SUPPLY_PRICE IS NULL
                THEN
                        SELECT G_R_SUPPLY_PRICE
                        INTO V_G_R_SUPPLY_PRICE
                        FROM RESERVATION_GAMES_TBL
                        WHERE G_ID = IN_G_ID
                        ;
                ELSE
                        V_G_R_SUPPLY_PRICE := IN_G_R_SUPPLY_PRICE;
                END IF;
                
        -- IN_G_R_SALES_PRICE�� �Է°��� ���ٸ� ������ ���� �����ϰ�, �Է°��� �ִٸ� �Է°��� �����Ѵ�.                                
        IF IN_G_R_SALES_PRICE IS NULL
                THEN
                        SELECT G_R_SALES_PRICE
                        INTO V_G_R_SALES_PRICE
                        FROM RESERVATION_GAMES_TBL
                        WHERE G_ID = IN_G_ID
                        ;
                ELSE
                        V_G_R_SALES_PRICE := IN_G_R_SALES_PRICE;
                END IF;
                
        -- ����� ���� ������ IN_G_ID�� �����͸� ������Ʈ�Ѵ�.
        UPDATE RESERVATION_GAMES_TBL
        SET G_NAME = V_G_NAME, 
                G_MAKER = V_G_MAKER, 
                G_GENRE = V_G_GENRE, 
                G_R_BEGINDATE = V_G_R_BEGINDATE, 
                G_R_RELEASE = V_G_R_RELEASE, 
                G_R_DISCOUNT_PER = V_G_R_DISCOUNT_PER, 
                G_R_SUPPLY_PRICE = V_G_R_SUPPLY_PRICE, 
                G_R_SALES_PRICE = V_G_R_SALES_PRICE
        WHERE G_ID = IN_G_ID
        ;
                

  END PROC_UPDATE_RESERVATION;

  PROCEDURE PROC_INSERT_RESERVATION
        (
                IN_G_NAME                        VARCHAR2,
                IN_G_MAKER                     VARCHAR2,
                IN_G_GENRE                       VARCHAR2,
                IN_G_R_REGINDATE            DATE,
                IN_G_R_RELEASE                  DATE,
                IN_G_R_SUPPLY_PRICE         NUMBER,
                IN_G_R_SALES_PRICE              NUMBER
        ) AS
        
        V_G_ID              CHAR(4);
        
  BEGIN
  
        -- ���ο� G_ID�� �ο��Ѵ�.
        SELECT 'G' || TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(G_ID), 'G000'), 2)) + 1, 'FM000')
        INTO V_G_ID
        FROM RESERVATION_GAMES_TBL
        ;
        
        -- ���ο� �����͸� �����Ѵ�.
        INSERT INTO RESERVATION_GAMES_TBL
        (G_ID, G_NAME, G_MAKER, G_GENRE, G_R_BEGINDATE, G_R_RELEASE, G_R_SUPPLY_PRICE, G_R_SALES_PRICE)
        VALUES
        (V_G_ID, IN_G_NAME, IN_G_MAKER, IN_G_GENRE, IN_G_R_REGINDATE, IN_G_R_RELEASE, IN_G_R_SUPPLY_PRICE, IN_G_R_SALES_PRICE)
        ;

  END PROC_INSERT_RESERVATION;

END PKG_RESERVATION_GAMES_TBL;


----------------------------------------RESERVATION_GAMES_TBL

create or replace NONEDITIONABLE PACKAGE PKG_PAYMENT_TBL AS 

        PROCEDURE PROC_SELECT_PAYMENT
        (
                IN_PY_NAME         VARCHAR2,
                O_CUR           OUT         SYS_REFCURSOR
        );
        
        PROCEDURE PROC_DELETE_PAYMENT
        (
                IN_PY_ID         VARCHAR2
        );
        
        PROCEDURE PROC_UPDATE_PAYMENT
        (
                IN_PY_ID         VARCHAR2
        );
        
        PROCEDURE PROC_INSERT_PAYMENT
        (
                IN_PY_NAME                 VARCHAR2,
                IN_GROUP_NUM            NUMBER,                
                IN_PY_LVL                        NUMBER,
                IN_PY_SEQ                        NUMBER,
                IN_PC_DC_PER                    NUMBER,
                IN_PARENT_PY_ID            VARCHAR2
        );

END PKG_PAYMENT_TBL;

--------------------------------------------------------

create or replace NONEDITIONABLE PACKAGE BODY PKG_PAYMENT_TBL AS

  PROCEDURE PROC_SELECT_PAYMENT
        (
                IN_PY_NAME         VARCHAR2,
                O_CUR           OUT         SYS_REFCURSOR
        ) AS
        
                V_PARENT_PY_ID              VARCHAR(10);
                V_GROUP_NUM                 NUMBER;
        
  BEGIN
        -- �˻��� �ο��� PY_ID�� �����´�
        SELECT PARENT_PY_ID
        INTO V_PARENT_PY_ID
        FROM PAYMENT_TBL
        WHERE PY_NAME = IN_PY_NAME
        ;
        -- �˻��� �ο��� GROUP_NUM�� �����´�
        SELECT GROUP_NUM
        INTO V_GROUP_NUM
        FROM PAYMENT_TBL
        WHERE PY_NAME = IN_PY_NAME
        ;        
  
        -- ī��, ����, ������� �˻��Ҷ��� �ش� ī�װ� ��ü�� ��Ÿ����.
        -- Ư�� �̸��� �˻��Ҷ��� �ش� ���ҹ���� ��Ÿ����.
        IF V_PARENT_PY_ID = 'PY001'
                THEN
                        OPEN O_CUR FOR                
                        SELECT *
                        FROM PAYMENT_TBL
                        WHERE GROUP_NUM = V_GROUP_NUM
                        ;
                ELSE
                        OPEN O_CUR FOR  
                        SELECT * 
                        FROM PAYMENT_TBL
                        WHERE PY_NAME = IN_PY_NAME
                        ;
                END IF;
        
  END PROC_SELECT_PAYMENT;

  PROCEDURE PROC_DELETE_PAYMENT
        (
                IN_PY_ID         VARCHAR2
        ) AS
        
                V_GROUP_NUM         NUMBER;
                V_PY_LVL                    NUMBER;
                V_PY_SEQ                    NUMBER;
        
  BEGIN
        
        -- �����ϴ� �������� GROUP_NUM
        SELECT GROUP_NUM
        INTO V_GROUP_NUM
        FROM PAYMENT_TBL
        WHERE PY_ID = IN_PY_ID
        ;
        
        -- �����ϴ� �������� PY_LVL
        SELECT PY_LVL
        INTO V_PY_LVL
        FROM PAYMENT_TBL
        WHERE PY_ID = IN_PY_ID
        ;
        
        -- �����ϴ� �������� PY_SEQ
        SELECT PY_SEQ
        INTO V_PY_SEQ
        FROM PAYMENT_TBL
        WHERE PY_ID = IN_PY_ID
        ;
        
        -- IN_PY_ID�� �Էµ� �����͸� �����Ѵ�.
        DELETE PAYMENT_TBL
        WHERE PY_ID = IN_PY_ID
        ;
        
        -- �����ϴ� �����ͺ��� ������ ���� ū �������� ������ ���� 1�� ���δ�.
        UPDATE PAYMENT_TBL
        SET PY_SEQ = PY_SEQ - 1
        WHERE GROUP_NUM = V_GROUP_NUM
                AND PY_LVL = V_PY_LVL
                AND PY_SEQ > V_PY_SEQ
        ;
  
  END PROC_DELETE_PAYMENT;

  PROCEDURE PROC_UPDATE_PAYMENT
        (
                IN_PY_ID         VARCHAR2
        ) AS
  BEGIN
  
        NULL;

  END PROC_UPDATE_PAYMENT;

  PROCEDURE PROC_INSERT_PAYMENT
        (
                IN_PY_NAME                 VARCHAR2,
                IN_GROUP_NUM            NUMBER,                
                IN_PY_LVL                        NUMBER,
                IN_PY_SEQ                        NUMBER,
                IN_PC_DC_PER                    NUMBER,
                IN_PARENT_PY_ID            VARCHAR2
        ) 
        AS
        
        V_PY_ID             CHAR(5);
        V_CHK_GROUP_NUM         NUMBER(1);
        
        BEGIN
                
                -- ���ο� PY_ID�� �ο��Ѵ�.
                SELECT 'PY' || TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(PY_ID), 'PY000'), 3)) + 1, 'FM000')
                INTO V_PY_ID
                FROM PAYMENT_TBL
                ;
                
                SELECT COUNT(*)
                INTO V_CHK_GROUP_NUM
                FROM PAYMENT_TBL
                WHERE GROUP_NUM = IN_GROUP_NUM
                ;
                
                -- ������ ���� �߰��� ���Եȴٸ�, ������ ���� ����������.
                -- ���ԵǴ� ������ ������ ũ�ų� ���� ���� +1 ���־�� ��ġ�� ����.
                UPDATE PAYMENT_TBL
                SET PY_SEQ = PY_SEQ + 1
                WHERE GROUP_NUM = IN_GROUP_NUM
                        AND PY_LVL = IN_PY_LVL
                        AND PY_SEQ >= IN_PY_SEQ;

                                
        
                -- ���ο� �����͸� �����Ѵ�.
                INSERT INTO PAYMENT_TBL
                (PY_ID, PY_NAME, GROUP_NUM, PY_LVL, PY_SEQ, PY_DC_PER, PARENT_PY_ID)
                VALUES
                (V_PY_ID, IN_PY_NAME, IN_GROUP_NUM, IN_PY_LVL, IN_PY_SEQ, IN_PC_DC_PER, IN_PARENT_PY_ID)
                ;

  END PROC_INSERT_PAYMENT;

END PKG_PAYMENT_TBL;

--------------------------------------------------PAYMENT_TBL

create or replace NONEDITIONABLE PACKAGE PKG_SALES_TBL AS 

        PROCEDURE PROC_SELECT_SALES
        (
                IN_S_ID                          VARCHAR2,
                IN_G_ID                        VARCHAR2,
                IN_CT_ID                      VARCHAR2,
                IN_S_DATE                  DATE,
                IN_PY_ID                       VARCHAR2,
                IN_S_GET_POINT         NUMBER,
                IN_S_USE_POINT         NUMBER,
                IN_S_PROFIT         VARCHAR2,
                O_CUR           OUT             SYS_REFCURSOR
        );
        
        PROCEDURE PROC_DELETE_SALES
        (
                IN_S_ID         VARCHAR2
        );
        
        PROCEDURE PROC_UPDATE_SALES
        (
                IN_G_ID                     VARCHAR2
        );
        
        PROCEDURE PROC_INSERT_SALES
        (
                IN_G_ID                     VARCHAR2,
                IN_CT_ID                   VARCHAR2,
                IN_S_DATE                DATE,
                IN_PY_ID                    VARCHAR2,
                IN_S_USE_POINT     NUMBER,
                IN_S_SHOW                   VARCHAR2
        );

END PKG_SALES_TBL;

----------------------------------------------------------

create or replace NONEDITIONABLE PACKAGE BODY PKG_SALES_TBL AS

  PROCEDURE PROC_SELECT_SALES
        (
                IN_S_ID                          VARCHAR2,
                IN_G_ID                        VARCHAR2,
                IN_CT_ID                      VARCHAR2,
                IN_S_DATE                  DATE,
                IN_PY_ID                       VARCHAR2,
                IN_S_GET_POINT         NUMBER,
                IN_S_USE_POINT         NUMBER,
                IN_S_PROFIT         VARCHAR2,
                O_CUR           OUT             SYS_REFCURSOR
        ) AS
  BEGIN
        
        -- S_SHOW ���� 'Y'�� �����͸� ��ȸ�Ѵ�.
        OPEN O_CUR FOR
        SELECT *
        FROM SALES_TBL
        WHERE S_SHOW = 'Y'
                AND S_ID = IN_S_ID
                AND G_ID LIKE   '%' || IN_G_ID || '%'
                AND CT_ID LIKE   '%' || IN_CT_ID || '%'
                AND S_DATE LIKE   '%' || IN_S_DATE || '%'
                AND PY_ID LIKE   '%' || IN_PY_ID || '%'
                AND S_GET_POINT LIKE   '%' || IN_S_GET_POINT || '%'
                AND S_USE_POINT LIKE   '%' || IN_S_USE_POINT || '%'
                AND S_PROFIT LIKE   '%' || IN_S_PROFIT || '%'
        ;
        /*
        OPEN O_CUR FOR
        SELECT T1.S_ID, T2.G_NAME, T3.CT_NAME, T1.S_DATE, T4.PY_NAME, T1.S_GET_POINT, T1.S_USE_POINT, T1.S_PROFIT
        FROM SALES_TBL T1, GAMES_TBL T2, CUSTOMERS_TBL T3, PAYMENT_TBL T4
        WHERE S_SHOW = 'Y'
                AND T1.G_ID = T2.G_ID
                AND T1.CT_ID = T3.CT_ID
                AND T1.PY_ID = T4.PY_ID
                AND S_ID = IN_S_ID
                AND G_ID LIKE   '%' || IN_G_ID || '%'
                AND CT_ID LIKE   '%' || IN_CT_ID || '%'
                AND S_DATE LIKE   '%' || IN_S_DATE || '%'
                AND PY_ID LIKE   '%' || IN_PY_ID || '%'
                AND S_GET_POINT LIKE   '%' || IN_S_GET_POINT || '%'
                AND S_USE_POINT LIKE   '%' || IN_S_USE_POINT || '%'
                AND S_PROFIT LIKE   '%' || IN_S_PROFIT || '%'
        ;
        */
  
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
                IN_CT_ID                   VARCHAR2,
                IN_S_DATE                DATE,
                IN_PY_ID                    VARCHAR2,
                IN_S_USE_POINT     NUMBER,
                IN_S_SHOW                   VARCHAR2
        ) AS
        
                V_S_ID                               CHAR(4);
                V_S_PROFIT                      NUMBER(2);
                V_PT_SCORE                      NUMBER(2);
                V_PT_ID_1                             CHAR(5);
                V_PT_ID_2                           CHAR(5);
        
  BEGIN
  
        /*
        -- S_ID�� �ִ񰪿� 1�� ���Ͽ� ���ο� S_ID���� �����.
        SELECT 'S' || TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(S_ID), 'S000'), 2)) + 1, 'FM000')
        INTO V_S_ID
        FROM SALES_TBL
        ;
        
        -- PT_ID�� �ִ񰪿� 1�� ���Ͽ� ���ο� PT_ID���� �����.
        SELECT 'S' || TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(PT_ID), 'PT000'), 3)) + 1, 'FM000')
        INTO V_PT_ID_1
        FROM POINT)TBL
        ;
        
        -- PT_ID�� �ִ񰪿� 2�� ���Ͽ� ���ο� PT_ID���� �����.
        -- ����Ʈ�� ����� ��쿡�� �����Ѵ�.
        SELECT 'S' || TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(PT_ID), 'PT000'), 3)) + 2, 'FM000')
        INTO V_PT_ID_2
        FROM POINT)TBL
        ;
        

        -- 1. GAMES_TBL���� ���� �ǸŰ��� �����´�        
        -- 2. �������� �����Ѵ�.
        -- 3. �Ѿ׿��� ����� ����Ʈ�� ���� ���Ⱚ�� ���Ѵ�.
        SELECT ((T1.G_SALES_PRICE * (100 - T3.PY_DC_PER)) / 100) - NVL(T2.S_USE_POINT, 0)
        INTO V_S_PROFIT
        FROM GAME_TBL T1, SALES_TBL T2, PAYMENT_TBL T3
        WHERE T1.G_ID = T2.G_ID 
                AND T2.PY_ID = T3.PY_ID
                AND G_ID = IN_G_ID
        ;
        
        -- 4. SALES TABLE�� INSERT �Ѵ�.
        INSERT INTO SALES_TBL
        (S_ID, G_ID, CT_ID, S_DATE, PY_ID, S_GET_POINT, S_USE_POINT, S_PROFIT)
        VALUES
        (V_S_ID, IN_G_ID, IN_CT_ID, IN_S_DATE, IN_PY_ID, 5, IN_S_USE_POINT, V_S_PROFIT)
        ;

        -- 5. ������ 5%�� ���������� ���Ѵ�.
        SELECT V_S_PROFIT * 5 / 100
        INTO V_PT_SCORE
        FROM DUAL;
       
        -- 6. ����Ʈ�� ����� ��쿡, ���� �������� POINT_TBL�� �����ϰ� ����� �縸ŭ POINT_TBL�� �����͸� �����.
        -- �׷��� ���� ��쿡�� ������ �Ѵ�.
        IF IN_S_USE_POINT IS NOT NULL
                THEN 
                        INSERT INTO POINT_TBL
                        (PT_ID, S_ID, CT_ID, PT_SCORE, PT_DATE, ����, P_SHOW)
                        VALUES
                        (V_PT_ID, V_S_ID, IN_CT_ID, V_PT_SCORE, IN_S_DATE, ����(����), Y)
                        ;
                        
                        INSERT INTO POINT_TBL
                        (PT_ID, S_ID, CT_ID, PT_SCORE, PT_DATE, ����, P_SHOW)
                        VALUES
                        (V_PT_ID_2, V_S_ID, IN_CT_ID, IN_S_USE_POINT, IN_S_DATE, ����(���), Y)
                        ;
                ELSE
                        INSERT INTO POINT_TBL
                        (PT_ID, S_ID, CT_ID, PT_SCORE, PT_DATE, ����, P_SHOW)
                        VALUES
                        (V_PT_ID, V_S_ID, IN_CT_ID, V_PT_SCORE, IN_S_DATE, ����(����), Y)
                        ;
                        
                END IF;

        */
        
        NULL;

  END PROC_INSERT_SALES;

END PKG_SALES_TBL;

---------------------------------------------------------PKG_SALES_TBL