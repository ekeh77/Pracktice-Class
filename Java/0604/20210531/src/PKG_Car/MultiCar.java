package PKG_Car;

//���, �޸���, ���Ƶ�����
public class MultiCar extends Car implements Fly{
	
	@Override
	public void carRun() {
		System.out.println("MultiCar�� �޸���");
	}
	
	@Override
	public void fly() {
		System.out.println("MultiCar�� ���ƴٴѴ�");
	}
	
}
