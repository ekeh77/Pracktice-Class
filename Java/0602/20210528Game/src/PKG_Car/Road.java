package PKG_Car;

public class Road {

	public static void main(String[] args) {
		People p1 = new People("ȫ�浿");
		oldCar C1 = new oldCar("������", 200);
		p1.getCar(C1);
		p1.usekey(C1);
		p1.startCar();
		p1.Gear();
		p1.goCar(2);
		p1.Gear();
		p1.goCar(2);
		p1.Gear();
		p1.goCar(4);
		p1.Gear();
		p1.goCar(4);
		p1.Gear();
		p1.goCar(9);
		p1.seeInfo();
	}

}
