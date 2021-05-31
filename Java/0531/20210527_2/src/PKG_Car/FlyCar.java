package PKG_Car;

//다중 상속
public class FlyCar extends Car implements Fly{
	public FlyCar(String carName) {
		super(carName);
	}
	
	@Override
	public void carRun() {
		System.out.println("비행기차가 달린다");
	} 
	
	@Override
	public void carStop() {
		System.out.println("비행기차가 멈춘다");
	}
	
	@Override
	public void fly() {
		System.out.println("비행기차가 날아요");
	}
}
