package PKG_Car;

public class CarExample {

	public static void main(String[] args) {
		Jeep J1 = new Jeep("지프차");
		FlyCar fc = new FlyCar("하늘을 나는 자동차");
		Character C = new Character("홍길동");
		
		Car car = new FlyCar("하늘차");
		
		
		C.rideCar(J1);
		
		C.carRun();
		
		C.rideCar(fc);
		
		C.carFly(fc);
		C.rideCar(car);
		C.carFly((FlyCar)car);
		((FlyCar)car).fly();//down Casting
		Car car2 = new Jeep("jpe");
		
		Car flyCar1 = new FlyCar("FC");
		flyCar1.carRun();//Car메서드만 있음
		Fly flyCar2 = new FlyCar("FC2");
		flyCar2.fly();//Fly메서드만 있슴
	}
	
}
