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
		System.out.println("�Ҹ� MP: " + useMP);
		System.out.println("���� ������: " + mDamage);
		
	}
	
	public double[] using(String monName) {
		
		System.out.println(monName + "���� " + mName + "������ ����մϴ�");
		System.out.println("MP�� " + useMP + "�Ҹ�˴ϴ�");
		System.out.println(mDamage + "�������� �������ϴ�!");
		
		this.result = new double[4];
		result[0] = (double)useMP;
		result[1] = (double)mDamage;
		result[2] = (double)0;
		result[3] = (double)0;
		
		return result;
		
		
	}
	
}
