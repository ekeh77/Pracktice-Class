package PKG_Array;

public class PArray {
	
	public static void main(String[] args) {
		
		Car[] c1 = new Car[3];
		c1[0] = new Car("Â÷1",10);
		c1[1] = new Car("Â÷2",20);
		c1[2] = new Car("Â÷3",30);
		
		c1[0].CarRun();
		c1[1].CarRun();
		c1[2].CarRun();
		
	}
	
}
