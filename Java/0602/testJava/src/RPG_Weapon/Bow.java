package RPG_Weapon;

public class Bow extends Weapon {
	
	private int Arrow;
	
	public Bow(String wName, int wPower, int wHand) {
		
		super(wName, wPower, wHand);
		
	}
	
	public void supplyArrow() {
		if(Arrow == 1) {
			
			System.out.println("ȭ���� �̹� �����Ǿ��ֽ��ϴ�");
			
		}
		else {
			System.out.println("ȭ���� �����߽��ϴ�");
			this.Arrow += 1;
			
		}
	} 
	
	public void useWeapon() {
		String wName = super.getWName();
		if(Arrow == 1) {
			System.out.println(wName + "�� �̿��� ȭ���� ���ϴ�!");
			this.Arrow -= 1;
		}else {
			System.out.println("ȭ���� �����Ǿ����� �ʽ��ϴ�");
		}
	}
	
}
