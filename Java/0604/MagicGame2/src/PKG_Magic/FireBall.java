package PKG_Magic;

public class FireBall extends Magic implements Burn{
	public FireBall(String Mname, int useMp, int MDamege) {
		super(Mname, useMp, MDamege);
	}
	
	String MName = super.getMName();
	int useMP = super.getUseMP();
	double MDamege = super.getMDamege();
	
	public void magicInfo() {
		
		System.out.println(MName);
		System.out.println("�Һ񸶳� : " + useMP);
		System.out.println("������ : " + (int)MDamege);
		System.out.println("ȭ������ �� ��ü�� �߻��Ѵ� ��ü�� ���� ���� ȭ�� �������� �߰��� �԰� �ȴ�");
		
	}
	
	public void useMagic() {
		
		System.out.println(MName + "�� ����մϴ�");
		burn();
		
	}
	
	public void burn() {
		
		Double burnDamege = MDamege * 0.05; 
		
		for(int i = 3; i > 0; i--) {
			
			System.out.println( i + "�ʰ� �߰��� ȭ�� �������� " + burnDamege + "�����ϴ�");
			
		}
		
	}	
	
}
