package PKG_Sales;

//추상클래스 - 절대로 인스턴스화 할 수 없다 오로지 상속을 위한것
//추상클래스는 추상멤버를 가질 수 있다
public abstract class Product {
	
	private String pName;
	private int pPrice;
	
	public  Product(String pName, int pPrice) {
		
		this.pName = pName;
		this.pPrice = pPrice;
		
	}
	
	/*
	public double setRealPrice(double offRate) {
		
		double realPrice = this.pPrice * (1- offRate);
		
		return realPrice;
	}
	*/
	
	public String getPName() {
		
		return this.pName;
		
	}
	
	protected int getPrice() {
		
		return this.pPrice;
		
	}
	
	//추상멤버 - 메서드 - 내용이 없는메서드 > 행위만 있어요 > 진정한 추상화
	//상속을 받는 클래스에서 반드시 재정의(override) 해야만 한다
	public abstract double setRealPrice(double offRate);
	
}
