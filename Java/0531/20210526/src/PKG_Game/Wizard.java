package PKG_Game;

//Character
public class Wizard extends Character implements flying {
	
	private String wName; // 마법이름
	
	public Wizard(String cName, String wName) {
		
		super(cName);
		this.wName = wName;
		
	}
	
	public String getWName() {
		
		return this.wName;
		
	}
	
	public void magic() {
		
		System.out.println(cName + "마법을 사용한다");
		
	}
	
	@Override //메서드의 재정의 다형성
	public void fly() {
		System.out.println(cName + " 새처럼 날아다닌다");
	}
	
}
