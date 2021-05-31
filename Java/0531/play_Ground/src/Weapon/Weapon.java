package Weapon;

public class Weapon {
	private String wName;
	private int wPower;
	
	public Weapon(String wName, int wPower){
		
		this.wName = wName;
		this.wPower = wPower;
		
	}
	
	public String WeaponName() {
		return this.wName;
	}
	
	public int WeaponPower() {
		return this.wPower;
	}
	
}
