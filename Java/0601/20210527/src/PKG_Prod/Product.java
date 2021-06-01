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
	
	
	//���� �Ǹ� ����
	//�߻�޼���� �߻�Ŭ������ ��ӹ޴� Ŭ�������� �ݵ�� �������ؾ��Ѵ�
	public abstract double getPrice(double offRate);
	
}
