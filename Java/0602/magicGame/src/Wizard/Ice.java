package Wizard;

public class Ice extends Magic{
	private float freezeTime;
	private double[] result;
	
	public Ice(String mName, int useMP, int mDamage) {
		
		super(mName, useMP, mDamage);
		
	}
	
	public void freeze() {
		
		System.out.println("�������� 3�ʵ��� " + (float)mDamage * (float)0.01f + "% �̵��ӵ��� �����մϴ�");
		freezeTime = (float)mDamage * (float)0.01f;
		
	}
	
	@Override
	public double[] using(String monName) {
		
		System.out.println(monName + "���� " + mName + "������ ����մϴ�");
		System.out.println("MP�� " + useMP + "�Ҹ�˴ϴ�");
		System.out.println(mDamage + " �������� �������ϴ�!");
		
		
		
		freeze();
		
		this.result = new double[4];
		result[0] = (double)useMP;
		result[1] = (double)mDamage;
		result[2] = (double)2;
		result[3] = (double)freezeTime;
		
		return result;
		
	}
	
	
}
