package PKG_Prod;

public class Member {
	
	//��ǰ�� �����Ѵ�
	public void purchase(Product p) {
		
		double realPrice = p.getPrice(0.5);
		
		System.out.println(realPrice);
		
	}
	
}
