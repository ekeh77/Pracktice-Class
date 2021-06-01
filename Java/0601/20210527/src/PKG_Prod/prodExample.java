package PKG_Prod;

public class prodExample {

	public static void main(String[] args) {
		/*
		double[] salePrices = new double[4];
		Computer[] computers = new Computer[2];
		Toy[] toys = new Toy[2];
		
		computers[0] = new Computer("컴퓨터", 50000, "팬티엄");
		salePrices[0] = computers[0].getPrice(0.25);
		
		
		toys[0] = new Toy("장난감", 10000, "트럭");
		salePrices[1] = toys[0].getPrice(0.5);
		
		computers[1] = new Computer("컴퓨터2", 90000, "팬티엄");
		salePrices[2] = computers[1].getPrice(0.25);
		
		toys[2] = new Toy("장난감2", 10000, "트럭2");
		salePrices[3] = toys[2].getPrice(0.5);
		
		for(int i=0; i<salePrices.length; i++) {
			
			System.out.println(salePrices[i]);
			
		}
		*/
		
		int a = 9;
		long b = a; //형변환 - 묵시적형변환
		
		long c = 19;
		int d = (int)c;//형변환 - 암시적형변환
		
		//Casting
		//1.upCasting
		//2.downCasting
		
		Computer C = new Computer("컴퓨터", 50000, "팬티엄");
		C.getPrice(0); //Computer
		C.getPPrice(); // Product
		Toy T = new Toy("장난감", 1000, "트럭");
		
		
		Product p1 = new Computer("컴퓨터", 50000, "팬티엄2");// 형변환 upCasting
		//Computer C2 = p1; //형변환
		//객체타입(Class, interface) 형변환 -> Casting
		
		Product p2 = new Toy("장난감", 1000, "트럭");
		
		System.out.println(p1.getPrice(0.4));
		System.out.println(p2.getPrice(0.5));
		//값은 똑같다
		
		//객체지향의 중요한 또 하나의 개념 다형성
		Member m = new Member();
		m.purchase(C); //Product p = C;
		m.purchase(T);
		
	}

}
