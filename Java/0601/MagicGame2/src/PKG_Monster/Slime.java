package PKG_Monster;

public class Slime extends Monster{
	
	public Slime(String MonName, int MonMaxHP, int MonDamege, int MonEXP, int MonMoney) {
		
		super(MonName, MonMaxHP, MonDamege, MonEXP, MonMoney);
		
	}
	
	String MonName = super.getMonName();
	int MonDamege = super.getMonDamege();
	
	public void attack() {
		
		System.out.println(MonName + "�� ����! " + MonDamege + "�� �������� �Ծ����ϴ�");
		
	}
	
}
