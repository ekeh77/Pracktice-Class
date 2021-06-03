package PKG_Car;

public class Member implements CallBack{
	
	private Car car;
	private String Name;
	private int CountNum = 0;
	public Member(String Name) {
		this.Name = Name;
	}
	
	public void rideCar(Car car) {
		this.car = car;
	}
	
	public void goCar() {
		
		CountNum += 1;
		this.car.goCar();
		
	}
	
	public void getNum() {
		System.out.println(CountNum);
	}
	
	@Override
	public void returnMsg(Object obj) {
		
		System.out.println(obj + "가 실행되었습니다");
		
	}
	
}
