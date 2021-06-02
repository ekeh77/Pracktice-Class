package PKG_Car;

public class AirCar extends Car implements Fly{

	public AirCar(String AirCarName) {
		super(AirCarName);
	}
	
	@Override
	public void fly() {
		System.out.println("에어카가 날아가요");
	}
	
	@Override
	public void land() {
		System.out.println("착륙한다");
	}
	
	@Override
	public void carRun() {
		System.out.println("에어카가 달린다");
	}
	
}
