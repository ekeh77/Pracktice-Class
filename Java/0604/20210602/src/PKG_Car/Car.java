package PKG_Car;

public abstract class Car {

	private String carName;
	
	public Car(String carName) {
		
		this.carName = carName;
		
	}
	
	public abstract void carRun();
	
	public void turnonRamp() {
		System.out.println("램프를 킨다");
	}
	
	public String getCarName() {
		return carName;
	}
	
}
