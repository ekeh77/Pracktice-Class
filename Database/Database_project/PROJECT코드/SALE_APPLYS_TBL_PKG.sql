---------------------------------------SALE_APPLYS_TBL 헤드 시작

create or replace NONEDITIONABLE PACKAGE PKG_SALE_APPLYS_TBL AS 

  /* 예약판매(SALE_APPLYS_TBL)테이블 프로시저 시작 */
  
   --예약판매테이블 SELECT 프로시저 시작
   PROCEDURE PROC_SELECT_SALE_APPLYS_TBL
   (
    IN_S_ID             IN      VARCHAR2,
    IN_G_ID             IN      VARCHAR2,
    IN_CT_ID            IN      VARCHAR2,
    IN_S_DATE           IN      VARCHAR2,
    IN_PY_ID            IN      VARCHAR2,
    IN_A_PROFIT         IN      VARCHAR2,
    IN_A_USE_POINT      IN      VARCHAR2,
    IN_A_SHOW           IN      VARCHAR2,
    O_CUR               OUT     SYS_REFCURSOR
   );  
   --예약판매테이블 SELECT 프로시저 끝
  
  
  --예약판매테이블 INSERT 프로시저 시작
  PROCEDURE PROC_INSERT_SALE_APPLYS_TBL
  (
    IN_G_ID             IN      VARCHAR2,
    IN_CT_ID            IN      VARCHAR2,
    IN_PY_ID            IN      VARCHAR2,
    IN_A_USE_POINT      IN      VARCHAR2,
    O_MSG               OUT     VARCHAR2
  );
  --예약판매테이블 INSERT 프로시저 끝
  
  --예약판매테이블 UPDATE 프로시저 시작 > 예약판매기간이 넘어가면 SALES_TBL로 보낸다
  PROCEDURE PROC_UPDATE_APPLYS_TBL;
  --예약판매테이블 UPDATE 프로시저 끝
  
  --예약판매테이블 DELETE 프로시저 시작
  PROCEDURE PROC_DELETE_SALE_APPLYS_TBL
  (
    IN_S_ID       IN      VARCHAR2,
    IN_G_ID       IN      VARCHAR2,
    IN_CT_ID      IN      VARCHAR2
  );
  --예약판매테이블 DELETE 프로시저 끝
 
  
  /* 예약판매(SALE_APPLYS_TBL)테이블 프로시저 끝 */
END PKG_SALE_APPLYS_TBL;

---------------------------------------SALE_APPLYS_TBL 헤드 끝

---------------------------------------SALE_APPLYS_TBL 바디 시작

create or replace NONEDITIONABLE PACKAGE BODY PKG_SALE_APPLYS_TBL AS

