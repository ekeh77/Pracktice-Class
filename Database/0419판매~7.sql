create or replace NONEDITIONABLE PROCEDURE PROC_UPDATE_CUSTOMER2
(
   IN_C_ID      IN      VARCHAR2,
   IN_C_NAME   IN      VARCHAR2,
   IN_C_BIRTH   IN      DATE,
   IN_C_REGION   IN      VARCHAR2,
   IN_C_GENDER   IN      VARCHAR2
)
AS

   V_C_NAME         VARCHAR2(30);
   V_C_BIRTH         DATE;
   V_C_REGION         CHAR(6);
   V_C_GENDER         CHAR(1);

BEGIN

   SELECT 
      CASE
         WHEN IN_C_NAME IS NULL THEN C_NAME
         ELSE IN_C_NAME
      END
   INTO V_C_NAME
   FROM CUSTOMER_TBL
   WHERE C_ID = IN_C_ID
   ;

   UPDATE CUSTOMER_TBL
   SET C_NAME = V_C_NAME
   WHERE C_ID = IN_C_ID
   ;

END PROC_UPDATE_CUSTOMER;