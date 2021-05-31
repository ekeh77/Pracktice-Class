package PKG_Monster;

public class Slime extends Monster{
	
	public Slime(String MonName, int MonMaxHP, int MonDamege, int MonEXP, int MonMoney) {
		
		super(MonName, MonMaxHP, MonDamege, MonEXP, MonMoney);
		
	}
	
	String MonName = super.getMonName();
	int MonDamege = super.getMonDamege();
	
	public void attack() {
		
		System.out.println(MonName + "의 공격! " + MonDamege + "의 데미지를 입었습니다");
		
	}
	
}
