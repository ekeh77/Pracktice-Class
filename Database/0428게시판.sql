    
    --DROP TABLE GROUP_TBL
    CREATE TABLE GROUP_TBL
    (
        GROUP_ID    CHAR(4)     NOT NULL,   --그룹코드
        GROUP_NAME    VARCHAR2(50)     NOT NULL,  --그룹이름   
        GROUP_SEQ       NUMBER(7)       NOT NULL
    );
    
    INSERT INTO GROUP_TBL VALUES('G001', '부서및 팀 관리', 1);
    INSERT INTO GROUP_TBL VALUES('G002', '직책', 2);
    INSERT INTO GROUP_TBL VALUES('G003', '직위', 3);
    
    SELECT * FROM GROUP_TBL;
    
    --DROP TABLE COMMONS_TBL
    /*공통코드 테이블*/
    CREATE TABLE COMMONS_TBL
    (
        COM_ID  CHAR(4)         NOT NULL,  --공통코드
        COM_VAL VARCHAR2(100)   NOT NULL,  --공통코드 명
        COM_LVL NUMBER(8)       NOT NULL,  --공통코드 레벨
        COM_SEQ NUMBER(8)       NOT NULL,  --공통코드 순서
        PARENT_ID   CHAR(4)     NULL,      --부모코드
        GROUP_ID    CHAR(4)     NOT NULL   --그룹코드
        /*
        EXCEPT1     VARCHAR2(20)  NULL,      --예외1
        EXCEPT2     VARCHAR2(20)  NULL,      --예외2
        EXCEPT3     VARCHAR2(20)  NULL,      --예외3
        EXCEPT4     VARCHAR2(20)  NULL       --예외4
        */
    );
    
    --공통코드
    --개발주제 -- 수없이 많은 코드값 - 부서,팀    직책,  직위,   주소체계,  거래처, 핸드폰회사, 메뉴, 
    --                           - 계층형인 경우가 많다.
    
    INSERT INTO COMMONS_TBL VALUES('C001', '부서명', 1, 1, 'C000', 'G001');
    INSERT INTO COMMONS_TBL VALUES('C002', '생산부', 2, 1, 'C001', 'G001');
    INSERT INTO COMMONS_TBL VALUES('C003', '구매부', 2, 2, 'C001', 'G001');
    INSERT INTO COMMONS_TBL VALUES('C004', '생산1팀', 3, 1, 'C002', 'G001');
    INSERT INTO COMMONS_TBL VALUES('C005', '생산2팀', 3, 2, 'C002', 'G001');
    INSERT INTO COMMONS_TBL VALUES('C006', '생산3팀', 3, 3, 'C002', 'G001');
    INSERT INTO COMMONS_TBL VALUES('C007', '구매1팀', 3, 1, 'C003', 'G001');
    INSERT INTO COMMONS_TBL VALUES('C008', '구매2팀', 3, 2, 'C003', 'G001');
    INSERT INTO COMMONS_TBL VALUES('C009', '구매1-1팀', 4, 1, 'C007', 'G001');
    INSERT INTO COMMONS_TBL VALUES('C010', '구매1-2팀', 4, 2, 'C007', 'G001');
    
    INSERT INTO COMMONS_TBL VALUES('C011', '직책', 1, 1, 'C000', 'G002');
    INSERT INTO COMMONS_TBL VALUES('C012', '부서장', 2, 1, 'C011', 'G002');
    INSERT INTO COMMONS_TBL VALUES('C013', '팀장', 2, 2, 'C011', 'G002');
    INSERT INTO COMMONS_TBL VALUES('C014', '사원', 2, 3, 'C011', 'G002');
    
    INSERT INTO COMMONS_TBL VALUES('C015', '직위', 1, 1, 'C000', 'G003');
    INSERT INTO COMMONS_TBL VALUES('C016', '부장', 2, 1, 'C015', 'G003');
    INSERT INTO COMMONS_TBL VALUES('C017', '차장', 2, 2, 'C015', 'G003');
    INSERT INTO COMMONS_TBL VALUES('C018', '과장', 2, 3, 'C015', 'G003');
    INSERT INTO COMMONS_TBL VALUES('C019', '대리', 2, 4, 'C015', 'G003');
    INSERT INTO COMMONS_TBL VALUES('C020', '사원', 2, 5, 'C015', 'G003');
    
    SELECT  LPAD(' ', T1.COM_LVL * 2) || T1.COM_VAL
    FROM COMMONS_TBL T1, GROUP_TBL T2
    WHERE T1.GROUP_ID = T2.GROUP_ID
    START WITH T1.PARENT_ID IS NULL
    CONNECT BY PRIOR T1.COM_ID = T1.PARENT_ID
    ORDER SIBLINGS BY T1.COM_SEQ
    ;
    
    SELECT  *
    FROM COMMONS_TBL T1, GROUP_TBL T2
    WHERE T1.GROUP_ID = T2.GROUP_ID
    START WITH T1.PARENT_ID IS NULL
    CONNECT BY PRIOR T1.COM_ID = T1.PARENT_ID
    ORDER SIBLINGS BY T1.COM_SEQ
    ;
    
    
    SELECT * FROM GROUP_TBL;
    SELECT * FROM COMMONS_TBL;
    
    CREATE OR REPLACE
