
public class NewFlyCar extends Car implements Fly {
	@Override
	public void carRun() {
		System.out.println("뉴플라잉카가 달린다");
	}
	
	@Override
	public void fly() {
		System.out.println("뉴플라잉카가 난다");
	}
}
