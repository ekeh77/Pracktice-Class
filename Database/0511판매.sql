--CURSOR 커서
--데이터가 선택되어있는 곳

FOR CUR IN
    (
        SELECT N_ID, S_ID, N_DATE, N_MEMO FROM NEWS -- 뭐가 LOOP하는지
    )
LOOP --LOOP가 시작된다

    --LOOP해서 할것
    DBMS_OUTPUT.PUT_LINE(CUR.N_ID); -- 자바스크립트의 DOCUMENT.WRITE

END LOOP NEWS;--LOOP 끝

--FULL SCAN
-- 모든 데이터를 스캔하는것을 의미

--UNION - 중복된 데이터도 같이 가지고옴
--UNION ALL - 중복된 데이터를 하나만 가지고옴
--데이터를 ROW로 붙이는것
-- SELECT 자리에 필드가 같아야함

SELECT * FROM CUSTOMER_TBL;

INSERT INTO CUSTOMER_TBL VALUES('C00016', '박우석', '2011-05-09', 'R00002', 'M', '1234', 0);
--COMMIT;

DELETE FROM CUSTOMER_TBL
WHERE C_ID = 'C00013'
;

UPDATE CUSTOMER_TBL
SET C_NAME = '홍길동'
WHERE C_ID = 'C00001'
;