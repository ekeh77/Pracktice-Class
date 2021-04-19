CREATE PROCEDURE PROC_TEST
(
    IN_NUM1     IN      NUMBER,
    IN_NUM2     IN      NUMBER,
    OUT_RST     OUT     NUMBER
)
AS
BEGIN
    
    --2개의 숫자값을 받아서 두개의 숫자를 곱하고 3으로 나누는 로직
    --데이터 베이스의 할당은 := 같다는 = 이다
    OUT_RST := IN_NUM1 * IN_NUM2 / 3;
    
    
END PROC_TEST
;