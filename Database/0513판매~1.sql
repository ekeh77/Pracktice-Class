/* TYPE(����) */

--���ν��� �ȿ��� ��� CUSTOMER_TBL.C_ID%TYPE > �� ���̺� �� �� �ʵ��� Ÿ�԰� ����
--(TYPE�� ������ �� ���)

--����� ���� ����
CREATE TYPE TEST_VARRAY IS VARRAY(3) OF NUMBER;
--3���� �迭�� ������ �ִ� �ѹ� ����
--����� ��
--V_ARRAY       TEST_VARRAY
--V_ARRAY :=  TEST_VARRAY(1,3,5);
--V_NUM := V_ARRAY(1) + V_ARRAY(2)+ V_ARRAY(3);

CREATE TYPE TEST_TABLE IS TABLE OF VARCHAR2(20);
--���̺� ����(�迭)�� ������ �ִ� ���� ����
--����� ��
--V_TABLE       TEST_TABLE;
--V_TABLE := TEST_TABLE('������','���ٻ�','������');
--V_NAME := V_TABLE(1) || V_TABLE(2) || V_TABLE(3)

CREATE OR REPLACE TYPE TEST_OBJ AS OBJECT-- AS ��� IS ����
(
    C_ID        CHAR(6),
    C_POINT     NUMBER(10)
);
--������Ʈ�� �����ϴ� ����
--����� ��
--������� ����� ������ ��밡��
/*
V_OBJ        TEST_OBJ;
V_OBJ := TEST_OBJ('C00004', 51424);

V_OBJ.C_ID || V_OBJ.C_POINT;
*/

--�Լ��� �������� ������ �� �ֱ� ������ ����ϱ⵵�Ѵ