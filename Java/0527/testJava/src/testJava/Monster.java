package testJava;

public class Monster {
	
	private String MName;
	private static int MHP;
	private int MPower;

	
	public Monster(String MName, int MHP, int MPower) {
		this.MName = MName;
		this.MHP = MHP;
		this.MPower = MPower;
	}
	
	public String getMName() {
		return MName;
	}
	public static int getMHP() {
		return MHP;
	} 
	
	public int getMPower() {
		return MPower;	
	}
	
}
