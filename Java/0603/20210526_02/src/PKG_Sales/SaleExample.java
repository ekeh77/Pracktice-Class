package PKG_Sales;

public class SaleExample {

	public static void main(String[] args) {
		
		Computer C = new Computer("��ǻ��", 50000, "OLD CPU");
		
		double realPrice = C.setRealPrice(0.15);
		
		System.out.println(C.getPName() + " : " + realPrice);
		
	}

}
