create or replace NONEDITIONABLE PACKAGE PKG_PAYMENT_TBL AS 

        PROCEDURE PROC_SELECT_PAYMENT
        (
                IN_PY_NAME                      VARCHAR2,
                IN_GROUP_NUM                    NUMBER,
                IN_PARENT_PY_ID                 VARCHAR2,
                O_CUR               OUT         SYS_REFCURSOR
        );

        PROCEDURE PROC_DELETE_PAYMENT
        (
                IN_PY_ID                        VARCHAR2
        );

      --결제방식테이블 UPDATE 프로시저 시작
        PROCEDURE PROC_UPDATE_PAYMENT_TBL
      (
        IN_PY_ID            IN                  VARCHAR2,
        IN_PY_NAME          IN                  VARCHAR2,
        IN_GROUP_NUM        IN                  NUMBER,
        IN_PY_LVL           IN                  NUMBER,
        IN_PY_SEQ           IN                  NUMBER,
        IN_PY_DC_PER        IN                  NUMBER,
        IN_PARENT_PY_ID     IN                  VARCHAR2
        );
      --결제방식테이블 UPDATE 프로시저 끝

        PROCEDURE PROC_INSERT_PAYMENT
        (
                IN_PY_NAME                 VARCHAR2,
                IN_GROUP_NUM               NUMBER,                
                IN_PY_LVL                  NUMBER,
                IN_PY_SEQ                  NUMBER,
                IN_PC_DC_PER               NUMBER,
                IN_PARENT_PY_ID            VARCHAR2
        );

END PKG_PAYMENT_TBL;