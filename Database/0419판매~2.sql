CREATE PROCEDURE PROC_TEST
(
    IN_NUM1     IN      NUMBER,
    IN_NUM2     IN      NUMBER,
    OUT_RST     OUT     NUMBER
)
AS
BEGIN
    
    --2���� ���ڰ��� �޾Ƽ� �ΰ��� ���ڸ� ���ϰ� 3���� ������ ����
    --������ ���̽��� �Ҵ��� := ���ٴ� = �̴�
    OUT_RST := IN_NUM1 * IN_NUM2 / 3;
    
    
END PROC_TEST
;