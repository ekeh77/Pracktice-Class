
public class GameExample {
	public static void main(String[] args) {
		
		//java������ ����� ��� Class�� �ڵ����� ����� �ް� �ִ� Class�� �ִ�
		//Object - �ֻ��� Class
		//1.Object Ŭ������ ���ؼ� �⺻������ ����� �� �ִ� �޼��带 ����� �� �ֵ��� �ϱ� ����
		//2.Object �ֻ��� Ŭ������ ��ϵ����� ���ؼ� ��� Ŭ����(�������̽� ����)�� Object Type����
		//��ĳ������ ����
		/*
		Truck T = new Truck();
		Object obj = new Truck();
		obj.toString();
		Object obj2 = new Object();
		//���� �� ��ü�� ������ �ٸ��� ���� ������Ʈó�� �������� Ʈ�� �Ʒ��� ������Ʈ
		
		Car car = new FlyCar();
		Fly fly = new FlyCar();
		FlyCar FC = new FlyCar();
		Object obj3 = new FlyCar();
		*/
		
		Truck T = new Truck();
		FlyCar FC = new FlyCar();
		NewFlyCar NFC = new NewFlyCar();
		Member M1 = new Member();
		
		M1.rideCar(T);
		M1.carDrive();
		M1.carFly();
		
		
		M1.rideCar(FC);
		M1.carDrive();
		M1.carFly();
		
		Car car = new Truck();
		Car car2 = new FlyCar();
		
		M1.rideCar(NFC);
		M1.carDrive();
		M1.carFly();
		
		//��ü�� Ÿ���� Ȯ���ϱ����� ��
		if(car instanceof Truck) {
			System.out.println("Ʈ��Ÿ���̿���");
		}
		
		//������
		//up casting, down casting
	}
}
