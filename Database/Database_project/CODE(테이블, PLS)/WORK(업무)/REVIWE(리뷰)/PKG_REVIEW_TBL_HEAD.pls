create or replace NONEDITIONABLE PACKAGE PKG_REVIEW_TBL AS 

    PROCEDURE PROC_REVIEW_INSERT
    (
            IN_S_ID                              IN              VARCHAR,
            IN_RV_SCORE                  IN             NUMBER,
            IN_RV_DATE                     IN           DATE,
            IN_RV_COMMENT           IN              VARCHAR2,
            O_MSG                               OUT         VARCHAR2
    );

    PROCEDURE PROC_REVIEW_SELECT
    (
            IN_RV_ID                IN              VARCHAR2,
            IN_RV_SCORE         IN              NUMBER,
            IN_RV_DATE          IN              DATE,
            IN_RV_SHOW          IN              VARCHAR2,
            O_CUR                   OUT             SYS_REFCURSOR
    );

    PROCEDURE PROC_REVIEW_DELETE
    (
            IN_RV_ID            IN              VARCHAR
    );

    PROCEDURE PROC_REVIEW_UPDATE
    (
            IN_RV_ID                           IN              VARCHAR2,
            IN_RV_COMMENT           IN              VARCHAR2
    );

END PKG_REVIEW_TBL;