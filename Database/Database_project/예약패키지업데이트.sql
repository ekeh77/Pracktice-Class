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