/* TYPE(유형) */

--프로시저 안에서 사용 CUSTOMER_TBL.C_ID%TYPE > 이 테이블 중 이 필드의 타입과 같다
--(TYPE을 참조할 때 사용)

--사용자 정의 유형
CREATE TYPE TEST_VARRAY IS VARRAY(3) OF NUMBER;
--3개의 배열을 가지고 있는 넘버 유형
--사용할 때
--V_ARRAY       TEST_VARRAY
--V_ARRAY :=  TEST_VARRAY(1,3,5);
--V_NUM := V_ARRAY(1) + V_ARRAY(2)+ V_ARRAY(3);

CREATE TYPE TEST_TABLE IS TABLE OF VARCHAR2(20);
--테이블 형태(배열)를 가지고 있는 바차 유형
--사용할 때
--V_TABLE       TEST_TABLE;
--V_TABLE := TEST_TABLE('가나다','마바사','아자차');
--V_NAME := V_TABLE(1) || V_TABLE(2) || V_TABLE(3)

CREATE OR REPLACE TYPE TEST_OBJ AS OBJECT-- AS 대신 IS 가능
(
    C_ID        CHAR(6),
    C_POINT     NUMBER(10)
);
--오브젝트를 생성하는 유형
--사용할 때
--사이즈와 사이즈를 여러개 사용가능
/*
V_OBJ        TEST_OBJ;
V_OBJ := TEST_OBJ('C00004', 51424);

V_OBJ.C_ID || V_OBJ.C_POINT;
*/

--함수를 여러개로 리턴할 수 있기 때문에 사용하기도한다