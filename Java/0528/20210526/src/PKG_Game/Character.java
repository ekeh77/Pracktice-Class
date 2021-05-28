package PKG_Game;


//추상화된 클래스
public class Character {
	
	//1.속성
	protected String cName;
	
	public Character(String cName) {
		
		this.cName = cName;
		
	}
	
	//2.행위
	public void run() {
		
		System.out.println(cName + "가 간다");
		
	}
	
	public void stop() {
		
		System.out.println(cName + "가 멈춘다");
		
	}
	
	//상속받는 각각의 캐릭터들의 나는 방법이 다 달라요
	public void fly() {
		System.out.println(cName + "가 난다");
	}
	
}
