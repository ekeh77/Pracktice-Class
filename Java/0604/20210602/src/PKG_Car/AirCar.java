package PKG_Car;

public class AirCar extends Car implements Fly{

	public AirCar(String AirCarName) {
		super(AirCarName);
	}
	
	@Override
	public void fly() {
		System.out.println("����ī�� ���ư���");
	}
	
	@Override
	public void land() {
		System.out.println("�����Ѵ�");
	}
	
	@Override
	public void carRun() {
		System.out.println("����ī�� �޸���");
	}
	
}
