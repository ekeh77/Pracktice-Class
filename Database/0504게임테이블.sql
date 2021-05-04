create or replace NONEDITIONABLE PACKAGE BODY PKG_PAYMENT_TBL AS

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
    
    -----------업데이트전에 값을 가져가는 변수
    V_OLD_PY_GROUP_NUM  NUMBER(2);
    V_OLD_PY_LVL        NUMBER(2);
    V_OLD_PY_SEQ        NUMBER(2);
    
  BEGIN
    
    --NULL값을 넣으면 들어가있었던 값을 넣고 아니면 바꾸는 값을 넣는다
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
    
    --업데이트전 값을 가져온다
    
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
    
    
    --같은 레벨일 경우 순서만 바꾼다는 의미이다
    
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
        
        ----최저값을 0으로 만들지 않기위한 나의 노력
        
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
        
    ELSE -- 레벨이 다른경우 이전에 있었던 레벨의 시퀀스를 조정해줘야함
        
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

END PKG_PAYMENT_TBL;