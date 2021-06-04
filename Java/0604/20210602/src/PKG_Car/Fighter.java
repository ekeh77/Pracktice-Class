package PKG_Car;

public class Fighter extends Airplane{
	
	@Override
	public void airPlaneFly() {
		System.out.println("전투기가 날아다녀요");
	}
	
	
	public void airPlaneShot() {
		System.out.println("전투기가 총을 쏴요");
	}
	
}
