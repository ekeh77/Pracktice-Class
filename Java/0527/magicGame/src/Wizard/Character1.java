package Wizard;
import Monster.Monster;

public class Character1 {
	
	private String cName;
	private int MP;
	private Magic magic;
	
	public Character1(String cName, int MP) {
		
		this.cName = cName;
		this.MP = MP;
		
	}
	
	public String getCName() {
		return cName;
	}
	
	public int getMP() {
		return MP;
	}
	
	public void setMP(double setMP) {
		this.MP -= setMP;
	}
	
	public void getMagicSpell(Magic magic) {
		this.magic = magic;
	}
	
	public void MagicInfo() {
		this.magic.getMagicInfo();
	}
	
	public void useSpell(Monster monster) {
		
		String monName = monster.getMonsterName();
		
		double[] result = this.magic.using(monName);
		
		setMP(result[0]);
		monster.setMonsterHP(result[1]);
		if(result[2] == (double)1) {
			monster.burnDamage(result[3]);
		}
		else if(result[2] == (double)2){
			monster.slow(result[3]);
		}
		else if(result[2] == (double)3) {
			monster.stop(result[3]);
		}
		
	}
	
}
