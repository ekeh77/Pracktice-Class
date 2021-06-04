package PKG_inOut;

public class Condition {
	
	//method
	public void conTest() {
		
		int i = 123;
		
		if(i < 100) {
			
			System.out.println("100보다 적다");
		}
		else if(i >= 100 && i <= 200 ){
			System.out.println("100보다 크거나 같고 200보다 작거나 같다");
		}
		else {
			System.out.println("200보다 크다");
		}
		
		if(i > 200 || i < 100 ) {
			
			System.out.println("두개중에 하나만 만족하면 된다");
			
		}
	}//conTest()
	
	public void conTest2() {
		int i = 5;
		
	    if ((i >= 4 && i <= 7) || i >= 15) {
	    	System.out.println("i는 4와 7사이거나 15보다 크다");
	    }
	    else {
	    	System.out.println("i는 4와 7사이가 아니고 15보다 작다");
	    }
	}
	
}
