package PKG_Sale;

public class Member {
	
	int total_Price = 0;
	int mat = 0;
	
	//1.추상화
	//필드(field) - 속성(property)
	private String mID;
	private String mName;
	private String mGender;
	

	//생성자
	public Member(String mID, String mName, String mGender) {
		this.mID = mID;
		this.mName = mName;
		this.mGender = mGender;
	}
	
	//구매
	public void purchase(Product prod, int qty) {
		
		//홍길동이 새우깡을 500원에 5개를 구매했습니다
		System.out.println(this.mName + "이 " + prod.getPName() + "을 " + prod.getPrice() + "원에 " + qty + "개를 구매했습니다" );
		total_Price += prod.getPrice();
		if ( prod.getPName() == "맛동산") {
			mat += prod.getPrice();
		}
		
	}
	
	public void totalPrice() {
		
		System.out.println(this.mName + "의 총 구매금액은 " + total_Price + "원입니다" );
		
	}
	
	public void totalPrice(String want) {
		
		if("맛동산" == want) {
			
			System.out.println(this.mName + "이 구매한 물건 " + want + "의 총 구매금액은 " + mat + "원입니다" );
			
		}
		
		
	}
	
}
