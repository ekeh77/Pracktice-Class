package PKG_Test;

public class Charactor {
	
	
	//has a 관계
	//1.필드, 속성
		private String cName;
		private Weapon weapon;
		
	//2.생성자
	public Charactor(String cName) {
		
		this.cName = cName;
		
	}
	
	
	//3.메서드
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
