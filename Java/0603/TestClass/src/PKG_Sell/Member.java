package PKG_Sell;

public class Member {
	
	public String memID;
	public String memName;
	public int totalPrice = 0;
	
	//�޼����� �����ε� ���� �����ڸ� �ٸ��� �����ڸ� ����� �����Ұ��(�Ű����� �Ǵ� ������ Ÿ���̴ٸ� ������)
	
	public Member() {
		this.memID = "M000";
		this.memName = "�ſ��̻�";
	}
	
	public Member(String memName) {
		this.memID = "M000";
		this.memName = memName;
	}
	
	//�����ڰ�
	//class�� instanceȭ �Ǿ����� �ڵ����� �� �ѹ��� ����Ǵ� �޼���
	//���Ŀ��� ȣ���� �Ұ����ϴ�

	public Member(String memID, String memName) {
		
		this.memID = memID;
		this.memName = memName;
		
	}

	//�����ε��� �ż��嵵 ���� (�� �����ڸ��� �ƴ�)
	
	public void memBuy(String prodName, int prodPrice) {
		
		totalPrice += prodPrice;
		System.out.println(memName +"�� " + prodName + "�� " + prodPrice + "���� ���� �Ѱ��� :" + totalPrice);
		
	}
	
	public void memBuy(int prodPrice) {
		
		totalPrice += prodPrice;
		System.out.println("���� :" + totalPrice);
		
	}
	
	public int getTotalPrice() {
		
		return totalPrice;
		
	}
	
}
