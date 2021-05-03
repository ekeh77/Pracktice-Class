create or replace NONEDITIONABLE PACKAGE PKG_SALE_APPLYS_TBL AS 

  /* 예약판매(SALE_APPLYS_TBL)테이블 프로시저 시작 */
  
   --예약판매테이블 SELECT 프로시저 시작
   PROCEDURE PROC_SELECT_SALE_APPLYS_TBL
   (
    IN_A_ID             IN      VARCHAR2,
    IN_G_ID             IN      VARCHAR2,
    IN_CT_ID            IN      VARCHAR2,
    IN_S_DATE           IN      VARCHAR2,
    IN_PY_ID            IN      VARCHAR2,
    IN_A_PROFIT         IN      VARCHAR2,
    IN_A_USE_POINT      IN      VARCHAR2,
    IN_A_SHOW           IN      VARCHAR2,
    O_CUR               OUT      SYS_REFCURSOR
   );  
   --예약판매테이블 SELECT 프로시저 끝
  
  
  --예약판매테이블 INSERT 프로시저 시작
  PROCEDURE PROC_INSERT_SALE_APPLYS_TBL
  (
    IN_G_ID         IN      VARCHAR2,
    IN_CT_ID        IN      VARCHAR2,
    IN_PY_ID        IN      VARCHAR2,
    IN_A_PROFIT     IN      VARCHAR2,
    IN_A_USE_POINT  IN      VARCHAR2
  );
  --예약판매테이블 INSERT 프로시저 끝
  
  /*
  
  --예약판매테이블 UPDATE 프로시저 시작
  PROCEDURE PROC_UPDATE_APPLYS_TBL
  (
    IN_A_ID         IN      VARCHAR2,
    IN_G_ID         IN      VARCHAR2,
    IN_CT_ID        IN      VARCHAR2,
    IN_S_DATE       IN      VARCHAR2,
    IN_PY_ID        IN      VARCHAR2
  );
  --예약판매테이블 UPDATE 프로시저 끝
  */
  
  --예약판매테이블 DELETE 프로시저 시작
  PROCEDURE PROC_DELETE_SALE_APPLYS_TBL
  (
    IN_A_ID       IN      VARCHAR2,
    IN_G_ID       IN      VARCHAR2,
    IN_CT_ID      IN      VARCHAR2
  );
  --예약판매테이블 DELETE 프로시저 끝
 
  
  /* 예약판매(SALE_APPLYS_TBL)테이블 프로시저 끝 */
END PKG_SALE_APPLYS_TBL;

---------------------------------예약판매 패키지 헤드

create or replace NONEDITIONABLE PACKAGE BODY PKG_SALE_APPLYS_TBL AS

