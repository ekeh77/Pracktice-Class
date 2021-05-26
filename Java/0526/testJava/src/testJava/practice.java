package testJava;

public class practice {
	
	private String wName; 
	private int[] wMagazine;
	private int wPower;
	private int lenM;
	
	public void makeWeapon (String wName, int Magazine, int wPower) {
		this.wName = wName;
		this.wMagazine = new int[Magazine];
		lenM = this.wMagazine.length;
		
		for(int i = 0; i < wMagazine.length; i++) {
			
			this.wMagazine[i] = i;
		}
		
		this.wPower = wPower;
		
	}
	
	public String getwName() {
		return this.wName;
	}
	public int[] getMagazine() {
		return this.wMagazine;
	}
	public int getMagazineLen() {
		return this.lenM;
	}
	public int getWPower() {
		return this.wPower;
	}
	public void setMagazine(int num) {
		lenM += num;
	}
}
