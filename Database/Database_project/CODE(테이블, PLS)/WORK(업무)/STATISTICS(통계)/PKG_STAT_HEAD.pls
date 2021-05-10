create or replace NONEDITIONABLE PACKAGE PKG_STAT AS 

    PROCEDURE PROC_STAT_REVIEW
    (
            IN_G_ID               VARCHAR2,
            O_CUR               OUT             SYS_REFCURSOR
    );

    PROCEDURE PROC_STAT_CUSTOMERS
    (
            IN_COUNTRY          VARCHAR2,
            IN_GENDER          VARCHAR2,
            IN_AGE                    VARCHAR2,    
            O_CUR               OUT             SYS_REFCURSOR     
    );

    PROCEDURE PROC_STAT_PERIOD
    (
            IN_YEAR          VARCHAR2,
            IN_QUARTER  VARCHAR2,
            IN_MONTH        NUMBER,
            O_CUR               OUT             SYS_REFCURSOR      
    );

END PKG_STAT;