/* 예약판매(SALE_APPLYS_TBL)테이블 프로시저 시작 */
  
   --예약판매테이블 SELECT 프로시저 시작
  PROCEDURE PROC_SELECT_SALE_APPLYS_TBL
   (
    IN_A_ID             IN      VARCHAR2,
    IN_G_ID             IN      VARCHAR2,
    IN_CT_ID            IN      VARCHAR2,
    IN_S_DATE           IN      VARCHAR2,
    IN_PY_ID            IN      VARCHAR2,
    IN_A_PROFIT         IN      VARCHAR2,
    IN_A_USE_POINT      IN      VARCHAR2,
    IN_A_SHOW           IN      VARCHAR2,
    O_CUR               OUT      SYS_REFCURSOR
   ) AS
  BEGIN
    
    OPEN O_CUR FOR
    SELECT *
    FROM SALE_APPLYS_TBL
    --조건에 해당하것을 넣으면 찾고 아니면 그냥 ROW를 찾기위한 조건
    WHERE A_ID          LIKE '%' || IN_A_ID ||        '%'
    AND   G_ID          LIKE '%' || IN_G_ID ||        '%' 
    AND   CT_ID         LIKE '%' || IN_CT_ID ||       '%' 
    AND   S_DATE        LIKE '%' || IN_S_DATE ||      '%' 
    AND   PY_ID         LIKE '%' || IN_PY_ID ||       '%'
    AND   A_PROFIT      LIKE '%' || IN_A_PROFIT ||    '%'
    AND   A_USE_POINT   LIKE '%' || IN_A_USE_POINT || '%'
    AND   A_SHOW = CASE WHEN IN_A_SHOW = 'N' THEN 'N'
                   ELSE 'Y'
                   END
    ;
    
  END PROC_SELECT_SALE_APPLYS_TBL;
  --예약판매테이블 SELECT 프로시저 끝
  
  --예약판매테이블 INSERT 프로시저 시작
  PROCEDURE PROC_INSERT_SALE_APPLYS_TBL
  (
    IN_G_ID             IN      VARCHAR2,
    IN_CT_ID            IN      VARCHAR2,
    IN_PY_ID            IN      VARCHAR2,
    IN_A_PROFIT         IN      VARCHAR2,
    IN_A_USE_POINT      IN      VARCHAR2
  )
  AS
    V_NEW_A_ID          CHAR(4);    --예약판매 ID변수
    V_A_USE_POINT       NUMBER(7);  --NULL로 INSERT할 경우 0을 준다
    V_A_PROFIT          NUMBER(7);
  BEGIN
    
    --새로운 예약판매 ID 생성
    SELECT 'A' || TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(A_ID),'A000'),2)) +1,'FM000')
    INTO V_NEW_A_ID
    FROM SALE_APPLYS_TBL
    ;
    
    --만약 포인트를 NULL로 준다면 0으로 만들고 아니면 입력한값을 준다
    IF IN_A_USE_POINT IS NULL THEN
    
    V_A_USE_POINT := 0;
    
    ELSE
    
    V_A_USE_POINT := IN_A_USE_POINT;
    
    END IF
    ;
    
    --할인률을 구해서 매출을 계산하고 변수에 넣어준다
    /*
    SELECT 예약할인률
    INTO 예약할인률변수
    FROM RESERVATION_GAMES_TBL T1, SALE_APPLYS_TBL T2
    WHERE T1.G_ID = T2.G_ID
    AND T1.G_ID = IN_G_ID
    ;
    
    SELECT PY_DC_PER
    INTO V_PY_PER
    FROM PAYMENT_TBL T1, SALE_APPLYS_TBL T2
    WHERE T1.PY_ID = T2.PY_ID
    AND T1.PY_ID = IN_PY_ID
    ;
    
    SELECT G_PRICE
    INTO V_G_PRICE
    FROM RESERVATION_GAMES_TBL T1, SALE_APPLYS_TBL T2
    WHERE T1.G_ID = T2.G_ID
    AND T1.G_ID = IN_G_ID
    ;
    
    V_A_PROFIT := V_G_PRICE * (V_PY_PER + 예약할인률변수 / 100); 
    */
    --새로운 예약구매 생성
    INSERT INTO SALE_APPLYS_TBL(A_ID, G_ID, CT_ID, S_DATE, PY_ID, G_GET_POINT, A_PROFIT, A_USE_POINT, A_SHOW)
    VALUES (V_NEW_A_ID, IN_G_ID, IN_CT_ID, SYSDATE, IN_PY_ID, 5, V_A_PROFIT-V_A_USE_POINT, V_A_USE_POINT, 'Y')
    ;
    
  END PROC_INSERT_SALE_APPLYS_TBL;
  --예약판매테이블 INSERT 프로시저 끝
  
  /*
  
  --예약판매테이블 UPDATE 프로시저 시작 > 게임출시일에 출시한경우 구매테이블로 이동
  PROCEDURE PROC_UPDATE_APPLYS_TBL
  (
    IN_A_ID         IN      VARCHAR2,
    IN_A_INDEX      IN      VARCHAR2,
    IN_G_ID       IN      VARCHAR2,
    IN_CT_ID        IN      VARCHAR2,
    IN_S_DATE       IN      VARCHAR2,
    IN_PY_ID        IN      VARCHAR2
  )
  AS
    -----------------   SALES 테이블에 업데이트 하기위한 변수
    V_GAME_DATE     VARCHAR2(24);
    V_NEW_S_ID      CHAR(4);
    V_APPLY_G_ID    CHAR(4);
    V_APPLY_CT_ID    CHAR(5);
    V_APPLY_PY_ID    CHAR(5);
    --------------------------
    V_G_IN_ID     CHAR(5);
    V_CT_IN_ID      CHAR(5);
    V_S_DATE_IN     VARCHAR2(33);
    V_PY_IN_ID      CHAR(5);
    V_NEW_A_INDEX   NUMBER(7,0);
  BEGIN
  /*
    -- 게임출시일을 가져온다 
    SELECT G_DATE
    INTO V_GAME_DATE
    FROM GAMES_TBL
    WHERE G_ID = IN_G_R_ID
    ;
    
    -- SALES_TBL의 SID를 구한다
    SELECT 'S' || TO_CHAR(TO_NUMBER(NVL(MAX(S_ID), 'S000'))+1,'FM000')
    INTO V_NEW_S_ID
    FROM SALES_TBL
    ;
    
    --APPLY DATA를 가져오기위한 구문
    SELECT G_ID
    INTO V_APPLY_G_ID
    FROM APPLYS_TBL
    WHERE A_ID = IN_A_ID
    AND A_INDEX = IN_A_INDEX
    ;
    
    SELECT CT_ID
    INTO V_APPLY_CT_ID
    FROM APPLYS_TBL
    WHERE A_ID = IN_A_ID
    AND A_INDEX = IN_A_INDEX
    ;
    
    SELECT PY_ID
    INTO V_APPLY_PY_ID
    FROM APPLYS_TBL
    WHERE A_ID = IN_A_ID
    AND A_INDEX = IN_A_INDEX
    ;
    
    --현재날짜와 게임출시일을 비교
    IF  TO_DATE(V_GAME_DATE) >= SYSDATE THEN
    
        INSERT INTO SALES_TBL(S_ID, S_INDEX, G_ID, CT_ID, S_DATE, PY_ID)
        VALUES (V_NEW_S_ID, 1, V_APPLY_G_ID, V_APPLY_CT_ID, SYSDATE, V_APPLY_PY_ID)
        ;
   
    END IF;
    
    
    --게임아이디와 고객아이디 날짜 결제방식을 변경하고 싶은 경우
    
    ----------------한개만 변경하고 싶은 경우 NULL로 넣으면 들어가있었던 값을 넣는다
    
    SELECT CASE
          WHEN IN_G_R_ID IS NULL THEN G_R_ID
          ELSE IN_G_R_ID
          END
    INTO V_G_R_IN_ID
    FROM APPLYS_TBL
    WHERE (A_ID = IN_A_ID AND A_INDEX = IN_A_INDEX)
    ;
    
    SELECT CASE
          WHEN IN_CT_ID IS NULL THEN CT_ID
          ELSE IN_CT_ID
          END
    INTO V_CT_IN_ID
    FROM APPLYS_TBL
    WHERE (A_ID = IN_A_ID AND A_INDEX = IN_A_INDEX)
    ;
    
    SELECT CASE
          WHEN IN_S_DATE IS NULL THEN S_DATE
          ELSE TO_DATE(IN_S_DATE)
          END
    INTO V_S_DATE_IN
    FROM APPLYS_TBL
    WHERE (A_ID = IN_A_ID AND A_INDEX = IN_A_INDEX)
    ;
    
    SELECT CASE
          WHEN IN_PY_ID IS NULL THEN PY_ID
          ELSE IN_PY_ID
          END
    INTO V_PY_IN_ID
    FROM APPLYS_TBL
    WHERE (A_ID = IN_A_ID AND A_INDEX = IN_A_INDEX)
    ;
    /*
    UPDATE APPLYS_TBL
    SET G_R_ID = V_G_R_IN_ID,
        CT_ID  = V_CT_IN_ID,
        S_DATE = V_S_DATE_IN,
        PY_ID  = V_PY_IN_ID
    WHERE (A_ID = IN_A_ID AND A_INDEX = IN_A_INDEX)
    ;
     
     
    -- 변경되는곳의 INDEX MAX값 주기 
    SELECT NVL(MAX(A_INDEX),0) + 1 
    INTO V_NEW_A_INDEX
    FROM APPLYS_TBL
    WHERE (G_R_ID = V_G_R_IN_ID AND CT_ID = V_CT_IN_ID)
    ;
    
    
    
    UPDATE APPLYS_TBL
    SET A_INDEX = V_NEW_A_INDEX,
        G_R_ID  = V_G_R_IN_ID,
        CT_ID   = V_CT_IN_ID,
        S_DATE  = V_S_DATE_IN,
        PY_ID   = V_PY_IN_ID
    WHERE (A_ID = IN_A_ID AND A_INDEX = IN_A_INDEX)
    ;
    
  END PROC_UPDATE_APPLYS_TBL
  ;
  --예약판매테이블 UPDATE 프로시저 끝
  */
   --예약판매테이블 DELETE 프로시저 시작 > 예약 취소와 같은 의미
  PROCEDURE PROC_DELETE_SALE_APPLYS_TBL
  (
    IN_A_ID       IN      VARCHAR2,
    IN_G_ID       IN      VARCHAR2,
    IN_CT_ID      IN      VARCHAR2
  )
  AS
  BEGIN
    
    UPDATE SALE_APPLYS_TBL
    SET A_SHOW = 'N'
    WHERE A_ID = IN_A_ID
    AND   G_ID = IN_G_ID
    AND   CT_ID = IN_CT_ID
    ;
    
  END PROC_DELETE_SALE_APPLYS_TBL;
  --예약판매테이블 DELETE 프로시저 끝
 
  /* 예약판매(APPLY_TBL)테이블 프로시저 끝 */

END PKG_SALE_APPLYS_TBL;