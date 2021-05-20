package playGround;
import Pracktice.GBB;

public class GBB_Ground {
	
	public static void main(String[] args) {
		
		GBB make_Gbb = new GBB();
		
		String a = make_Gbb.make_Computer_GBB(1);
		String b = make_Gbb.make_Player_GBB(2);
		
		make_Gbb.talk_Somthing(a);
		make_Gbb.talk_Somthing(b);
		
	}
	
}
