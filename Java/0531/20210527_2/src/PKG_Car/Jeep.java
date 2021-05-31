package PKG_Car;

public class Jeep extends Car{ 
	
	public Jeep(String carName) {
		super(carName);
	}
	
	@Override
	public void carRun() {
		System.out.println("지프차가 달린다");
	} 
	
	@Override
	public void carStop() {
		System.out.println("지프차가 멈춘다");
	}
}
