package PKG_Sale;

public class Product {
	
	//1.�߻�ȭ
	private String pID;
	private String pName;
	private int price;
	//1.1 ������
	public Product(String pID, String pName, int price) {
		this.pID = pID;
		this.pName = pName;
		this.price = price;
	}
	//2.����
	
	public String getPName() {
		return this.pName;
	}
	public int getPrice() {
		return this.price;
	}
	
	public void setPrice(int chgPrice) {
		this.price = chgPrice;
	}
	
	//���Ÿ���Ʈ

}
