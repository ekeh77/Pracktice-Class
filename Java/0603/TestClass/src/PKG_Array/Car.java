package PKG_Array;

public class Car {
	
	private String CName;
	private int CSpeed;
	
	public Car(String CName, int CSpeed) {
		
		this.CName = CName;
		this.CSpeed = CSpeed;
		
	}
	
	
	public void CarRun () {
		System.out.println(CName + "가 속도 " + CSpeed + " 으로 달린다!");
	}
}
