package PKG_Car;

//���� ���
public class FlyCar extends Car implements Fly{
	public FlyCar(String carName) {
		super(carName);
	}
	
	@Override
	public void carRun() {
		System.out.println("��������� �޸���");
	} 
	
	@Override
	public void carStop() {
		System.out.println("��������� �����");
	}
	
	@Override
	public void fly() {
		System.out.println("��������� ���ƿ�");
	}
}
