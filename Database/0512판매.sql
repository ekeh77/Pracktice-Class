SELECT * FROM CUSTOMER_TBL
WHERE C_ID = 'C00001'
;

SELECT * FROM CUSTOMER_TBL T1, SALES_TBL T2
WHERE T1.C_ID = T2.C_ID
;