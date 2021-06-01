package PKG_Prod;

public abstract class Product {
	
	private String pName;
	private int pPrice;
	private double sPrice;
	
	public Product(String pName) {
		
	}
	
	public Product(String pName, int pPrice) {
		this.pName = pName;
		this.pPrice = pPrice;
	}
	
	public int getPPrice() {
		return this.pPrice;
	}
	
	
	//실제 판매 가격
	//추상메서드는 추상클래스를 상속받는 클래스에서 반드시 재정의해야한다
	public abstract double getPrice(double offRate);
	
}
