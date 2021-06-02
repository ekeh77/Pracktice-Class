package PKG_Car;

public class Character {
	
	private String cName;
	private Car mycar;
	
	
	public Character(String cName) {
		this.cName = cName;
	}
	
	public void rideCar(Car car) {
		this.mycar = car;
	}
	
	public void carRun() {
		this.mycar.carRun();
	}
	
	public void carFly(Fly f) {
		f.fly();
	}
}
