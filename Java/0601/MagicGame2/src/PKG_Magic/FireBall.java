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
		System.out.println("소비마나 : " + useMP);
		System.out.println("데미지 : " + (int)MDamege);
		System.out.println("화염으로 된 구체를 발사한다 구체에 맞은 적은 화상 데미지를 추가로 입게 된다");
		
	}
	
	public void useMagic() {
		
		System.out.println(MName + "을 사용합니다");
		burn();
		
	}
	
	public void burn() {
		
		Double burnDamege = MDamege * 0.05; 
		
		for(int i = 3; i > 0; i--) {
			
			System.out.println( i + "초간 추가로 화상 데미지를 " + burnDamege + "입힙니다");
			
		}
		
	}	
	
}
