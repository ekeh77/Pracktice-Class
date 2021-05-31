package testJava;

public class Charactor {
	private String cName;
	private practice weapon;
	private int cHP;
	
	public Charactor(String cName){
		
		this.cName = cName;
		cHP = 50;
		
	}
	
	public String getCName() {
		
		return this.cName;
		
	}
	
	public void getWeapon(practice weapon) {
		this.weapon = weapon;
	}
	
	public void sayWeaponInfo() {
		
		System.out.println(this.weapon.getwName());
		System.out.println(this.weapon.getwName() + "�� źâ " + this.weapon.getMagazineLen());
		

	}
	
	public void reloadWeapon() {
		
		for(int i = this.weapon.getMagazineLen(); i < this.weapon.getMagazine().length; i++) {
			
			this.weapon.setMagazine(1);
			System.out.println((this.weapon.getMagazineLen()) + "��������..");
		
		}
		System.out.println("�����Ϸ�!");
		
	}
	
	
	public void shot(Monster monster) {
		
		if(this.weapon.getMagazineLen() != 0) {
			
		System.out.println("��!");
		this.weapon.setMagazine(-1);
		System.out.println("���� ź��:" + this.weapon.getMagazineLen());
		
		getShot(monster);
		
		}
		else {
			
			System.out.println("ź���� �����մϴ� ���������ּ���");
			System.out.println("���� ź��:" + this.weapon.getMagazineLen());
			
		}
		
	}
	
	int distance = 100;
	int MHP = Monster.getMHP();
	
	public void getShot(Monster monster) {

		if(distance <= 0) {
			System.out.println(monster.getMName() + "�� ������ϴ�! " + this.weapon.getWPower() + "�� ���ظ� ����ϴ�");
			System.out.println(monster.getMName() + "�� �����մϴ�! " + monster.getMPower() + "�� ���ظ� �Ծ����ϴ�");
			MHP -= this.weapon.getWPower();
			cHP -= monster.getMPower();
			distance = 0;
			
			if(MHP <= 0) {
				
				System.out.println(monster.getMName() + "�� �����߷Ƚ��ϴ�!");
				
			}else if(MHP > 0 && cHP <= 0) {
				
				System.out.println("������");
				
			}
			
		}
		else {
			System.out.println(monster.getMName() + "�� ������ϴ�! " + this.weapon.getWPower() + "�� ���ظ� ����ϴ�");
			System.out.println(monster.getMName() + "�� �Ѿƿɴϴ� ����Ÿ� :" + distance);
			
			MHP -= this.weapon.getWPower();
			distance -= 10;
			
			if(MHP <= 0) {
				System.out.println(monster.getMName() + "�� �����߷Ƚ��ϴ�!");
			}
		}
		
	}
	
}
