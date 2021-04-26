DROP TABLE BOARDS;

CREATE TABLE BOARDS
(
    IDX     NUMBER(5)       PRIMARY KEY,
    TITLE   VARCHAR2(100)   NOT NULL,
    G_NUM   NUMBER(5)       NOT NULL, --GROUP NUMBER
    O_NUM   NUMBER(5)       NOT NULL  --ORDER BY NUMBER
);

--DELETE FROM BOARDS;
--COMMIT;

SELECT LPAD(TITLE, LENGTH(TITLE)+L_NUM,' ') FROM BOARDS
ORDER BY G_NUM DESC, O_NUM ASC
;

  PROCEDURE PROC_SEL_BOARDS
  (
    IN_IDX      IN      NUMBER,
    IN_TITLE    IN      VARCHAR2,
    O_CUR       OUT     SYS_REFCURSOR
  ) AS
  BEGIN
  
    OPEN O_CUR FOR
    SELECT * FROM BOARDS
    ORDER BY G_NUM DESC, O_NUM ASC
    ;
    
    
  END PROC_SEL_BOARDS
  ;

  PROCEDURE PROC_INS_BOARDS
  (
    IN_TITLE    IN      VARCHAR2, --클라이언트 적어준 타이틀
    IN_G_NUM    IN      NUMBER,   --클라이언트가 선택한 글의 G_NUM
    IN_O_NUM    IN      NUMBER    --클라이언트가 선택한 글의 O_NUM
  )
  AS
  
    V_IDX           NUMBER(5);
    V_G_NUM         NUMBER(5);
    V_O_NUM         NUMBER(5);
    
  BEGIN
    
    --0. V_IDX 새글이던 답글이던 PARIMARY KEY
    
    SELECT NVL(MAX(IDX), 0) + 1
    INTO V_IDX
    FROM BOARDS
    ;
    
    --1. 새글이냐 답글이냐 판단부터 하자
    
  
    
    IF IN_G_NUM IS NULL THEN --새글
        
        SELECT NVL(MAX(G_NUM), 0) + 1
        INTO V_G_NUM
        FROM BOARDS
        ;
        
        V_O_NUM := 1;
    
    ELSE --답글
        
        V_G_NUM := IN_G_NUM;
        
        V_O_NUM := IN_O_NUM + 1;
        
        UPDATE BOARDS
        SET O_NUM = O_NUM +1
        WHERE O_NUM > IN_O_NUM
        AND G_NUM = IN_G_NUM
        ;
    
    END IF
    ;
    
    INSERT INTO BOARDS
    (IDX, TITLE, G_NUM, O_NUM)
    VALUES
    (V_IDX,IN_TITLE,V_G_NUM,V_O_NUM)
    ;
    
  END PROC_INS_BOARDS
  ;