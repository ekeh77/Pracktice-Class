package PKG_Game;

//Character
public class Wizard extends Character implements flying {
	
	private String wName; // �����̸�
	
	public Wizard(String cName, String wName) {
		
		super(cName);
		this.wName = wName;
		
	}
	
	public String getWName() {
		
		return this.wName;
		
	}
	
	public void magic() {
		
		System.out.println(cName + "������ ����Ѵ�");
		
	}
	
	@Override //�޼����� ������ ������
	public void fly() {
		System.out.println(cName + " ��ó�� ���ƴٴѴ�");
	}
	
}
