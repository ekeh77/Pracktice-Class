SELECT * FROM BOARDS
WHERE NVL(TITLE,' ') LIKE "%"|| :IN_TITLE ||"%"
;-- ��� ���� ã�� ������ NULL �ʵ��� ���