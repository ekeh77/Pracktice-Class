package PKG_Sales;

//�߻�Ŭ���� - ����� �ν��Ͻ�ȭ �� �� ���� ������ ����� ���Ѱ�
//�߻�Ŭ������ �߻����� ���� �� �ִ�
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
	
	//�߻��� - �޼��� - ������ ���¸޼��� > ������ �־�� > ������ �߻�ȭ
	//����� �޴� Ŭ�������� �ݵ�� ������(override) �ؾ߸� �Ѵ�
	public abstract double setRealPrice(double offRate);
	
}
