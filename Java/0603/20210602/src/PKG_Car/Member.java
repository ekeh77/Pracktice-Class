package PKG_Car;

public class Member implements Callback{
	
	private Gender memGender;
	private String memName;
	private Car car;
	private Carpet carpet;
	
	public Member(String memName, Gender memGender) {
		
		this.memName = memName;
		this.memGender = memGender;
		
	}
	
	public void rideCar(Car car) {
		
		this.car = car;
		System.out.println(this.memName + "가 " + car.getCarName() + "을 탔어요");
		
	}
	
	public void driveCar() {
		
		this.car.carRun();
		
	}
	
	public void flyCar() {
		
		if(this.car instanceof Fly) {
			
			((Fly)this.car).fly();
			
		}
		else {
			
			System.out.println("니는 못날아");
			
		}
	}
	
	public void hasObject(Carpet Carpet) {
		this.carpet = Carpet;
	}
	
	public void carpetFly() {
		this.carpet.fly();
	}
	
	public void returnMsg(String methodName) {
		System.out.println(methodName + "실행되었어요");
	}
	
}
