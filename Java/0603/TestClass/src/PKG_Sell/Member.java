package PKG_Sell;

public class Member {
	
	public String memID;
	public String memName;
	public int totalPrice = 0;
	
	//메서드의 오버로딩 같은 생성자를 다르게 생성자를 만들어 저장할경우(매개변수 또는 데이터 타입이다른 생성자)
	
	public Member() {
		this.memID = "M000";
		this.memName = "신원미상";
	}
	
	public Member(String memName) {
		this.memID = "M000";
		this.memName = memName;
	}
	
	//생성자가
	//class가 instance화 되어지면 자동으로 딱 한번만 실행되는 메서드
	//이후에는 호출이 불가능하다

	public Member(String memID, String memName) {
		
		this.memID = memID;
		this.memName = memName;
		
	}

	//오버로딩은 매서드도 가능 (꼭 생생자만은 아님)
	
	public void memBuy(String prodName, int prodPrice) {
		
		totalPrice += prodPrice;
		System.out.println(memName +"이 " + prodName + "을 " + prodPrice + "원에 구매 총가격 :" + totalPrice);
		
	}
	
	public void memBuy(int prodPrice) {
		
		totalPrice += prodPrice;
		System.out.println("가격 :" + totalPrice);
		
	}
	
	public int getTotalPrice() {
		
		return totalPrice;
		
	}
	
}
