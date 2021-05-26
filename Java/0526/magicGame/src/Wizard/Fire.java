package Wizard;

public class Fire extends Magic{

	private double burnDamage;
	private double[] result;
	
	public Fire(String mName, int useMP, int mDamage) {
			
			super(mName, useMP, mDamage);
			
		}
		
	private void burn() {
			
			System.out.println("화상으로 매초마다" + (double)mDamage * 0.05 + "의 데미지를 줍니다");
			burnDamage = (double)mDamage * 0.05;
	}
		
	@Override
	public double[] using(String monName) {
				
		System.out.println(monName + "에게 " + mName + "마법을 사용합니다");
		System.out.println("MP가 " + useMP + "소모됩니다");
		System.out.println(mDamage + " 데미지를 입혔습니다!");

		burn();
		
		this.result = new double[4];
		result[0] = (double)useMP;
		result[1] = (double)mDamage;
		result[2] = (double)1;
		result[3] = (double)burnDamage;
		
		return result;
		
	}
	
	
}
