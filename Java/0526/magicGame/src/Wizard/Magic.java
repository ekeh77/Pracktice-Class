package Wizard;

public class Magic {
	protected String mName;
	protected int useMP;
	protected int mDamage;
	private double[] result;
	
	public Magic(String mName, int useMP, int mDamage){
		
		this.mName = mName;
		this.mDamage = mDamage;
		this.useMP = useMP;
		
	}
	
	public void getMagicInfo() {
		
		System.out.println(mName);
		System.out.println("소모 MP: " + useMP);
		System.out.println("마법 데미지: " + mDamage);
		
	}
	
	public double[] using(String monName) {
		
		System.out.println(monName + "에게 " + mName + "마법을 사용합니다");
		System.out.println("MP가 " + useMP + "소모됩니다");
		System.out.println(mDamage + "데미지를 입혔습니다!");
		
		this.result = new double[4];
		result[0] = (double)useMP;
		result[1] = (double)mDamage;
		result[2] = (double)0;
		result[3] = (double)0;
		
		return result;
		
		
	}
	
}
