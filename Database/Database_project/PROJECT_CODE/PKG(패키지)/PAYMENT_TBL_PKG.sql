--------------------------------------PKG_PAYMENT_TBL ��� ����
create or replace NONEDITIONABLE PACKAGE PKG_PAYMENT_TBL AS 

        PROCEDURE PROC_SELECT_PAYMENT
        (
                IN_PY_NAME                      VARCHAR2,
                IN_GROUP_NUM                    NUMBER,
                IN_PARENT_PY_ID                 VARCHAR2,
                O_CUR               OUT         SYS_REFCURSOR
        );

        PROCEDURE PROC_DELETE_PAYMENT
        (
                IN_PY_ID                        VARCHAR2
        );

      --����������̺� UPDATE ���ν��� ����
        PROCEDURE PROC_UPDATE_PAYMENT_TBL
      (
        IN_PY_ID            IN                  VARCHAR2,
        IN_PY_NAME          IN                  VARCHAR2,
        IN_GROUP_NUM        IN                  NUMBER,
        IN_PY_LVL           IN                  NUMBER,
        IN_PY_SEQ           IN                  NUMBER,
        IN_PY_DC_PER        IN                  NUMBER,
        IN_PARENT_PY_ID     IN                  VARCHAR2
        );
      --����������̺� UPDATE ���ν��� ��

        PROCEDURE PROC_INSERT_PAYMENT
        (
                IN_PY_NAME                 VARCHAR2,
                IN_GROUP_NUM               NUMBER,                
                IN_PY_LVL                  NUMBER,
                IN_PY_SEQ                  NUMBER,
                IN_PC_DC_PER               NUMBER,
                IN_PARENT_PY_ID            VARCHAR2
        );

END PKG_PAYMENT_TBL;

--------------------------------------PKG_PAYMENT_TBL ��� ��

--------------------------------------PKG_PAYMENT_TBL �ٵ� ����

