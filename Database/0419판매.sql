--���ν���
--���ν����� �˱����ؼ� 2������ �� �ʿ䰡�ִ�
--1.BUSINESSLOGIC
--2.TRANSACTION

SELECT * FROM CUSTOMER_TBL
WHERE C_ID = 'C00001'
;
SELECT * FROM CUSTOMER_TBL
WHERE C_ID LIKE '%ȫ%'
;

--���ν���
--������ ��ġ �Լ��� ���� �ٸ��� �ʾƿ�
--�Ű��������� �޾Ƽ� ó��
--1. ���ϰ��� ����
--2. TRANSACTION ���� -- �ѹ��� ó���ؾ��� �ּҴ��� ALL OR NOTING
--3. ���ν����� ����ó�� �ּҴ���
-- ���ν����� �ϳ��� ��ɹ��� ������ ���� �������� �� ROLLBACK�Ѵ�
SELECT *
FROM CUSTOMER_TBL
;