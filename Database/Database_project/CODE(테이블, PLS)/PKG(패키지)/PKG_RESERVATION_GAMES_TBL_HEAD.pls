create or replace NONEDITIONABLE PACKAGE PKG_RESERVATION_GAMES_TBL AS 
        
        PROCEDURE PROC_SELECT_RESERVATION
        (
                IN_G_ID                                 VARCHAR2,
                IN_G_NAME                               VARCHAR2,
                IN_G_MAKER                              VARCHAR2,
                IN_G_GENRE                              VARCHAR2,
                IN_G_R_BEGINDATE                        DATE,
                IN_G_R_RELEASE                          DATE,
                IN_G_R_DISCOUNT_PER                     NUMBER,
                IN_G_R_SUPPLY_PRICE                     NUMBER,
                IN_G_R_SALES_PRICE                      NUMBER,
                IN_G_R_SHOW                             VARCHAR,
                O_CUR                   OUT             SYS_REFCURSOR
        );

        PROCEDURE PROC_DELETE_RESERVATION
        (
                IN_G_ID                                 VARCHAR2
        );

        PROCEDURE PROC_UPDATE_RESERVATION
        (
                IN_G_ID                                 VARCHAR2,
                IN_G_NAME                               VARCHAR2,
                IN_G_MAKER                              VARCHAR2,
                IN_G_GENRE                              VARCHAR2,
                IN_G_R_BEGINDATE                        DATE,
                IN_G_R_RELEASE                          DATE,
                IN_G_R_DISCOUNT_PER                     NUMBER,
                IN_G_R_SUPPLY_PRICE                     NUMBER,
                IN_G_R_SALES_PRICE                      NUMBER
        );

        PROCEDURE PROC_INSERT_RESERVATION
        (
                IN_G_NAME                               VARCHAR2,
                IN_G_MAKER                              VARCHAR2,
                IN_G_GENRE                              VARCHAR2,
                IN_G_R_REGINDATE                        DATE,
                IN_G_R_RELEASE                          DATE,
                IN_G_R_SUPPLY_PRICE                     NUMBER,
                IN_G_R_SALES_PRICE                      NUMBER
        );
        
        PROCEDURE PROC_REFRESH_RESERVATION
        (
                BUTTON                                  VARCHAR2
        );

END PKG_RESERVATION_GAMES_TBL;