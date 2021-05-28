package RPG_Weapon;

public class Sword extends Weapon{
	
	
	public Sword(String wName, int wPower, int wHand) {
		
		super(wName, wPower, wHand);
		
	}
	
	public void useWeapon() {
		
		String wName = super.getWName();
		System.out.println(wName + "∏¶ »÷µŒ∏®¥œ¥Ÿ!");
		
	}
	
}
