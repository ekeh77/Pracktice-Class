package PKG_Car;

public class Member {
	private Car car;
	
	public void rideCar(Car car) {
		
		this.car = car;
		
	}
	
	public void carRun() {
		
		this.car.carRun();
		
	}

	public void carFly() {
		
		if (this.car instanceof Fly) {

			((Fly)this.car).fly();
			//up casting, ���������ȯ
			
		}
		else {
			System.out.println("�� ������");
		}
		
	}
	
}
