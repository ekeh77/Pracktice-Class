package PKG_Game;


//�߻�ȭ�� Ŭ����
public class Character {
	
	//1.�Ӽ�
	protected String cName;
	
	public Character(String cName) {
		
		this.cName = cName;
		
	}
	
	//2.����
	public void run() {
		
		System.out.println(cName + "�� ����");
		
	}
	
	public void stop() {
		
		System.out.println(cName + "�� �����");
		
	}
	
	//��ӹ޴� ������ ĳ���͵��� ���� ����� �� �޶��
	public void fly() {
		System.out.println(cName + "�� ����");
	}
	
}
