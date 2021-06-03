package PKG_Car;

//잠수, 달린다, 날아도간다
public class MultiCar extends Car implements Fly{
	
	@Override
	public void carRun() {
		System.out.println("MultiCar가 달린다");
	}
	
	@Override
	public void fly() {
		System.out.println("MultiCar가 날아다닌다");
	}
	
}
