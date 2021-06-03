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
	
	public void usekey(Car car) {
		((getKey)this.car).Key();
	}
	
	public void startCar() {
		this.car.start_Up();
	}
	
	public void Gear() {
		this.car.setGear();
	}
	
	public void seeInfo() {
		this.car.carInfo();
	}
	
	public void goCar(int num) {
		if (car instanceof oldCar) {
			((oldCar)this.car).putAccelerator(num);
		}
		else {
			this.car.putAccelerator(num);
		}
		
	}
	
	public void stopCar(int num) {
		this.car.putbrake(num);
	}
}
