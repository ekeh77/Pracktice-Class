package PKG_Game;

//Character
public class Healer extends Character{
	private String mName;
	
	public Healer(String cName, String mName) {
		
		super(cName);
		this.mName = mName;
		
	}
	
	public void heal() {
		System.out.println(cName + "�� ġ���Ѵ�");
	}
	
	@Override
	public void fly() {
		System.out.println(cName + "�� ����ٴϴ°� �¾�");
	}
	
}
