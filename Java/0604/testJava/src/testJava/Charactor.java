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
		System.out.println(this.weapon.getwName() + "의 탄창 " + this.weapon.getMagazineLen());
		

	}
	
	public void reloadWeapon() {
		
		for(int i = this.weapon.getMagazineLen(); i < this.weapon.getMagazine().length; i++) {
			
			this.weapon.setMagazine(1);
			System.out.println((this.weapon.getMagazineLen()) + "재장전중..");
		
		}
		System.out.println("장전완료!");
		
	}
	
	
	public void shot(Monster monster) {
		
		if(this.weapon.getMagazineLen() != 0) {
			
		System.out.println("빵!");
		this.weapon.setMagazine(-1);
		System.out.println("남은 탄약:" + this.weapon.getMagazineLen());
		
		getShot(monster);
		
		}
		else {
			
			System.out.println("탄약이 부족합니다 재장전해주세요");
			System.out.println("남은 탄약:" + this.weapon.getMagazineLen());
			
		}
		
	}
	
	int distance = 100;
	int MHP = Monster.getMHP();
	
	public void getShot(Monster monster) {

		if(distance <= 0) {
			System.out.println(monster.getMName() + "를 맞췄습니다! " + this.weapon.getWPower() + "의 피해를 줬습니다");
			System.out.println(monster.getMName() + "가 공격합니다! " + monster.getMPower() + "의 피해를 입었습니다");
			MHP -= this.weapon.getWPower();
			cHP -= monster.getMPower();
			distance = 0;
			
			if(MHP <= 0) {
				
				System.out.println(monster.getMName() + "를 쓰러뜨렸습니다!");
				
			}else if(MHP > 0 && cHP <= 0) {
				
				System.out.println("유다희");
				
			}
			
		}
		else {
			System.out.println(monster.getMName() + "를 맞췄습니다! " + this.weapon.getWPower() + "의 피해를 줬습니다");
			System.out.println(monster.getMName() + "가 쫓아옵니다 현재거리 :" + distance);
			
			MHP -= this.weapon.getWPower();
			distance -= 10;
			
			if(MHP <= 0) {
				System.out.println(monster.getMName() + "를 쓰러뜨렸습니다!");
			}
		}
		
	}
	
}
