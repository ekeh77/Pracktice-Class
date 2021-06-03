package PKG_Car;

public class FlyCar extends Car implements Fly{

	private int flyMaxSpeed;
	private Callback callback;
	
	public FlyCar(String flyCarName, int flyMaxSpeed) {
		super(flyCarName);
		this.flyMaxSpeed = flyMaxSpeed;
	}
	
	public void setMember(Member mem) {
		this.callback = mem;
	}
	
	@Override
	public void carRun() {
		String flyCarName = super.getCarName();
		System.out.println(flyCarName + " 플라이카가 달린다");
		
		callback.returnMsg("carRun");
	}
	
	public void fly() {
		String flyCarName = super.getCarName();
		System.out.println(flyCarName + " 플라이카가 날아다닌다");
	}
	
	public void land() {
		String flyCarName = super.getCarName();
		System.out.println(flyCarName + " 플라이카가 착륙한다");
	}
	
}
