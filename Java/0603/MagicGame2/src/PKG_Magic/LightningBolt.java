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
		System.out.println("소비마나 : " + useMP);
		System.out.println("데미지 : " + (int)MDamege);
		System.out.println("번개로 된 구체를 발사한다 구체에 맞은 적은 잠시 기절한다");
		
	}
	
	public void useMagic() {
		
		System.out.println(MName + "을 사용합니다");
		shok();
		
	}
		
	public void shok() {
		
		for(int i = 2; i > 0; i--) {
			
			System.out.println(i + "초간 감전으로 기절합니다");
			
		}
		
	}
	
}
