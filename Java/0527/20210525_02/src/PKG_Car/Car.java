package PKG_Car;

public class Car {
	private String carName;
	private int maxSpeed;
	private String carColor;
	
	public Car(String carName, int maxSpeed) {
		this.carName = carName;
		this.maxSpeed = maxSpeed;
	}
	public void carDrive() {
		System.out.println(carName + "이 달린다");
	}
	
	public void setColor(String carcolor) {
		carColor = carcolor;
	}
}
