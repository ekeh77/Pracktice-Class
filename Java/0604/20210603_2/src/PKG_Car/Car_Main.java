package PKG_Car;

public class Car_Main {

	public static void main(String[] args) {
		
		Car car1 = new Car("1����");
		Car car2 = new Car("2����");
		Member mem = new Member("1��");
		Member mem2 = new Member("2��");
		
		
		mem.rideCar(car1);
		car1.getCall(mem);
		mem.goCar();
		mem.getNum();
		
		mem2.rideCar(car1);
		car1.getCall(mem2);
		mem2.goCar();
		mem2.getNum();
		
		mem.rideCar(car2);
		car2.getCall(mem);
		mem.goCar();
		mem.goCar();
		mem.getNum();
		mem2.getNum();
	}

}
