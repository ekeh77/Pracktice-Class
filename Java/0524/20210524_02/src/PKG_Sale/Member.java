package PKG_Sale;

public class Member {
	
	int total_Price = 0;
	int mat = 0;
	
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
		
		//ȫ�浿�� ������� 500���� 5���� �����߽��ϴ�
		System.out.println(this.mName + "�� " + prod.getPName() + "�� " + prod.getPrice() + "���� " + qty + "���� �����߽��ϴ�" );
		total_Price += prod.getPrice();
		if ( prod.getPName() == "������") {
			mat += prod.getPrice();
		}
		
	}
	
	public void totalPrice() {
		
		System.out.println(this.mName + "�� �� ���űݾ��� " + total_Price + "���Դϴ�" );
		
	}
	
	public void totalPrice(String want) {
		
		if("������" == want) {
			
			System.out.println(this.mName + "�� ������ ���� " + want + "�� �� ���űݾ��� " + mat + "���Դϴ�" );
			
		}
		
		
	}
	
}
