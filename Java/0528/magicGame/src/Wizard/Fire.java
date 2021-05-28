package Wizard;

public class Fire extends Magic{

	private double burnDamage;
	private double[] result;
	
	public Fire(String mName, int useMP, int mDamage) {
			
			super(mName, useMP, mDamage);
			
		}
		
	private void burn() {
			
			System.out.println("ȭ������ ���ʸ���" + (double)mDamage * 0.05 + "�� �������� �ݴϴ�");
			burnDamage = (double)mDamage * 0.05;
	}
		
	@Override
	public double[] using(String monName) {
				
		System.out.println(monName + "���� " + mName + "������ ����մϴ�");
		System.out.println("MP�� " + useMP + "�Ҹ�˴ϴ�");
		System.out.println(mDamage + " �������� �������ϴ�!");

		burn();
		
		this.result = new double[4];
		result[0] = (double)useMP;
		result[1] = (double)mDamage;
		result[2] = (double)1;
		result[3] = (double)burnDamage;
		
		return result;
		
	}
	
	
}
