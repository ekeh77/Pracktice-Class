package PKG_Sell;

public class Member {
	
	private String memID;
	private String memName;
	private int totalPrice = 0;
	
	
	//�����ڰ�
	//class�� instanceȭ �Ǿ����� �ڵ����� �� �ѹ��� ����Ǵ� �޼���
	//���Ŀ��� ȣ���� �Ұ����ϴ�
	
	public Member(String memID, String memName) {
		
		this.memID = memID;
		this.memName = memName;
		
	}


	public void memBuy(String prodName, int prodPrice) {
		
		totalPrice += prodPrice;
		System.out.println(memName +"�� " + prodName + "�� " + prodPrice + "���� ���� �Ѱ��� :" + totalPrice);
		
	}
	
	public int getTotalPrice() {
		
		return totalPrice;
		
	}
	
}
