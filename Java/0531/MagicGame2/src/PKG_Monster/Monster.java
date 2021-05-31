package PKG_Monster;

public abstract class Monster {
	private String MonName;
	private int MonMaxHP;
	private int MonCurHP;
	private int MonDamege;
	private int MonEXP;
	private int MonMoney;
	
	public Monster(String MonName, int MonMaxHP, int MonDamege, int MonEXP, int MonMoney) {
		
		this.MonName = MonName;
		this.MonMaxHP = MonMaxHP;
		this.MonCurHP = MonMaxHP;
		this.MonDamege = MonDamege;
		this.MonEXP = MonEXP;
		this.MonMoney = MonMoney;
		
	}
	
	public abstract void attack();
	
	public String getMonName() {
		return this.MonName;
	}
	
	public int getMonDamege() {
		return this.MonDamege;
	}
	
	public int getMonMaxHP() {
		return this.MonMaxHP;
	}
	
	public int getMonCurHP() {
		return this.MonCurHP;
	}
	
	public int getMonEXP() {
		return this.MonEXP;
	}
	
	public int getMonMoney() {
		return this.MonMoney;
	}
}
