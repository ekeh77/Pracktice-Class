
public class FlyCar extends Car implements Fly{
	
	@Override
	public void carRun() {
		System.out.println("�ö���ī�� �޸���");
	}
	
	@Override
	public void fly() {
		System.out.println("�ö���ī�� ���ư��ϴ�");
	}
	
	public void eat() {
		
	}
	
}
