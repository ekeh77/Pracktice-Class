CREATE TABLE BOARDS
(
    IDX     NUMBER(5)       PRIMARY KEY,
    TITLE   VARCHAR2(100)   NOT NULL,
    G_NUM   NUMBER(5)       NOT NULL,
    O_NUM   NUMBER(5)       NOT NULL,
    L_NUM   NUMBER(5)       NOT NULL
);

CREATE OR REPLACE PROCEDURE PROC_CREATE_BOARDS
(
    IN_TITLE    VARCHAR2,
    IN_G_NUM    NUMBER,
    IN_O_NUM    NUMBER,
    IN_L_NUM    NUMBER
)
AS
    V_IDX       NUMBER(5);
    V_G_NUM     NUMBER(5);
    V_O_NUM     NUMBER(5);
    V_L_NUM     NUMBER(5);
    
BEGIN
    --IDX의 값을 만들어 변수에 삽입
    SELECT NVL(MAX(IDX),0) + 1
    INTO V_IDX
    FROM BOARDS
    ;
    
    
    IF IN_G_NUM IS NULL THEN --첫 게시판을 만들 때
    
        V_G_NUM := 1;
        V_O_NUM := 1;
        V_L_NUM := 1;
    
    ELSE --답글 게시판을 만들 때
    
        V_G_NUM := IN_G_NUM + 1;
        V_O_NUM := IN_O_NUM + 1;
        UPDATE BOARDS
        SET O_NUM = O_NUM + 1
        WHERE O_NUM > V_O_NUM
        AND G_NUM = IN_G_NUM
        ;
        V_L_NUM := 1;
    
    END IF
    ;
    
    INSERT INTO BOARDS
    (IDX, TITLE, G_NUM, O_NUM, L_NUM)
    VALUES
    (V_IDX, IN_TITLE, V_G_NUM, V_O_NUM, V_L_NUM)
    ;
    
END PROC_CREATE_BOARDS
;


SELECT *
FROM BOARDS
ORDER BY G_NUM ASC, O_NUM ASC 
;