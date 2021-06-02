package PKG_Car;

public class Carpet implements Fly{
	
	@Override
	public void fly() {
		System.out.println("카페트가 날아가요");
	}
	
	@Override
	public void land() {
		System.out.println("카페트가 착륙해요");
	}
	
}
