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
  
            -- ���ο� ����ID�� �����.
            SELECT 'RV' || TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(RV_ID),'RV000'), 3)) + 1, 'FM000')
            INTO V_RV_ID
            FROM REVIEW_TBL
            ;
  
            -- POINT_TBL�� ���� ū ID ������ 1�� ���Ͽ� ���ο� PT_ID�� �����.
            SELECT 'PT' || TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(PT_ID), 'PT000'), 3)) + 1, 'FM000')
            INTO V_MAX_PT_ID
            FROM POINT_TBL
            ;
            
            -- �ߺ� ���䰡 �ִ��� ã�´�.
            SELECT COUNT(*)
            INTO V_CHECK_OVERLAP
            FROM REVIEW_TBL
            WHERE S_ID = IN_S_ID
                    AND RV_SHOW = 'Y'
            ;

            -- 1. ���並 ���� ���� ã�´�.
            SELECT CT_ID
            INTO V_CT_ID
            FROM SALES_TBL
            WHERE S_ID = IN_S_ID
            ;
            
            -- 2. ���� ������ �ִ��� Ȯ���Ѵ�.
            SELECT COUNT(*)
            INTO V_CHECK_S_ID
            FROM SALES_TBL
            WHERE S_ID = IN_S_ID
            ;

            -- 3. ���� ���Ÿ� �ߴ��� Ȯ���ϰ�, ���並 ������� Ȯ���ϰ�, ���� ����� Ȯ���Ѵ�.
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
                                            O_MSG := '����� �ѹ��� ���� �� �ֽ��ϴ�.'       ;                                     
                                    END IF;
                    ELSE
                            O_MSG := '���ų����� Ȯ�����ּ���';
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
            -- 1. ��� ���� NULL�Ͻÿ��� ��ü ���並 ����Ѵ�.
            IF IN_RV_ID IS NULL
                    AND IN_RV_SCORE IS NULL
                    AND IN_RV_DATE IS NULL
                    AND IN_RV_SHOW IS NULL
                    THEN
                            OPEN O_CUR FOR
                            SELECT * FROM REVIEW_TBL
                            WHERE RV_SHOW = 'Y'
                            ;
            -- 2. 1���� ��찡 �ƴ� �ÿ��� ���� ���� �˻��Ѵ�.
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
            -- ���ο� PT_ID�� �����Ѵ�.
            SELECT 'PT' || TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(PT_ID), 'PT000'), 3)) + 1, 'FM000')
            INTO V_PT_ID
            FROM POINT_TBL
            ;
            
            -- IN_RV_ID�� �ۼ��� ���� ������ ã�´�.
            SELECT S_ID
            INTO V_RV_S_ID
            FROM REVIEW_TBL
            WHERE RV_ID = IN_RV_ID
            ;
            
            -- IN_RV_ID�� �ۼ��� ���� ã�´�.
            SELECT CT_ID
            INTO V_CT_ID
            FROM SALES_TBL
            WHERE S_ID = V_RV_S_ID
            ;
  
            -- 1. REVIEW_TBL�� �ش� �����͸� 'N'���� �ٲ۴�.
            UPDATE REVIEW_TBL
            SET RV_SHOW = 'N'
            WHERE RV_ID = IN_RV_ID
            ;
            
            -- 2. POINT_TBL�� 500����Ʈ �����ϴ� �����͸� �����Ѵ�.
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