PACKAGE BODY PKG_COMMON_CODE AS

/* GROUP_TBL의 업무로직 시작 */

  PROCEDURE PROC_MOD_GROUP
  (
        IN_GROUP_ID         VARCHAR2,
        IN_GROUP_NAME       VARCHAR2,
        IN_GROUP_SEQ        NUMBER
  ) AS
  
    V_NEW_GROUP_ID      CHAR(4);
    
  BEGIN
  
    --혹시 INSERT 라면 사용하게 될지도 모르는 GROUP_ID
    SELECT 'G' || TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(GROUP_ID),'G000'),2))+ 1,'FM000') 
    INTO V_NEW_GROUP_ID
    FROM GROUP_TBL;
    
    --등록및수정
    
    MERGE INTO GROUP_TBL
    USING DUAL
    ON(GROUP_ID = IN_GROUP_ID)
    WHEN MATCHED THEN
    
        UPDATE SET GROUP_NAME = IN_GROUP_NAME,
                    GROUP_SEQ = IN_GROUP_SEQ
                    
    WHEN NOT MATCHED THEN
    
        --INSERT하려면 새로운 GROUP_ID가 필요하다
        INSERT(GROUP_ID, GROUP_NAME, GROUP_SEQ)
        VALUES(V_NEW_GROUP_ID, IN_GROUP_NAME, IN_GROUP_SEQ)
        
        ;
  END PROC_MOD_GROUP;

  PROCEDURE PROC_DEL_GROUP
  (
        IN_GROUP_ID         VARCHAR2,
        IN_GROUP_SEQ        NUMBER
  ) AS
  BEGIN
  
    --1.지운다
    DELETE FROM GROUP_TBL
    WHERE GROUP_ID = IN_GROUP_ID
    ;
    
    --2. SEQ값을 재정렬
    UPDATE GROUP_TBL
    SET GROUP_SEQ = GROUP_SEQ - 1
    WHERE GROUP_SEQ > IN_GROUP_SEQ
    ;
    
  END PROC_DEL_GROUP;

  PROCEDURE PROC_SEL_GROUP
  (
        IN_GROUP_ID         VARCHAR2,
        IN_GROUP_NAME       VARCHAR2,
        O_CUR       OUT     SYS_REFCURSOR
        
  ) AS
  BEGIN
    
    OPEN O_CUR FOR
    SELECT * FROM GROUP_TBL
    WHERE GROUP_ID LIKE '%' || IN_GROUP_ID || '%'
    AND GROUP_NAME LIKE '%' || IN_GROUP_NAME || '%'
    ;
    
  END PROC_SEL_GROUP;

/* GROUP_TBL의 업무로직 끝 */

/* COMMONS_TBL 업무로직 시작 */

    --COMMONS_TBL 수정과 등록

    PROCEDURE PROC_MOD_COMMON
    (
        IN_COM_ID IN VARCHAR2,
        IN_COM_VAL IN VARCHAR2,
        IN_COM_LVL  IN NUMBER,
        IN_COM_SEQ IN NUMBER,
        IN_PARENT_ID IN VARCHAR2,
        IN_GROUP_ID IN VARCHAR2
    )
    AS
    
        V_COM_ID        CHAR(4);
    
    BEGIN
        
        SELECT 'C' || TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(COM_ID),'C000'),2))+1,'FM000')
        INTO V_COM_ID
        FROM COMMONS_TBL
        ;
        
        MERGE INTO COMMONS_TBL
        USING DUAL
        ON(COM_ID = IN_COM_ID)
        WHEN MATCHED THEN
            UPDATE SET COM_LVL = IN_COM_LVL,
                       COM_SEQ = IN_COM_SEQ,
                       COM_VAL = IN_COM_VAL,
                       PARENT_ID = IN_PARENT_ID,
                       GROUP_ID = IN_GROUP_ID
        WHEN NOT MATCHED THEN
            INSERT(COM_ID, COM_VAL, COM_LVL, COM_SEQ, PARENT_ID, GROUP_ID)
            VALUES(V_COM_ID, IN_COM_VAL, IN_COM_LVL, IN_COM_SEQ, IN_PARENT_ID, IN_GROUP_ID)
        ;
        
    END PROC_MOD_COMMON
    ;
    
    PROCEDURE PROC_DEL_COMMON
    (
        IN_COM_ID       IN      VARCHAR2,
        IN_COM_LVL      IN      NUMBER,
        IN_COM_SEQ      IN      NUMBER
    )
    AS
    BEGIN
    
        DELETE FROM COMMONS_TBL
        WHERE COM_ID = IN_COM_ID
        ;
        
        UPDATE COMMONS_TBL
        SET COM_SEQ = IN_COM_SEQ -1
        WHERE COM_LVL = IN_COM_LVL
        AND COM_SEQ > IN_COM_SEQ
        ;
        
    END PROC_DEL_COMMON
    ;
    
/* COMMONS_TBL 업무로직 끝 */

END PKG_COMMON_CODE;