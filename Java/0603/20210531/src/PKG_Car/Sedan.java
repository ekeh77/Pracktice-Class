package PKG_Car;

public class Sedan extends Car{
	
	@Override
	public void carRun() {
		System.out.println("Sedan ������ �޸���");
	}
	
	@Override
	public void carStop() {
		System.out.println("Sedan ������ �����");
	}
	
	public void comfotable() {
		System.out.println("Sedan���� ���� ����ϴ�");
	}
	
}
