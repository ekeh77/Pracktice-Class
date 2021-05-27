package Wizard;

public class Electricity extends Magic{

	private double shockDamage;
	private double[] result;
	
	public Electricity(String mName, int useMP, int mDamage) {
			
			super(mName, useMP, mDamage);
			
		}
		
	private void shock() {
			
			System.out.println("감전으로 " + (double)mDamage * 0.001 + "초 기절합니다");
			shockDamage = (double)mDamage * 0.001;
	}
		
	@Override
	public double[] using(String monName) {
		
		System.out.println(monName + "에게 " + mName + "마법을 사용합니다");
		System.out.println("MP가 " + useMP + "소모됩니다");
		System.out.println(mDamage + " 데미지를 입혔습니다!");
		
		shock();
		
		this.result = new double[4];
		result[0] = (double)useMP;
		result[1] = (double)mDamage;
		result[2] = (double)3;
		result[3] = (double)shockDamage;
		
		return result;
		
	}
	
}
