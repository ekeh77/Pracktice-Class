package PKG_Car;

public class CarExample {

	public static void main(String[] args) {
		
		Truck car1 = new Truck("�̻�Ʈ��", 10);
		FlyCar car2 = new FlyCar("�������ڵ���", 1000);
		Carpet carpet = new Carpet();
		AirCar car3 = new AirCar("����ī");
		
		Member mem = new Member("29��ҳ�",Gender.Female);
		
		car2.setMember(mem);
		mem.rideCar(car2);
		mem.driveCar();
		
		/*
		mem.rideCar(car1);
		mem.driveCar();
		mem.flyCar();
		mem.rideCar(car2);
		mem.driveCar();
		mem.flyCar();
		mem.hasObject(carpet);
		mem.carpetFly();
		//1.ĸ��ȭ - Ŭ������ ����ϴ� ����� �� Ŭ������ ��� �����Ǿ��ִ����� �𸥴�
		//			Ŭ������ ����� ����� ����� �ǵ��� ���� ������ ���� �� �ִ�
		
		//2.�߻�ȭ - Ŭ�������� Ư�� ��ü�� ���� �߻�ȭ
		//			�������̽����� Ư�� ������(�������̽�) ���� �߻�ȭ�ϴ� ����
		// �߻�Ŭ������ �ν��Ͻ�ȭ �� �� ���� - ����̿ܿ��� ����� �Ұ�
		
		//3.������ - �Ȱ��� �޼��带 ȣ���ص� ����� �ٸ���
		*/
	}

}
