package PKG_Car;

public class Truck extends Car{
	
	private int tCaps;
	
	public Truck(String truckName, int tCaps) {
		
		super(truckName);
		this.tCaps = tCaps;
		
	}
	
	public int getCarpacity() {
		
		return this.tCaps;
		
	}
	
	@Override
	public void carRun() {
		
		String truckName = super.getCarName();
		
		System.out.println(truckName + " Ʈ���� �޸���");
		
	}
	
	public void truckLoad() {
		
		String truckName = super.getCarName();
		
		System.out.println(truckName + " Ʈ���� ���� �ƴ´�");
		
	}
	
}
