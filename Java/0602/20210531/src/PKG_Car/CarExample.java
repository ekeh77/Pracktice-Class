package PKG_Car;

import java.util.ArrayList;

public class CarExample {

	public static void main(String[] args) {
		
		//Car car = new Car();
		//�Ұ��� �߻�Ŭ�����z �ν��Ͻ�ȭ �� �� ����
		/*
		Car car = new Sedan();
		//����������ȯ -> up casting
		car.carRun();
		car.carStop();
		
		Sedan sedan = new Sedan();
		sedan.carRun();
		sedan.carStop();
		sedan.comfotable();
		
		Car flycar = new FlyCar();
		flycar.carRun();
		flycar.carStop();
		
		FlyCar flycar2 = new FlyCar();
		flycar2.carFly();
		
		Member mem = new Member();
		
		mem.rideCar(sedan);
		mem.carRun();
		mem.carFly();
		
		mem.rideCar(flycar2);
		mem.carRun();
		mem.carFly();
		
		if(car instanceof Sedan) {
			((Sedan)car).comfotable();
			//down Casting
		}
		
		if(flycar instanceof FlyCar) {
			((FlyCar)car).carFly();
		}
		*/
		
		Sedan sedan = new Sedan();
		FlyCar flycar = new FlyCar();
		MultiCar multicar = new MultiCar();
		
		
		Member mem = new Member();
		
		mem.rideCar(sedan);
		mem.carRun();
		mem.carFly();
		
		mem.rideCar(flycar);
		mem.carRun();
		mem.carFly();
		
		mem.rideCar(multicar);
		mem.carRun();
		mem.carFly();
		
		/*
		Car[] cars = new Car[4];
		cars[0] = new Sedan();
		cars[1] = new FlyCar();
		cars[2] = new MultiCar();
		cars[3] = new Sedan();
		
		//�ݷ��� ArrayList > �迭�� ������ ������� ���� �� �ִ� �迭
		//�� ����Ʈ�� ������ �Ѱ���Ÿ���� �ƴ� �������� Ÿ������ ���� �� �ִ�
		//�׷��� �����ö� Ÿ���� ���缭 �˾Ƽ� �������ϱ� ������ �����ʴ����� ����
		ArrayList cars2 = new ArrayList();
		cars2.add(sedan);
		cars2.add(sedan);
		cars2.add(flycar);
		cars2.add(multicar);
		
		
		//ArrayList�� ����Ȯ�� > size()
		//ArrayList�� ��Ұ������� > get(i)
		//ArrayList�� OBj�̱� ������ ���ϴ� ��ü�� ĳ���� �ʿ�
		for(int i = 0; i<cars2.size(); i++) {
			((Car)cars2.get(i)).carRun();
		}
		*/
		
		ArrayList arr = new ArrayList();
		arr.add(5);// �׳� �ֱ�
		arr.add("asdfg");
		boolean b = arr.add(1.23456);
		System.out.println(b);
		arr.add(1, "������");// ������ �߰� ����
		System.out.println(arr.get(1));
		
		//���׸� Ÿ��
		//Array Ÿ���� String���� ����
		ArrayList<String> strArr = new ArrayList<String>();
		//Array Ÿ���� CarŸ������ ����
		ArrayList<Car> carArr = new ArrayList<Car>();
		
		Park park = new Park();
		park.carPark(sedan);
		park.carPark(flycar);
		
		park.getCarList();
	}

}
