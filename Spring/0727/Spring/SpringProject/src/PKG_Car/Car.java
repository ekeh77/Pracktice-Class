package PKG_Car;

public class Car {
	
	//private ATire aTire;
	//private BTire bTire;
	private Tire tire;
	
	//1.생성자
	public Car() {
		//this.aTire = new ATire();
		//this.bTire = new BTire();
	}
	
	public Car(Tire tire) {
		this.tire = tire;
	}
	
	public void outTireKind() {
		
		tire.tireOut();
		//aTire.tireOut();
		//this.bTire.tireOut();
	}
	
	public void setTire(Tire tire) {
		this.tire = tire;
	}
}
