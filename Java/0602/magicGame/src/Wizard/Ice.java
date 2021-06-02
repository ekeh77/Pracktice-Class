package Wizard;

public class Ice extends Magic{
	private float freezeTime;
	private double[] result;
	
	public Ice(String mName, int useMP, int mDamage) {
		
		super(mName, useMP, mDamage);
		
	}
	
	public void freeze() {
		
		System.out.println("동상으로 3초동안 " + (float)mDamage * (float)0.01f + "% 이동속도가 저하합니다");
		freezeTime = (float)mDamage * (float)0.01f;
		
	}
	
	@Override
	public double[] using(String monName) {
		
		System.out.println(monName + "에게 " + mName + "마법을 사용합니다");
		System.out.println("MP가 " + useMP + "소모됩니다");
		System.out.println(mDamage + " 데미지를 입혔습니다!");
		
		
		
		freeze();
		
		this.result = new double[4];
		result[0] = (double)useMP;
		result[1] = (double)mDamage;
		result[2] = (double)2;
		result[3] = (double)freezeTime;
		
		return result;
		
	}
	
	
}
