package PKG_Sales;

public class Computer extends Product{
	private String cpuName;
	
	//클래스와 이름똑같고 이 클래스가 인스터스화 되어질 때 딱 한번만 실행되는 메서드
	public Computer(String pName, int pPrice, String cpuName) {
		
		super(pName, pPrice);
		this.cpuName = cpuName;
	}
	
	@Override
	public double setRealPrice(double offRate) {
		
		int price = super.getPrice();;
		double realPrice = price * (1 - offRate);
		
		return realPrice;
		
	}
	
}
