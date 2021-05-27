package PKG_Sales;

public class Computer extends Product{
	private String cpuName;
	
	//Ŭ������ �̸��Ȱ��� �� Ŭ������ �ν��ͽ�ȭ �Ǿ��� �� �� �ѹ��� ����Ǵ� �޼���
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
