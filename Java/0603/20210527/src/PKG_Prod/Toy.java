package PKG_Prod;

public class Toy extends Product{
	private String tName;
	
	public Toy(String pName, int pPrice, String tName) {
		
		super(pName, pPrice);
		this.tName = tName;
		
	}
	
	
	//�峭���� �ƹ��� ���η��� �־ �������ݿ��� ��ȭ�� ����
	public double getPrice(double offRate) {
		
		int pPrice = super.getPPrice();
		
		return  (double)pPrice;
	}
}
