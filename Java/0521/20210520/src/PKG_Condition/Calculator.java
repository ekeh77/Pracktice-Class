package PKG_Condition;

//계산기
public class Calculator {
 	
	//메서드 Method - 행위 > 두개의 정수값을 받아서 더하고 그 정수값을 돌려주는 메서드
	public int getPlus(int a, int b) {
		
	int c = a + b;
	return c;
	
	}
	
	//던져진다
	public void calThrows() {
		
		System.out.println("던져졌다");
		
	}
	
	//출력하는 행위
	public void resultPrint(String inStr) {
		
		System.out.println("계산기에 출력한다 : " + inStr);
		
	}
}
