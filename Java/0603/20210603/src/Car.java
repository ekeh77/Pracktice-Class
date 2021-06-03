
public class Car {
	
	private int hasPoint;
	private CallBack callback;
	
	public Car(int hasPoint) {
		this.hasPoint = hasPoint;
	}
	
	public void carRun() {
		
		System.out.println("자동차가 달린다");
		
	}
	
	public void getPoint() {
		
		if(hasPoint != 0) {
			
			System.out.println("Point를 획득했어요");
			//Member안에 있는 메서드 실행
			this.callback.ResultMsg(this.hasPoint);
			//this.hasPoint = 0;
			
		}
		else {
			
			System.out.println("Point가 없어요");
			
		}
		this.hasPoint = 0;
		
	} 
	
	public void rideCar(CallBack callback) {
		
		this.callback = callback;
		
	}
	
}
