package PKG_Game;

//character
public class Fighter extends Character{
	
	private String wName = ""; //무기이름
	
	public Fighter(String cName) {
		
		super(cName);
		
	}
	
	public Fighter(String cName, String wName) {
		
		super(cName);
		this.wName = wName;
	}
	
	public void setWName(String wName) {
		this.wName = wName;
	}
	
	public String getWName() {
		return	this.wName;
	}
	
	public void fight() {
		System.out.println(cName + "가 " + this.wName + "을 가지고 싸운다");
	}
	
}
