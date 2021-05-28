package PKG_Prod;

public class Toy extends Product{
	private String tName;
	
	public Toy(String pName, int pPrice, String tName) {
		
		super(pName, pPrice);
		this.tName = tName;
		
	}
	
	
	//장난감은 아무리 할인률을 주어도 실제가격에는 변화가 없다
	public double getPrice(double offRate) {
		
		int pPrice = super.getPPrice();
		
		return  (double)pPrice;
	}
}
