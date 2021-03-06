create or replace NONEDITIONABLE PACKAGE BODY PKG_REVIEW_TBL AS

  PROCEDURE PROC_REVIEW_INSERT
    (
            IN_S_ID                              IN              VARCHAR,
            IN_RV_SCORE                  IN             NUMBER,
            IN_RV_DATE                     IN           DATE,
            IN_RV_COMMENT           IN              VARCHAR2,
            O_MSG                               OUT         VARCHAR2
    ) AS
            V_RV_ID                             CHAR(5);
            V_MAX_PT_ID                 CHAR(5);
            V_CT_ID                             CHAR(5);
            V_CHECK_S_ID                NUMBER;
            V_CHECK_OVERLAP         NUMBER;
    
  BEGIN
  
            -- 새로운 리뷰ID를 만든다.
            SELECT 'RV' || TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(RV_ID),'RV000'), 3)) + 1, 'FM000')
            INTO V_RV_ID
            FROM REVIEW_TBL
            ;
  
            -- POINT_TBL의 가장 큰 ID 값에서 1을 더하여 새로운 PT_ID를 만든다.
            SELECT 'PT' || TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(PT_ID), 'PT000'), 3)) + 1, 'FM000')
            INTO V_MAX_PT_ID
            FROM POINT_TBL
            ;
            
            -- 중복 리뷰가 있는지 찾는다.
            SELECT COUNT(*)
            INTO V_CHECK_OVERLAP
            FROM REVIEW_TBL
            WHERE S_ID = IN_S_ID
                    AND RV_SHOW = 'Y'
            ;

            -- 1. 리뷰를 남긴 고객을 찾는다.
            SELECT CT_ID
            INTO V_CT_ID
            FROM SALES_TBL
            WHERE S_ID = IN_S_ID
            ;
            
            -- 2. 구매 내역이 있는지 확인한다.
            SELECT COUNT(*)
            INTO V_CHECK_S_ID
            FROM SALES_TBL
            WHERE S_ID = IN_S_ID
            ;

            -- 3. 고객이 구매를 했는지 확인하고, 리뷰를 남겼는지 확인하고, 글을 썼는지 확인한다.
            IF V_CHECK_S_ID != 0
                    THEN
                            IF V_CHECK_OVERLAP = 0 
                                    THEN 
                                            IF IN_RV_COMMENT IS  NOT NULL
                                                    THEN
                                                            INSERT INTO REVIEW_TBL
                                                            (RV_ID, S_ID, RV_SCORE, RV_DATE, RV_COMMENT)
                                                            VALUES
                                                            (V_RV_ID, IN_S_ID, IN_RV_SCORE, IN_RV_DATE, IN_RV_COMMENT)
                                                            ;
                                                            INSERT INTO POINT_TBL
                                                            (PT_ID, S_ID, CT_ID, PT_SCORE, PT_SAVE_USE, PT_DATE, PT_SHOW)
                                                            VALUES
                                                            (V_MAX_PT_ID, IN_S_ID, V_CT_ID, 500, 'S', IN_RV_DATE, 'Y')
                                                            ;
                                                    ELSE
                                                            INSERT INTO REVIEW_TBL
                                                            (RV_ID, S_ID, RV_SCORE, RV_DATE, RV_COMMENT)
                                                            VALUES
                                                            (V_RV_ID, IN_S_ID, IN_RV_SCORE, IN_RV_DATE, IN_RV_COMMENT)
                                                            ;
                                                    END IF;

                                    ELSE
                                            O_MSG := '리뷰는 한번만 남길 수 있습니다.'       ;                                     
                                    END IF;
                    ELSE
                            O_MSG := '구매내역을 확인해주세요';
                    END IF;
  END PROC_REVIEW_INSERT;

  PROCEDURE PROC_REVIEW_SELECT
    (
            IN_RV_ID                IN              VARCHAR2,
            IN_RV_SCORE         IN              NUMBER,
            IN_RV_DATE          IN              DATE,
            IN_RV_SHOW          IN              VARCHAR2,
            O_CUR                   OUT             SYS_REFCURSOR
    ) AS
  BEGIN
            -- 1. 모든 값이 NULL일시에는 전체 리뷰를 출력한다.
            IF IN_RV_ID IS NULL
                    AND IN_RV_SCORE IS NULL
                    AND IN_RV_DATE IS NULL
                    AND IN_RV_SHOW IS NULL
                    THEN
                            OPEN O_CUR FOR
                            SELECT * FROM REVIEW_TBL
                            WHERE RV_SHOW = 'Y'
                            ;
            -- 2. 1번의 경우가 아닐 시에는 들어온 값을 검색한다.
                    ELSE
                            OPEN O_CUR FOR
                            SELECT * 
                            FROM REVIEW_TBL
                            WHERE RV_ID LIKE '%' || IN_RV_ID || '%'
                                    AND RV_SCORE LIKE '%' || IN_RV_SCORE || '%'
                                    AND RV_DATE LIKE '%' || IN_RV_DATE || '%'
                                    AND RV_SHOW = (CASE
                                                                    WHEN IN_RV_SHOW IS NULL THEN 'Y'
                                                                    WHEN IN_RV_SHOW = 'N' THEN 'N'
                                                                    END)
                            ;
                    END IF;
                    
  END PROC_REVIEW_SELECT;

  PROCEDURE PROC_REVIEW_DELETE
    (
            IN_RV_ID            IN              VARCHAR
    ) AS    
    
            V_PT_ID                     CHAR(5);
            V_CT_ID                     CHAR(5);
            V_RV_S_ID               CHAR(4);
    
  BEGIN
            -- 새로운 PT_ID를 생성한다.
            SELECT 'PT' || TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(PT_ID), 'PT000'), 3)) + 1, 'FM000')
            INTO V_PT_ID
            FROM POINT_TBL
            ;
            
            -- IN_RV_ID가 작성된 구매 내역을 찾는다.
            SELECT S_ID
            INTO V_RV_S_ID
            FROM REVIEW_TBL
            WHERE RV_ID = IN_RV_ID
            ;
            
            -- IN_RV_ID를 작성한 고객을 찾는다.
            SELECT CT_ID
            INTO V_CT_ID
            FROM SALES_TBL
            WHERE S_ID = V_RV_S_ID
            ;
  
            -- 1. REVIEW_TBL의 해당 데이터를 'N'으로 바꾼다.
            UPDATE REVIEW_TBL
            SET RV_SHOW = 'N'
            WHERE RV_ID = IN_RV_ID
            ;
            
            -- 2. POINT_TBL에 500포인트 차감하는 데이터를 삽입한다.
            INSERT INTO POINT_TBL
            (PT_ID, S_ID, CT_ID,PT_SCORE, PT_SAVE_USE, PT_DATE, PT_SHOW)
            VALUES
            (V_PT_ID, V_RV_S_ID, V_CT_ID, 500, 'U', SYSDATE, 'Y')
            ;

  END PROC_REVIEW_DELETE;

  PROCEDURE PROC_REVIEW_UPDATE
    (
            IN_RV_ID                           IN              VARCHAR2,
            IN_RV_COMMENT           IN              VARCHAR2
    ) AS
  BEGIN
            
            UPDATE REVIEW_TBL
            SET RV_COMMENT = IN_RV_COMMENT
            WHERE RV_ID = IN_RV_ID
            ;

  END PROC_REVIEW_UPDATE;

END PKG_REVIEW_TBL;