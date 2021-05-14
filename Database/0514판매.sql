--TYPE

DECLARE

    TBL     TEST_TBL; --COLLECTION
    NNN     NUMBER(5);
    
BEGIN

    TBL := TEST_TBL(3, 4, 5, 6, 7, 8);
    
    NNN := TBL(1) + TBL(2) + TBL(3) + TBL(4) + TBL(5) + TBL(6); 
    
    
END;

CREATE OR REPLACE NONEDITIONABLE TYPE TEST_TBL IS TABLE OF NUMBER INDEX BY BINARY_INTEGER;

TYPE TEST_TBL IS TABLE OF VARCHAR2(30) INDEX BY BINARY_INTEGER;
--꼭 전역 유형을 쓰지않아도 패키지내에 이렇게 정의하면 변수로 유형을 사용가능

--VARCHAR2, NUMBER(INTEGER, DOUBLE, FLOAT)는 오라클엔진이 가지고있는 함수같은거
--오라클 사용자가 조금 더 편하게 코딩할 수 있도록 배려

SET SERVEROUTPUT ON
SET TIME ON; --총 시간표시
DECLARE
    AA      NUMBER(10);
    BB      NUMBER(10);
    CC      NUMBER(10);
BEGIN
    FOR I IN 1..1000000
    LOOP
        AA := I + 1;
        BB := I + 2;
        CC := AA+BB;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(CC);
END;
---------------속도가 느림

SET SERVEROUTPUT ON
SET TIME ON; --총 시간표시
DECLARE
    AA      BINARY_INTEGER;
    BB      BINARY_INTEGER;
    CC      BINARY_INTEGER;
BEGIN
    FOR I IN 1..1000000
    LOOP
        AA := I + 1;
        BB := I + 2;
        CC := AA+BB;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(CC);
END;
-----------------------속도가 빠름

SET SERVEROUTPUT ON
SET TIME ON; --총 시간표시
DECLARE
    AA      INTEGER;
    BB      INTEGER;
    CC      INTEGER;
BEGIN
    FOR I IN 1..1000000
    LOOP
        AA := I + 1;
        BB := I + 2;
        CC := AA+BB;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(CC);
END;
-----------------------속도가 NUMBER보다 빠름