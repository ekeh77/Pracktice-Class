package PKG_Car;

public class CarExample {
	public static void main(String[] args) {
		
		Car car1 = new Car("�ҳ�Ÿ", 200);
		car1.carDrive();
		//car1.getSedan();
		
		Sedan sedan = new Sedan("����", 200);
		sedan.getSedan();
		
		Truck truck = new Truck("Ʈ��", 200);
		truck.getTruck();
		
	}
	
}
