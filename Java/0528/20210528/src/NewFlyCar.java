
public class NewFlyCar extends Car implements Fly {
	@Override
	public void carRun() {
		System.out.println("���ö���ī�� �޸���");
	}
	
	@Override
	public void fly() {
		System.out.println("���ö���ī�� ����");
	}
}
