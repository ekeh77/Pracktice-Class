package PKG_Car;

public class CarExample {
	public static void main(String[] args) {
		
		Car car1 = new Car("소나타", 200);
		car1.carDrive();
		//car1.getSedan();
		
		Sedan sedan = new Sedan("세단", 200);
		sedan.getSedan();
		
		Truck truck = new Truck("트럭", 200);
		truck.getTruck();
		
	}
	
}
