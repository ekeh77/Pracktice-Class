package PKG_Car;

public class Jeep extends Car{ 
	
	public Jeep(String carName) {
		super(carName);
	}
	
	@Override
	public void carRun() {
		System.out.println("�������� �޸���");
	} 
	
	@Override
	public void carStop() {
		System.out.println("�������� �����");
	}
}
