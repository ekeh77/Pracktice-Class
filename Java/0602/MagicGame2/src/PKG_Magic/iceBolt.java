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
		System.out.println("소비마나 : " + useMP);
		System.out.println("데미지 : " + (int)MDamege);
		System.out.println("얼음으로 된 구체를 발사한다 구체에 맞은 적은 동상으로 이동속도가 느려진다");
		
	}
	
	public void useMagic() {
		
		System.out.println(MName + "을 사용합니다");
		slow();
		
	}
		
	public void slow() {
		
		Double slowPer = MDamege * 0.03;
		
		for(int i = 3; i > 0; i--) {
			
			System.out.println(i + "초간 동상으로 이동속도가 " + slowPer + "% 느려집니다");
			
		}
	}
	
}
