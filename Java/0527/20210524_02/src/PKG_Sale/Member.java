package PKG_Sale;

public class Member {
	
	int total_Price = 0;
	int mat = 0;
	int totalPrice = 0;
	
	//1.�߻�ȭ
	//�ʵ�(field) - �Ӽ�(property)
	private String mID;
	private String mName;
	private String mGender;
	

	//������
	public Member(String mID, String mName, String mGender) {
		this.mID = mID;
		this.mName = mName;
		this.mGender = mGender;
	}
	
	//����
	public void purchase(Product prod, int qty) {
		String prodName = prod.getPName();
		int prodPrice = prod.getPrice();
		
		//ȫ�浿�� ������� 500���� 5���� �����߽��ϴ�
		System.out.println(this.mName + "�� " + prodName + "�� " + prodPrice + "���� " + qty + "���� �����߽��ϴ�" );
		
		totalPrice += prodPrice * qty;
		
		total_Price += prod.getPrice();
		if ( prod.getPName() == "������") {
			mat += prod.getPrice();
		}
		
		System.out.println("�� ���Ű����� : " + totalPrice);
		
	}
	
	/*
	public void totalList() {
		//�հ踸 ���ص� �ǰ�
		System.out.println("�� ���Ű����� : " + totalPrice);
		
	}
	
	public int totalList() {
	
		retrun totalPrice);
		
	}
	
	public int totalList() {
		System.out.println("�� ���Ű����� : " + totalPrice);
		retrun totalPrice);
		
	}
	
	���ϴ´�� ��밡���ϴ�
	*/
	
	public void totalPrice() {
		
		System.out.println(this.mName + "�� �� ���űݾ��� " + total_Price + "���Դϴ�" );
		
	}
	
	public void totalPrice(String want) {
		
		if("������" == want) {
			
			System.out.println(this.mName + "�� ������ ���� " + want + "�� �� ���űݾ��� " + mat + "���Դϴ�" );
			
		}
		
		
	}
	
}
