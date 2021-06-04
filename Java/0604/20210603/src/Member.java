
public class Member implements CallBack{

	private int point = 0;
	private Car car;
	//private int pointNum = 0;  
	
	public void rideCar(Car car) {
		
		this.car = car;
		
	}
	
	public void getPoint() {
		//한번만 포인트를 획득할 수 있어요
		/*
		this.pointNum += 1;
		if(this.pointNum <= 1) {
		
			this.point += 1000;
			car.getPoint();
			System.out.println("멤버가 " + this.point + "를 획득했어요");
			
		}
		else {
			
			System.out.println("더이상 포인트를 얻을 수 없어요");
			
		}
		*/

		car.getPoint();		
		
	}
	
	
	@Override
	public void ResultMsg(int hasPoint) {
		
		point += hasPoint;
		
		System.out.println("얻은포인트는 " + hasPoint);
		System.out.println("총포인트는 " + point);
		
	}
	
}
