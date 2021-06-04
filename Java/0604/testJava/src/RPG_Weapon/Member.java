package RPG_Weapon;

public class Member {
	private Weapon weapon;
	
	public void getWeapon(Weapon w) {
		this.weapon = w;
	}
	
	public void getWInfo() {
		this.weapon.WeaponInfo();
	}
	
	public void userUse(Weapon w) {
		w.useWeapon();
	}
	
	public void supplyArrow(Bow b) {
		b.supplyArrow();
	} 
	
	
}