/* 예약판매(SALE_APPLYS_TBL)테이블 프로시저 시작 */
  
   --예약판매테이블 SELECT 프로시저 시작
  PROCEDURE PROC_SELECT_SALE_APPLYS_TBL
   (
    IN_S_ID             IN      VARCHAR2,
    IN_G_ID             IN      VARCHAR2,
    IN_CT_ID            IN      VARCHAR2,
    IN_S_DATE           IN      VARCHAR2,
    IN_PY_ID            IN      VARCHAR2,
    IN_A_PROFIT         IN      VARCHAR2,
    IN_A_USE_POINT      IN      VARCHAR2,
    IN_A_SHOW           IN      VARCHAR2,
    O_CUR               OUT     SYS_REFCURSOR
   ) AS
  BEGIN
    /*
    OPEN O_CUR FOR
    SELECT *
    FROM SALE_APPLYS_TBL
    --조건에 해당하것을 넣으면 찾고 아니면 그냥 ROW를 찾기위한 조건
    WHERE S_ID          LIKE '%' || IN_S_ID ||        '%'
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
    */
    --조인을 통해 코드가아닌 정보로 표시하기위한 명령
    OPEN O_CUR FOR
    SELECT T1.S_ID, T2.G_NAME, T1.S_DATE,T3.CT_NAME, T4.PY_NAME, T1.G_GET_POINT, T1.A_PROFIT, T1.A_USE_POINT, T1.A_SHOW
    FROM SALE_APPLYS_TBL T1, RESERVATION_GAMES_TBL T2, CUSTOMERS_TBL T3, PAYMENT_TBL T4
    --조건에 해당하것을 넣으면 찾고 아니면 그냥 ROW를 찾기위한 조건
    WHERE S_ID             LIKE '%' || IN_S_ID ||        '%'
    AND   T1.G_ID          LIKE '%' || IN_G_ID ||        '%' 
    AND   T1.CT_ID         LIKE '%' || IN_CT_ID ||       '%' 
    AND   S_DATE           LIKE '%' || IN_S_DATE ||      '%' 
    AND   T1.PY_ID         LIKE '%' || IN_PY_ID ||       '%'
    AND   A_PROFIT         LIKE '%' || IN_A_PROFIT ||    '%'
    AND   A_USE_POINT      LIKE '%' || IN_A_USE_POINT || '%'
    AND   A_SHOW = CASE WHEN IN_A_SHOW = 'N' THEN 'N'
                   ELSE 'Y'
                   END
    AND T1.G_ID = T2.G_ID
    AND T1.CT_ID = T3.CT_ID
    AND T1.PY_ID = T4.PY_ID
    ;
  END PROC_SELECT_SALE_APPLYS_TBL;
  --예약판매테이블 SELECT 프로시저 끝
  
  --예약판매테이블 INSERT 프로시저 시작
  PROCEDURE PROC_INSERT_SALE_APPLYS_TBL
  (
    IN_G_ID             IN      VARCHAR2,
    IN_CT_ID            IN      VARCHAR2,
    IN_PY_ID            IN      VARCHAR2,
    IN_A_USE_POINT      IN      VARCHAR2,
    O_MSG               OUT     VARCHAR2
  )
  AS
    V_NEW_S_ID          CHAR(4);    -- 예약판매 최종 ID변수
    V_NEW_S_ID2         CHAR(4);    -- 판매 ID변수(비교를 위한 변수)
    V_NEW_S_ID3         CHAR(4);    -- 예약판매 ID변수(비교를 위한 변수)
    V_A_USE_POINT       NUMBER(7);  -- NULL로 INSERT할 경우 0을 준다
    V_A_PROFIT          NUMBER(7);  -- 총 할인된 가격(고객이 구매하는 가격)
    V_G_R_DISCOUNT_PER  NUMBER(3);  -- 예약게임의 할인률
    V_PY_PER            NUMBER(3);  -- 결제방법별 할인률
    V_G_PRICE           NUMBER(7);  -- 예약게임의 판매가격
    V_HAVE_POINT        NUMBER(7);  -- 고객이 가지고 있는 포인트
    V_PT_ID             CHAR(5);    -- 포인트 ID변수
  BEGIN
    
    --새로운 예약판매 ID 생성
    SELECT 'S' || TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(S_ID),'A000'),2)) +1,'FM000')
    INTO V_NEW_S_ID2
    FROM SALE_APPLYS_TBL
    ;
    
    SELECT 'S' || TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(S_ID),'A000'),2)) +1,'FM000')
    INTO V_NEW_S_ID3
    FROM  SALES_TBL
    ;
    
    IF V_NEW_S_ID2 > V_NEW_S_ID3 THEN -- 변수의 크기를 비교한후 큰것을 넣어준다
        V_NEW_S_ID := V_NEW_S_ID2;
    ELSE
        V_NEW_S_ID := V_NEW_S_ID3;
    END IF
    ;
    
    --만약 포인트를 NULL로 준다면 0으로 만들고 아니면 입력한값을 준다
    IF IN_A_USE_POINT IS NULL THEN
    
    V_A_USE_POINT := 0;
    
    ELSE
    
    V_A_USE_POINT := IN_A_USE_POINT;
    
    END IF
    ;
    
    --할인률을 구해서 매출을 계산하고 변수에 넣어준다
    
    SELECT G_R_DISCOUNT_PER --예약게임 할인률 구하기
    INTO V_G_R_DISCOUNT_PER
    FROM RESERVATION_GAMES_TBL
    WHERE G_ID = IN_G_ID
    ;
    
    SELECT PY_DC_PER --결제방법별 할인률 구하기
    INTO V_PY_PER
    FROM PAYMENT_TBL
    WHERE PY_ID = IN_PY_ID
    ;
    
    SELECT G_R_SALES_PRICE --예약게임의 판매가격 구하기
    INTO V_G_PRICE
    FROM RESERVATION_GAMES_TBL 
    WHERE G_ID = IN_G_ID
    ;
    
    V_A_PROFIT := V_G_PRICE - (V_G_PRICE * (V_PY_PER + V_G_R_DISCOUNT_PER )/ 100); --총 가격구하기
    
    /*
    ---------사용할 포인트보다 가지고있는 포인트가 적으면 구매할 수 없다
    
    IF V_A_USE_POINT > V_HAVE_POINT THEN
    
        O_MSG  := '사용할 포인트' || V_A_USE_POINT - V_HAVE_POINT ||'원이 부족합니다';
        
    ELSE
    --사용한 포인트을 차감하고(CUSTOMER_TBL UPDATE) POINT테이블에 INSERT한다
    
    UPDATE CUSTOMERS_TBL
    SET CT_POINT = CT_POINT - V_A_USE_POINT
    WHERE CT_ID = IN_CT_ID
    ;
    */
    
    --새로운 예약구매 생성
    INSERT INTO SALE_APPLYS_TBL(S_ID, G_ID, CT_ID, S_DATE, PY_ID, G_GET_POINT, A_PROFIT, A_USE_POINT, A_SHOW, A_W_PURCHASE)
    VALUES (V_NEW_S_ID, IN_G_ID, IN_CT_ID, SYSDATE, IN_PY_ID, 5, V_A_PROFIT-V_A_USE_POINT, V_A_USE_POINT, 'Y', 'R')
    ;
    
    /*
    SELECT 'PT' || TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(PT_ID),'PT000'),3)) +1,'FM000')
    INTO V_PT_ID
    FROM POINT_TBL
    ;
    
    INSERT INTO POINT_TBL(PT_ID, S_ID, CT_ID, PT_SCORE, PT_SAVE_USE, PT_DATE, PT_SHOW)
    VALUES(V_PT_ID, V_NEW_S_ID, IN_CT_ID, V_A_USE_POINT, 'U', SYSDATE, 'Y')
    ;
    
    END IF;
    */
    
    
  END PROC_INSERT_SALE_APPLYS_TBL;
  --예약판매테이블 INSERT 프로시저 끝
  
  --예약판매테이블 UPDATE 프로시저 시작 > 게임출시일에 출시한경우 삭제한다 > 이후 SALES_TBL로 이동
  PROCEDURE PROC_UPDATE_APPLYS_TBL
  AS
    CURRENT_TIME        VARCHAR2(30);
  BEGIN
  
    SELECT S_DATE --예약판매가 종료된 게임을 찾는다
    INTO CURRENT_TIME
    FROM SALE_APPLYS_TBL
    WHERE TO_CHAR(S_DATE,'YYYYMMDD') < TO_CHAR(SYSDATE,'YYYYMMDD')
    GROUP BY S_DATE
    ;
    
    INSERT INTO SALES_TBL -- 예약판매가 종료된 게임을 SALES_TBL로 옮긴다
    SELECT *
    FROM SALE_APPLYS_TBL
    WHERE TO_DATE(S_DATE,'YYYY-MM-DD') < TO_DATE(SYSDATE,'YYYY-MM-DD')
    ;
    
    UPDATE SALE_APPLYS_TBL --예약판매가 종료된 게임을 보여주지않는다
    SET A_SHOW = 'N'
    WHERE TO_DATE(S_DATE,'YYYY-MM-DD') < TO_DATE(SYSDATE,'YYYY-MM-DD')
    ;   
    
  END PROC_UPDATE_APPLYS_TBL
  ;
  --예약판매테이블 UPDATE 프로시저 끝
  
  --예약판매테이블 DELETE 프로시저 시작 > 예약 취소와 같은 의미
  PROCEDURE PROC_DELETE_SALE_APPLYS_TBL
  (
    IN_S_ID       IN      VARCHAR2,
    IN_G_ID       IN      VARCHAR2,
    IN_CT_ID      IN      VARCHAR2
  )
  AS
  BEGIN
    
    DELETE FROM SALE_APPLYS_TBL
    WHERE S_ID = IN_S_ID
    AND   G_ID = IN_G_ID
    AND   CT_ID = IN_CT_ID
    ;
    
  END PROC_DELETE_SALE_APPLYS_TBL;
  --예약판매테이블 DELETE 프로시저 끝
 
  /* 예약판매(APPLY_TBL)테이블 프로시저 끝 */

END PKG_SALE_APPLYS_TBL;

---------------------------------------SALE_APPLYS_TBL 바디 끝