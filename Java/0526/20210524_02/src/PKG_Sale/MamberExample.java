package PKG_Sale;

public class MamberExample {

	public static void main(String[] args) {
		
		//1.상품을 하나 만든다
		Product prod1 = new Product("P001", "새우깡", 500);
		//1.1 -- 상품아이디, 상품이름, 상품가격
		
		//2.상품을 하나 더 만든다
		Product prod2 = new Product("P002", "맛동산", 1000);
		Product prod3 = new Product("P003", "샴푸", 10000);
		
		//3.홍길동이라는 회원을 만든다
		Member mem1 = new Member("M001", "홍길동", "M");
		
		mem1.purchase(prod1, 5);
		mem1.purchase(prod2, 5);
		mem1.purchase(prod3, 5);
		
		prod2.setPrice(800);
		
		mem1.purchase(prod2, 5);
		mem1.totalPrice();
		mem1.totalPrice("맛동산");
	}

}
