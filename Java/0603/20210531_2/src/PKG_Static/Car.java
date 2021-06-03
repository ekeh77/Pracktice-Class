package PKG_Static;

public class Car {
	
	public int speed = 0;
	
	//정적멤버 - static member
	//인스턴스하지않아도 실행하는 순간 메모리상에 존재
	public static int speed2 = 0;
	
	//보통 전체합계를 낼 때 사용
	//남발하면 메모리를 많이 먹기 때문에 특별할 때만 사용
	private static int carCount = 0;
	
	public Car() {
		this.carCount += 1;
	}
	
	public int getCarCount() {
		return this.carCount;
	}
}
