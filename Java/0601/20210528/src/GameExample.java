
public class GameExample {
	public static void main(String[] args) {
		
		//java에서는 만드는 모든 Class는 자동으로 상속을 받고 있는 Class가 있다
		//Object - 최상위 Class
		//1.Object 클래스를 통해서 기본적으로 사용할 수 있는 메서드를 사용할 수 있도록 하기 위함
		//2.Object 최상위 클래스로 등록됨으로 인해서 모든 클래스(인터페이스 포함)는 Object Type으로
		//업캐스팅이 가능
		/*
		Truck T = new Truck();
		Object obj = new Truck();
		obj.toString();
		Object obj2 = new Object();
		//위에 두 객체는 완전히 다르다 위는 오브젝트처럼 보이지만 트럭 아래는 오브젝트
		
		Car car = new FlyCar();
		Fly fly = new FlyCar();
		FlyCar FC = new FlyCar();
		Object obj3 = new FlyCar();
		*/
		
		Truck T = new Truck();
		FlyCar FC = new FlyCar();
		NewFlyCar NFC = new NewFlyCar();
		Member M1 = new Member();
		
		M1.rideCar(T);
		M1.carDrive();
		M1.carFly();
		
		
		M1.rideCar(FC);
		M1.carDrive();
		M1.carFly();
		
		Car car = new Truck();
		Car car2 = new FlyCar();
		
		M1.rideCar(NFC);
		M1.carDrive();
		M1.carFly();
		
		//객체의 타입을 확인하기위한 것
		if(car instanceof Truck) {
			System.out.println("트럭타입이에요");
		}
		
		//다형성
		//up casting, down casting
	}
}
