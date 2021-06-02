package PKG_Car;

public class CarExample {

	public static void main(String[] args) {
		
		Truck car1 = new Truck("이쁜트럭", 10);
		FlyCar car2 = new FlyCar("나르는자동차", 1000);
		Carpet carpet = new Carpet();
		AirCar car3 = new AirCar("에어카");
		
		Member mem = new Member("29살소녀",Gender.Female);
		
		car2.setMember(mem);
		mem.rideCar(car2);
		mem.driveCar();
		
		/*
		mem.rideCar(car1);
		mem.driveCar();
		mem.flyCar();
		mem.rideCar(car2);
		mem.driveCar();
		mem.flyCar();
		mem.hasObject(carpet);
		mem.carpetFly();
		//1.캡슐화 - 클래스를 사용하는 사람은 그 클래스가 어떻게 구현되어있는지는 모른다
		//			클래스를 만드는 사람은 만드는 의도에 따라서 값들을 숨길 수 있다
		
		//2.추상화 - 클래스에서 특정 객체의 대한 추상화
		//			인터페이스에서 특정 행위에(인터페이스) 대한 추상화하는 과정
		// 추상클래스는 인스턴스화 할 수 없다 - 상속이외에는 사용이 불가
		
		//3.다형성 - 똑같은 메서드를 호출해도 결과가 다르다
		*/
	}

}
