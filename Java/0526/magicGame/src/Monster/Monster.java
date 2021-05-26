package Monster;

public class Monster {
	private String monName;
	private int monHP;
	
	public Monster(String monName, int monHP) {
		
		this.monName = monName;
		this.monHP = monHP;
		
	}
	
	public String getMonsterName() {
		return monName;
	}
	
	public int getMonsterHP() {
		return monHP;
	}
	
	public void setMonsterHP(double Damage) {
		this.monHP -= Damage;
	}
	
	public void burnDamage (double burn) {
		System.out.println(this.monName + "�� ȭ������" + burn + "�� �߰� �������� �Ծ���");
		this.monHP -= burn;
	}
	
	public void stop (double shock) {
		System.out.println(this.monName + "��" + shock + "�� �����ߴ�");
	}
	public void slow (double slow) {
		System.out.println(this.monName +"��" + slow + "�� ��������");
	}
}
