--1. INDEX
    
    --PRIMARY KEY를 사용하면 자동으로 INDEX가 만들어진다
    --INDEX를 사용하지 않으면 중복을 생각하며 FULL SCAN을 한다
    --INDEX는 많이 걸면 SELECT속도는 빨라질지 모르나 INSERT UPDATE DELETE는 느려질 수 있다(100만개 이상)
    
    --B-TREE INDEX
        --고유(CLUSTERED) INDEX > 중복을 고려하지않고 트리구조를 만들어서 정렬
        --고유하지않음(NON CLUSTERED) INDEX > 중복을 고려한 트리구조를 만들어서 정렬 
        
    --비트맵(BITMAP) INDEX : 2진수로 데이터를 정렬
    --해당 필드에 데이터의 종류가 정말로 한정되어 있을 때 사용
        
--제약 조건 > 데이터를 조작할 때 제약되는 조건을 설정하는것
    --외래키 일 대 다 관계에서 다의 조인 할 일의 ID를 연결시키는 키
    --삭제시 작업없음 > 작업하지마라
    --      종속삭제 > 삭제하면 같이 삭제
    --      NULL > NULL로 변경
--2. 반복문