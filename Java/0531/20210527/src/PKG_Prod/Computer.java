package PKG_Prod;

public class Computer extends Product {
	
	private String cpuName;
	
	public Computer(String pName, int pPrice, String cpuName) {
		
		super(pName, pPrice);
		this.cpuName = cpuName;
		
	}
	
	public double getPrice(double offRate) {
		
		int pPrice = super.getPPrice();
		
		double realPrice = pPrice * (1- offRate);
		
		return realPrice;
		
	} 
	
}