create or replace NONEDITIONABLE PACKAGE BODY PKG_PAYMENT_TBL AS

  PROCEDURE PROC_SELECT_PAYMENT
        (
                IN_PY_NAME                      VARCHAR2,
                IN_GROUP_NUM                    NUMBER,
                IN_PARENT_PY_ID                 VARCHAR2,
                O_CUR               OUT         SYS_REFCURSOR
        ) 
  AS
    
  BEGIN
        
        IF IN_PARENT_PY_ID = 'PY001' THEN
            OPEN O_CUR FOR
            SELECT *
            FROM PAYMENT_TBL
            WHERE GROUP_NUM LIKE '%'|| IN_GROUP_NUM ||'%'
            ;
        ELSE
            OPEN O_CUR FOR
            SELECT *
            FROM PAYMENT_TBL
            WHERE PY_ID LIKE '%'|| IN_PY_NAME ||'%'
            ;
        END IF
        ;
       
        
        /*
        
        -- �˻��� �ο��� PY_ID�� �����´�
        SELECT PARENT_PY_ID
        INTO V_PARENT_PY_ID
        FROM PAYMENT_TBL
        WHERE PY_NAME IS NULL 
        ;
        
        -- �˻��� �ο��� GROUP_NUM�� �����´�
        SELECT GROUP_NUM
        INTO V_GROUP_NUM
        FROM PAYMENT_TBL
        WHERE PY_NAME =  IN_PY_NAME
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
                ELSIF IN_PY_NAME IS NULL THEN
                        OPEN O_CUR FOR                
                        SELECT *
                        FROM PAYMENT_TBL
                        ;
                ELSE
                        OPEN O_CUR FOR  
                        SELECT * 
                        FROM PAYMENT_TBL
                        WHERE PY_NAME LIKE '%' || IN_PY_NAME || '%'
                        ;
                END IF;
          */      
  END PROC_SELECT_PAYMENT;

  PROCEDURE PROC_DELETE_PAYMENT
        (
                IN_PY_ID                    VARCHAR2
        ) AS

                V_GROUP_NUM                 NUMBER;
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

    PROCEDURE PROC_UPDATE_PAYMENT_TBL
  (
    IN_PY_ID            IN      VARCHAR2,
    IN_PY_NAME          IN      VARCHAR2,
    IN_GROUP_NUM        IN      NUMBER,
    IN_PY_LVL           IN      NUMBER,
    IN_PY_SEQ           IN      NUMBER,
    IN_PY_DC_PER        IN      NUMBER,
    IN_PARENT_PY_ID     IN     VARCHAR2
  ) 
  AS
    V_PY_NAME       VARCHAR(30);
    V_PY_GROUP_NUM  NUMBER(2);
    V_PY_LVL        NUMBER(2);
    V_PY_SEQ        NUMBER(2);
    V_PY_DC_PER     NUMBER(3);
    V_PARENT_PY_ID  VARCHAR(15);
    
    -----------������Ʈ���� ���� �������� ����
    V_OLD_PY_GROUP_NUM  NUMBER(2);
    V_OLD_PY_LVL        NUMBER(2);
    V_OLD_PY_SEQ        NUMBER(2);
    
  BEGIN
    
    --NULL���� ������ ���־��� ���� �ְ� �ƴϸ� �ٲٴ� ���� �ִ´�
    SELECT CASE WHEN IN_PY_NAME IS NULL THEN PY_NAME
           ELSE IN_PY_NAME
           END
    INTO V_PY_NAME
    FROM PAYMENT_TBL
    WHERE PY_ID = IN_PY_ID
    ;
    
    SELECT CASE WHEN IN_GROUP_NUM IS NULL THEN GROUP_NUM
           ELSE IN_GROUP_NUM
           END
    INTO V_PY_GROUP_NUM
    FROM PAYMENT_TBL
    WHERE PY_ID = IN_PY_ID
    ;
    
    SELECT CASE WHEN IN_PY_LVL IS NULL THEN PY_LVL
           ELSE IN_PY_LVL
           END
    INTO V_PY_LVL
    FROM PAYMENT_TBL
    WHERE PY_ID = IN_PY_ID
    ;
    
    SELECT CASE WHEN IN_PY_SEQ IS NULL THEN PY_SEQ
           ELSE IN_PY_SEQ
           END
    INTO V_PY_SEQ
    FROM PAYMENT_TBL
    WHERE PY_ID = IN_PY_ID
    ;
    
    SELECT CASE WHEN IN_PY_DC_PER IS NULL THEN PY_DC_PER
           ELSE IN_PY_DC_PER
           END
    INTO V_PY_DC_PER
    FROM PAYMENT_TBL
    WHERE PY_ID = IN_PY_ID
    ;
    
    SELECT CASE WHEN IN_PARENT_PY_ID IS NULL THEN PARENT_PY_ID
           ELSE IN_PARENT_PY_ID
           END
    INTO V_PARENT_PY_ID
    FROM PAYMENT_TBL
    WHERE PY_ID = IN_PY_ID
    ;
    
    --������Ʈ�� ���� �����´�
    
    SELECT GROUP_NUM
    INTO V_OLD_PY_GROUP_NUM
    FROM PAYMENT_TBL
    WHERE PY_ID = IN_PY_ID
    ;
    
    SELECT PY_LVL
    INTO V_OLD_PY_LVL
    FROM PAYMENT_TBL
    WHERE PY_ID = IN_PY_ID
    ;
    
    SELECT PY_SEQ
    INTO V_OLD_PY_SEQ
    FROM PAYMENT_TBL
    WHERE PY_ID = IN_PY_ID
    ;
    
    
    --���� ������ ��� ������ �ٲ۴ٴ� �ǹ��̴�
    
    IF V_PY_LVL = V_OLD_PY_LVL AND V_PY_GROUP_NUM = V_OLD_PY_GROUP_NUM  THEN
        
        IF  V_PY_SEQ >= V_OLD_PY_SEQ THEN
        
        UPDATE PAYMENT_TBL
        SET PY_SEQ = PY_SEQ - 1
        WHERE PY_LVL = V_PY_LVL
        AND GROUP_NUM = V_PY_GROUP_NUM
        AND PY_SEQ <= V_PY_SEQ
        ;
        
        UPDATE PAYMENT_TBL
        SET PY_NAME  =    V_PY_NAME,
        PY_SEQ       =    V_PY_SEQ,
        PY_DC_PER    =    V_PY_DC_PER
        WHERE PY_ID = IN_PY_ID
        ;
        
        ----�������� 0���� ������ �ʱ����� ���
        
        UPDATE PAYMENT_TBL
        SET PY_SEQ = 1
        WHERE PY_SEQ = 0
        AND PY_LVL = V_PY_LVL
        AND GROUP_NUM = V_PY_GROUP_NUM
        ;
        
        ELSE 
        
        UPDATE PAYMENT_TBL
        SET PY_SEQ = PY_SEQ + 1
        WHERE PY_LVL = V_PY_LVL
        AND GROUP_NUM = V_PY_GROUP_NUM
        AND PY_SEQ <= V_PY_SEQ
        ;
        
        UPDATE PAYMENT_TBL
        SET PY_NAME  =    V_PY_NAME,
        PY_SEQ       =    V_PY_SEQ,
        PY_DC_PER    =    V_PY_DC_PER
        WHERE PY_ID = IN_PY_ID
        ;
        
        END IF;
        
    ELSE -- ������ �ٸ���� ������ �־��� ������ �������� �����������
        
        UPDATE PAYMENT_TBL
        SET PY_SEQ = PY_SEQ + 1
        WHERE PY_LVL = V_PY_LVL
        AND GROUP_NUM = V_PY_GROUP_NUM
        AND PY_SEQ >= V_PY_SEQ
        ;
    
        UPDATE PAYMENT_TBL
        SET PY_NAME  =    V_PY_NAME,
        GROUP_NUM    =    V_PY_GROUP_NUM,
        PY_LVL       =    V_PY_LVL,
        PY_SEQ       =    V_PY_SEQ,
        PY_DC_PER    =    V_PY_DC_PER,
        PARENT_PY_ID =    V_PARENT_PY_ID
        WHERE PY_ID = IN_PY_ID
        ;
        
        UPDATE PAYMENT_TBL
        SET PY_SEQ = PY_SEQ -1
        WHERE PY_LVL = V_OLD_PY_LVL
        AND GROUP_NUM = V_OLD_PY_GROUP_NUM
        AND PY_SEQ >= V_OLD_PY_SEQ
        ;
    
    END IF;
  END PROC_UPDATE_PAYMENT_TBL;

  PROCEDURE PROC_INSERT_PAYMENT
        (
                IN_PY_NAME                 VARCHAR2,
                IN_GROUP_NUM               NUMBER,                
                IN_PY_LVL                  NUMBER,
                IN_PY_SEQ                  NUMBER,
                IN_PC_DC_PER               NUMBER,
                IN_PARENT_PY_ID            VARCHAR2
        ) 
        AS

        V_PY_ID                 CHAR(5);
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

--------------------------------------PKG_PAYMENT_TBL �ٵ� ��