package PKG_Car;

public class Truck extends Car {
	
	public Truck(String carName, int maxSpeed) {
		super(carName, maxSpeed);
	}
	
	public void getTruck() {
		System.out.println("트럭만의 특징");
	}
	
	public void setTruck() {
		System.out.println("트럭만의 특징");
	}
	
}
