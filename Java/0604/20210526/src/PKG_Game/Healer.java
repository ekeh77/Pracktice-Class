package PKG_Game;

//Character
public class Healer extends Character{
	private String mName;
	
	public Healer(String cName, String mName) {
		
		super(cName);
		this.mName = mName;
		
	}
	
	public void heal() {
		System.out.println(cName + "이 치료한다");
	}
	
	@Override
	public void fly() {
		System.out.println(cName + "가 날라다니는거 맞어");
	}
	
}
