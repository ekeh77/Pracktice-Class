package Monster;

public class make_Monster {
	
	private String monster_Name;
	private int monster_HP;
	private int monster_Power;
	private int monster_Exp;
	private int monster_Money;
	
	
	//몬스터 생성
	public make_Monster(String monster_Name, int monster_HP, int monster_Power, int monster_Exp, int monster_Money){
		
		this.monster_Name = monster_Name;
		this.monster_HP = monster_HP;
		this.monster_Power = monster_Power;
		this.monster_Exp = monster_Exp;
		this.monster_Money = monster_Money;
		
	}
	
	public String get_Monster_Name() {
		return this.monster_Name;
	}
	public int get_Monster_Exp() {
		return this.monster_Exp;
	}
	public int get_Monster_Money() {
		return this.monster_Money;
	}
	public int get_Moster_HP() {
		return this.monster_HP;
	}
	public int get_Monster_Power() {
		return this.monster_Power;
	}
	
}
