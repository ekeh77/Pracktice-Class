
public class CarExample {

	public static void main(String[] args) {
		
		Car myCar = new Car(1000);
		Car myCar2 = new Car(1500);
		
		myCar.carRun();
		
		Member mem = new Member();
		mem.rideCar(myCar);
		myCar.rideCar(mem);
		mem.getPoint();
		mem.getPoint();
		mem.rideCar(myCar2);
		myCar2.rideCar(mem);
		mem.getPoint();
		mem.getPoint();
		
		Member mem2 = new Member();
		mem2.rideCar(myCar);
		myCar.rideCar(mem2);
		mem2.getPoint();
		mem2.getPoint();
	}

}
