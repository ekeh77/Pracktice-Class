package PKG_Car;

public class FlyCar extends Car implements Fly{
	
	@Override
	public void carRun() {
		System.out.println("FlyCar �� �޸���");
	}
	
	@Override
	public void fly() {
		System.out.println("FlyCar �� ����ٴѴ�");
	}
	
}
