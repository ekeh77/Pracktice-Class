package Monster;

public class Monster {
	private String monName;
	private int monHP;
	
	public Monster(String monName, int monHP) {
		
		this.monName = monName;
		this.monHP = monHP;
		
	}
	
	public String getMonsterName() {
		return monName;
	}
	
	public int getMonsterHP() {
		return monHP;
	}
	
	public void setMonsterHP(double Damage) {
		this.monHP -= Damage;
	}
	
	public void burnDamage (double burn) {
		System.out.println(this.monName + "가 화상으로" + burn + "의 추가 데미지를 입었다");
		this.monHP -= burn;
	}
	
	public void stop (double shock) {
		System.out.println(this.monName + "가" + shock + "초 기절했다");
	}
	public void slow (double slow) {
		System.out.println(this.monName +"가" + slow + "초 느려졌다");
	}
}
