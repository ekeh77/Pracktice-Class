create or replace NONEDITIONABLE PACKAGE BODY PKG_UP_GRADE AS

  PROCEDURE PROC_UP_GRADE
(
    IN_CT_ID                VARCHAR2
) 
AS

   V_CT_ID_TLT          VARCHAR2(7);

  BEGIN
    
   SELECT SUM(T1.G_SALES_PRICE) -- AS TLTPRICE
   INTO V_CT_ID_TLT
   FROM GAMES_TBL T1, SALES_TBL T2
   WHERE T1.G_ID = T2.G_ID
   AND CT_ID = IN_CT_ID
   ;
   
      IF V_CT_ID_TLT >= 200000 AND V_CT_ID_TLT < 500000 THEN
         
         UPDATE CUSTOMERS_TBL
         SET CT_GRADE = 'CMS030'
         WHERE CT_ID = IN_CT_ID
         ;
      
      ELSIF V_CT_ID_TLT >= 500000 AND V_CT_ID_TLT < 800000 THEN
      
         UPDATE CUSTOMERS_TBL
         SET CT_GRADE = 'CMS029'
         WHERE CT_ID = IN_CT_ID
         ;
      
      ELSIF V_CT_ID_TLT >= 1000000 THEN
      
         UPDATE CUSTOMERS_TBL
         SET CT_GRADE = 'CMS028'
         WHERE CT_ID = IN_CT_ID
         ;
      
      ELSE
         UPDATE CUSTOMERS_TBL
         SET CT_GRADE = 'CMS031'
         WHERE CT_ID = IN_CT_ID
         ;   
      END IF;
  
  END PROC_UP_GRADE;

END PKG_UP_GRADE;