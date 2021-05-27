package PKG_Prod;

public class Member {
	
	//상품을 구매한다
	public void purchase(Product p) {
		
		double realPrice = p.getPrice(0.5);
		
		System.out.println(realPrice);
		
	}
	
}
