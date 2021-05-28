package PKG_Car;

public class People {
	private String pName;
	private Car car;
	public People(String pName) {
		this.pName = pName;
	}
	
	public void getCar(Car car) {
		this.car = car;
	}
	
	public void getCar(oldCar car) {
		this.car = car;
	}
	
	public void usekey(oldCar car) {
		car.Key();
	}
	
	public void startCar() {
		car.start_Up();
	}
	
	public void Gear() {
		car.setGear();
	}
	
	public void goCar(oldCar car, int num) {
		car.putAccelerator(num);
	}
	
	public void stopCar() {
		car.putbrake();
	}
}
