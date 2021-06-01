package RPG_Weapon;

public abstract class Weapon {
	
	private String wName;
	private int wPower;
	private int wHand;
	
	public Weapon(String wName, int wPower, int wHand) {
		this.wName = wName;
		this.wPower = wPower;
		if(wHand >= 1 && wHand <= 2) {
			this.wHand = wHand;
		}
		else {
			this.wHand = 2;
		}
		
	}
	
	public void WeaponInfo() {
		
		System.out.println("무기이름 : " + this.wName);
		System.out.println("공격력 : " + this.wPower);
		String whatHand = "";
		
		if(this.wHand == 1) {
			
			whatHand = "한손";
			
		}
		else {
			
			whatHand = "양손";
			
		}
		
		System.out.println(whatHand);
		
	}
	
	public String getWName() {
		return this.wName;
	}
	
	public abstract void useWeapon();
	
}
