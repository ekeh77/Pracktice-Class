package PKG_Car;

public class Sedan extends Car{
	
	@Override
	public void carRun() {
		System.out.println("Sedan 세단이 달린다");
	}
	
	@Override
	public void carStop() {
		System.out.println("Sedan 세단이 멈춘다");
	}
	
	public void comfotable() {
		System.out.println("Sedan만의 장점 편안하다");
	}
	
}
