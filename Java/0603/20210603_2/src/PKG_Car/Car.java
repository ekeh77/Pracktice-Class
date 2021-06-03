package PKG_Car;

public class Car {
	private String CarName;
	private CallBack callback;
	private int countNum = 0;
	
	public Car(String CarName) {
		this.CarName = CarName;
	}
	
	public void goCar() {
		
		System.out.println(this.CarName + "¿¡ ³î·¯¿È");
		countNum += 1;
		this.callback.returnMsg(this);
		
	}
	
	
	public void getCall(CallBack callback) {
			
		this.callback = callback;
		
	}
}
