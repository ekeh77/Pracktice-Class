--1. TO_CHAR() : ������Ÿ���� ���ڿ����·� �ٲپ� �ִ� �Լ�
SELECT 'S' || TRIM(TO_CHAR(2,'000')) FROM DUAL;
--2. DECODE() : ���� ���� Ư������ �����ϰ� ���ִ� �Լ�
SELECT DECODE(F_GUBUN, 1, '�Ϸ�', 2, '���', 3, '�޷�', '����') FROM FINISH_DRIVE_TBL;
--3. NVL() : Ư�� �ʵ尪�� NULL�ϰ�쿡 �ش� NULL���� ��ü���ִ� ���� �� �� �ִ�
UPDATE F_MENUS
SET FMETC = '��'
WHERE FMID = 'FM02'
;
SELECT * FROM F_MENUS;
--COMMIT;
SELECT NVL(FMETC, '���� ���� ����') FROM F_MENUS;
--4. SYSDATE : ���� ��¥�� Ȯ��
SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') FROM DUAL;
--5. DUAL : ���� ���̺�(�� ���̺�)