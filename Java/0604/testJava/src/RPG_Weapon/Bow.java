package RPG_Weapon;

public class Bow extends Weapon {
	
	private int Arrow;
	
	public Bow(String wName, int wPower, int wHand) {
		
		super(wName, wPower, wHand);
		
	}
	
	public void supplyArrow() {
		if(Arrow == 1) {
			
			System.out.println("화살이 이미 장전되어있습니다");
			
		}
		else {
			System.out.println("화살을 장전했습니다");
			this.Arrow += 1;
			
		}
	} 
	
	public void useWeapon() {
		String wName = super.getWName();
		if(Arrow == 1) {
			System.out.println(wName + "을 이용해 화살을 쏩니다!");
			this.Arrow -= 1;
		}else {
			System.out.println("화살이 장전되어있지 않습니다");
		}
	}
	
}
