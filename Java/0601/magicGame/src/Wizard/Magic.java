package Wizard;

public abstract class Magic {
	protected String mName;
	protected int useMP;
	protected int mDamage;
	private double[] result;
	
	public  Magic(String mName, int useMP, int mDamage){
		
		this.mName = mName;
		this.mDamage = mDamage;
		this.useMP = useMP;
		
	}
	
	public void getMagicInfo() {
		
		System.out.println(mName);
		System.out.println("�Ҹ� MP: " + useMP);
		System.out.println("���� ������: " + mDamage);
		
	}
	
	public abstract double[] using(String monName);
	
}
