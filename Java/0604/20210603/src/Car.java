
public class Car {
	
	private int hasPoint;
	private CallBack callback;
	
	public Car(int hasPoint) {
		this.hasPoint = hasPoint;
	}
	
	public void carRun() {
		
		System.out.println("�ڵ����� �޸���");
		
	}
	
	public void getPoint() {
		
		if(hasPoint != 0) {
			
			System.out.println("Point�� ȹ���߾��");
			//Member�ȿ� �ִ� �޼��� ����
			this.callback.ResultMsg(this.hasPoint);
			//this.hasPoint = 0;
			
		}
		else {
			
			System.out.println("Point�� �����");
			
		}
		this.hasPoint = 0;
		
	} 
	
	public void rideCar(CallBack callback) {
		
		this.callback = callback;
		
	}
	
}
