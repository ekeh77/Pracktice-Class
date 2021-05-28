
public class Member {
	
	private Car rideCar;
	private Computer com;
	private boolean isfly;
	
	
	public void rideCar(Car car) {
		this.rideCar = car;
	}
	
	public void carDrive() {
		rideCar.carRun();
	}
	
	/*
	public void carFly() {
		if(rideCar instanceof Fly) {
			
			((Fly)rideCar).fly();
			
		}
		else {
			
			System.out.println("너는 못 날아");
			
		}
	}
	*/
	
	public void getComputer(Computer com) {
		this.com = com;
	}
	
	/*
	public void flycom() {
		if(com instanceof Fly) {
			com.fly();
		}
		else {
			System.out.println("너는 못 날아");
		}
	}
	*/
	
	private boolean canfly(Object obj) {
		if(obj instanceof Fly) {
			isfly = true;
		}
		else {
			isfly = false;
		}
	} 
	
	public void carFly() {
		canfly(this.rideCar);
		
		if(isfly) {
			((Fly)rideCar).fly();
		}
		else {
			System.out.println("너는 못 날아");
		}
	}
	
}
