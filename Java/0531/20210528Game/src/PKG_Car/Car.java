package PKG_Car;

public abstract class Car {
	private String carName;
	private int maxSpeed;
	private int currentSpeed;
	private String Gear;
	
	
	public Car(String carName, int maxSpeed) {
		
		this.carName = carName;
		this.maxSpeed = maxSpeed;
		
	}
	
	public abstract void carInfo();
	
	public int getcurrentSpeed() {
		
		return this.currentSpeed;
		
	}
	
	public int getmaxSpeed() {
		
		return this.maxSpeed;
		
	}
	
	public String getcarName() {
		
		return this.carName;
		
	}
	public void setcSpeed(int setSpeed) {
		this.currentSpeed = setSpeed;
	} 
	
	public void setcurrentSpeed(int plusSpeed) {
		
		if(this.maxSpeed == this.currentSpeed ) {
			
			this.currentSpeed = this.currentSpeed;
			
		}
		else{
			
			this.currentSpeed += plusSpeed;	
		}
		
	}
	
	public abstract void start_Up();
	
	public abstract void setGear();
	
	public abstract void putAccelerator(int num);
	
	public abstract void putbrake(int num);
}
