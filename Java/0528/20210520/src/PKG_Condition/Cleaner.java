package PKG_Condition;

//청소기라는 객체
public class Cleaner {
	
	//메서드 값을 주면 정수 0으로 만들어서 돌려준다
	public int setClean(int a) {
		
		a = 0;
		
		return a;
	}
	
	//출력하는 메서드를 가지자
	public void clearPrint(String inStr) {
		
		System.out.println("청소기에 출력한다 : " + inStr);
		
	}
	
}
