package PKG_Sell;

public class Member {
	
	private String memID;
	private String memName;
	private int totalPrice = 0;
	
	
	//생성자가
	//class가 instance화 되어지면 자동으로 딱 한번만 실행되는 메서드
	//이후에는 호출이 불가능하다
	
	public Member(String memID, String memName) {
		
		this.memID = memID;
		this.memName = memName;
		
	}


	public void memBuy(String prodName, int prodPrice) {
		
		totalPrice += prodPrice;
		System.out.println(memName +"이 " + prodName + "을 " + prodPrice + "원에 구매 총가격 :" + totalPrice);
		
	}
	
	public int getTotalPrice() {
		
		return totalPrice;
		
	}
	
}
