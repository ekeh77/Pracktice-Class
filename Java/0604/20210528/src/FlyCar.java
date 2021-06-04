
public class FlyCar extends Car implements Fly{
	
	@Override
	public void carRun() {
		System.out.println("플라잉카가 달린다");
	}
	
	@Override
	public void fly() {
		System.out.println("플라잉카가 날아갑니다");
	}
	
	public void eat() {
		
	}
	
}
