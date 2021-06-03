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
		System.out.println(flyCarName + " �ö���ī�� �޸���");
		
		callback.returnMsg("carRun");
	}
	
	public void fly() {
		String flyCarName = super.getCarName();
		System.out.println(flyCarName + " �ö���ī�� ���ƴٴѴ�");
	}
	
	public void land() {
		String flyCarName = super.getCarName();
		System.out.println(flyCarName + " �ö���ī�� �����Ѵ�");
	}
	
}
