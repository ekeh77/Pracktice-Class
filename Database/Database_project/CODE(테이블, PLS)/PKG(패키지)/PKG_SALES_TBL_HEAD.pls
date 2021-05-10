create or replace NONEDITIONABLE PACKAGE PKG_SALES_TBL AS 

        PROCEDURE PROC_SELECT_SALES
        (
                IN_S_ID                        VARCHAR2,
                IN_G_ID                        VARCHAR2,
                IN_CT_ID                       VARCHAR2,
                IN_S_DATE                      DATE,
                IN_PY_ID                       VARCHAR2,
                IN_S_GET_POINT                 NUMBER,
                IN_S_USE_POINT                 NUMBER,
                IN_S_PROFIT                    VARCHAR2,
                IN_S_SHOW                      VARCHAR2,
                O_CUR               OUT        SYS_REFCURSOR
        );

        PROCEDURE PROC_DELETE_SALES
        (
                IN_S_ID                         VARCHAR2
        );

        PROCEDURE PROC_UPDATE_SALES
        (
                IN_G_ID                         VARCHAR2
        );

        PROCEDURE PROC_INSERT_SALES
        (
                IN_G_ID                     VARCHAR2,
                IN_CT_ID                    VARCHAR2,
                IN_S_DATE                   DATE,
                IN_PY_ID                    VARCHAR2,
                IN_S_USE_POINT              NUMBER,
                O_MSG           OUT         VARCHAR2
        );

END PKG_SALES_TBL;