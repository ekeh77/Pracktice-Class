package PKG_Magic;

public class LightningBolt extends Magic implements Shok{
	
	public LightningBolt(String Mname, int useMp, int MDamege) {
		super(Mname, useMp, MDamege);
	}
	
	String MName = super.getMName();
	int useMP = super.getUseMP();
	double MDamege = super.getMDamege();
	
	public void magicInfo() {
		
		System.out.println(MName);
		System.out.println("�Һ񸶳� : " + useMP);
		System.out.println("������ : " + (int)MDamege);
		System.out.println("������ �� ��ü�� �߻��Ѵ� ��ü�� ���� ���� ��� �����Ѵ�");
		
	}
	
	public void useMagic() {
		
		System.out.println(MName + "�� ����մϴ�");
		shok();
		
	}
		
	public void shok() {
		
		for(int i = 2; i > 0; i--) {
			
			System.out.println(i + "�ʰ� �������� �����մϴ�");
			
		}
		
	}
	
}
