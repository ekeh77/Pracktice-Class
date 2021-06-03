package PKG_Std;

public class Student {
	
	//1.접근제한자 - 클래스를 사용하는 개발자가 해당 필드, 메서드에 어디까지 접근이 가능한가
	/*
	 1.public
	 2.protected
	 3.default
	 4.private
	*/
	
    public String sName1;
	protected String sName2;
	String sName3;
	private String sName4;
	
	//1.private 필드나 메서드를 만들면 class 내부에서만 사용이 가능하다
	//2.protected, default는 같은 package내부의 클래스에서만 접근이 가능하다
	//3.protected - 상속에서 사용이 가능 default는 상속에서 사용 불가능
	//4.public - 클래스 사용자 마음대로 사용가능하다
	
}
