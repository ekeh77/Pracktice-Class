package PKG_Car;

public class CarExample {

	public static void main(String[] args) {
		Jeep J1 = new Jeep("������");
		FlyCar fc = new FlyCar("�ϴ��� ���� �ڵ���");
		Character C = new Character("ȫ�浿");
		
		Car car = new FlyCar("�ϴ���");
		
		
		C.rideCar(J1);
		
		C.carRun();
		
		C.rideCar(fc);
		
		C.carFly(fc);
		C.rideCar(car);
		C.carFly((FlyCar)car);
		((FlyCar)car).fly();//down Casting
		Car car2 = new Jeep("jpe");
		
		Car flyCar1 = new FlyCar("FC");
		flyCar1.carRun();//Car�޼��常 ����
		Fly flyCar2 = new FlyCar("FC2");
		flyCar2.fly();//Fly�޼��常 �ֽ�
	}
	
}
