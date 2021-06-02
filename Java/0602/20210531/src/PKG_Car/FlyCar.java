package PKG_Car;

public class FlyCar extends Car implements Fly{
	
	@Override
	public void carRun() {
		System.out.println("FlyCar 가 달린다");
	}
	
	@Override
	public void fly() {
		System.out.println("FlyCar 가 날라다닌다");
	}
	
}
