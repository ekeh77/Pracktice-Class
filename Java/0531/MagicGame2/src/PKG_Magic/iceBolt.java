package PKG_Magic;

public class iceBolt extends Magic implements Slow{
	public iceBolt(String Mname, int useMp, int MDamege) {
		super(Mname, useMp, MDamege);
	}
	
	String MName = super.getMName();
	int useMP = super.getUseMP();
	double MDamege = super.getMDamege();
	
	public void magicInfo() {
		
		System.out.println(MName);
		System.out.println("�Һ񸶳� : " + useMP);
		System.out.println("������ : " + (int)MDamege);
		System.out.println("�������� �� ��ü�� �߻��Ѵ� ��ü�� ���� ���� �������� �̵��ӵ��� ��������");
		
	}
	
	public void useMagic() {
		
		System.out.println(MName + "�� ����մϴ�");
		slow();
		
	}
		
	public void slow() {
		
		Double slowPer = MDamege * 0.03;
		
		for(int i = 3; i > 0; i--) {
			
			System.out.println(i + "�ʰ� �������� �̵��ӵ��� " + slowPer + "% �������ϴ�");
			
		}
	}
	
}
