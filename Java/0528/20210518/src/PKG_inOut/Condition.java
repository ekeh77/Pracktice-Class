package PKG_inOut;

public class Condition {
	
	//method
	public void conTest() {
		
		int i = 123;
		
		if(i < 100) {
			
			System.out.println("100���� ����");
		}
		else if(i >= 100 && i <= 200 ){
			System.out.println("100���� ũ�ų� ���� 200���� �۰ų� ����");
		}
		else {
			System.out.println("200���� ũ��");
		}
		
		if(i > 200 || i < 100 ) {
			
			System.out.println("�ΰ��߿� �ϳ��� �����ϸ� �ȴ�");
			
		}
	}//conTest()
	
	public void conTest2() {
		int i = 5;
		
	    if ((i >= 4 && i <= 7) || i >= 15) {
	    	System.out.println("i�� 4�� 7���̰ų� 15���� ũ��");
	    }
	    else {
	    	System.out.println("i�� 4�� 7���̰� �ƴϰ� 15���� �۴�");
	    }
	}
	
}
