package PKG_Test;

public class Charactor {
	
	
	//has a ����
	//1.�ʵ�, �Ӽ�
		private String cName;
		private Weapon weapon;
		
	//2.������
	public Charactor(String cName) {
		
		this.cName = cName;
		
	}
	
	
	//3.�޼���
	public void getWeapon(Weapon weapon) {
		
		this.weapon = weapon;
		
	}
	
	public String getWeaponName() {
		return this.weapon.getWeaponName();
	}
	
	public void Shot() {
		
		this.weapon.wShot();
		
	}
}
