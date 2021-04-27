PROCEDURE PROC_DEL_BOARDS
  (
    IN_IDX      NUMBER,
    IN_G_NUM    NUMBER
  )
  AS
  
    V_D_NUM     NUMBER(5);
    V_G_NUM     NUMBER(5);
    V_G_NUM_CNT NUMBER(5);
    V_D_NUM_CNT NUMBER(5);
    V_DEL       NUMBER(5);
    
  BEGIN
  
    UPDATE BOARDS
    SET D_NUM = 1
    WHERE IDX = IN_IDX
    ;
    --뭉티기가 다 D_NUM = 1 되면 모두 데이터를 실제로 삭제한다.
    /*
    --1. IN_IDX값 G_NUM값을 찾자
    
    SELECT G_NUM
    INTO V_G_NUM
    FROM BOARDS
    WHERE IDX = IN_IDX
    ;
    --2.V_G_NUM값과 같은 ROW가 몇개일까
    
    SELECT COUNT(*)
    INTO V_G_NUM_CNT
    FROM BOARDS
    WHERE G_NUM = V_G_NUM
    ;
    
    --3. V_G_NUM값과 같은 ROW중에서 D_NUM이 1인값을 가진 ROW의 개수
    
    SELECT COUNT(*)
    INTO V_D_NUM_CNT
    FROM BOARDS
    WHERE G_NUM = V_G_NUM AND D_NUM = 1
    ;
    IF V_D_NUM_CNT = V_G_NUM_CNT THEN
        --지우자
        DELETE FROM BOARDS
        WHERE G_NUM = V_G_NUM
        ;
    END IF
    ;
    */
    
    SELECT MAX(A.IDX) 
    INTO V_DEL
    FROM
    (
        SELECT IDX, D_NUM
        FROM BOARDS
        WHERE G_NUM = 3
    )A,
    (
        SELECT IDX, 0 AS D_NUM
        FROM BOARDS
        WHERE G_NUM = 3
    )B
    WHERE A.IDX = B.IDX
    AND A.D_NUM = B.D_NUM
    ;
    
    IF V_DEL IS NULL THEN
    
    DELETE FROM BOARDS
    WHERE G_NUM = V_G_NUM
    ;
    
    END IF
    ;
    /*
   SELECT COUNT(D_NUM)
   INTO V_D_NUM
   FROM BOARDS
   WHERE G_NUM = IN_G_NUM
   AND D_NUM = 0
   ;
   
   IF V_D_NUM = 0 THEN
   
    DELETE FROM BOARDS
    WHERE G_NUM = IN_G_NUM
    ;
   END IF
   ;
   
  END PROC_DEL_BOARDS
  ;
    */
END PKG_BOARDS;



SELECT * FROM BOARDS;

MERGE INTO BOARDS T1
USING(
    SELECT IDX, G_NUM, 1 AS D_NUM FROM BOARDS
) T2
ON (T1.IDX = T2.IDX AND T1.D_NUM = T2.D_NUM)
WHEN MATCHED THEN 
    
WHEN NOT MATCHED THEN
    
