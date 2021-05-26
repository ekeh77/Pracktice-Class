package Wizard;

public class Electricity extends Magic{

	private double shockDamage;
	private double[] result;
	
	public Electricity(String mName, int useMP, int mDamage) {
			
			super(mName, useMP, mDamage);
			
		}
		
	private void shock() {
			
			System.out.println("�������� " + (double)mDamage * 0.001 + "�� �����մϴ�");
			shockDamage = (double)mDamage * 0.001;
	}
		
	@Override
	public double[] using(String monName) {
		
		System.out.println(monName + "���� " + mName + "������ ����մϴ�");
		System.out.println("MP�� " + useMP + "�Ҹ�˴ϴ�");
		System.out.println(mDamage + " �������� �������ϴ�!");
		
		shock();
		
		this.result = new double[4];
		result[0] = (double)useMP;
		result[1] = (double)mDamage;
		result[2] = (double)3;
		result[3] = (double)shockDamage;
		
		return result;
		
	}
	
}
