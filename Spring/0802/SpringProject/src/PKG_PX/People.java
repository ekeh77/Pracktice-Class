package PKG_PX;

public class People implements ISum{

	private int busan;
	private int seoul;
	
	public People(int busan, int seoul) {
		
		this.busan = busan;
		this.seoul = seoul;
		
	}
	
	@Override
	public int getSum() {
		
		int sum = this.busan + this.seoul;
		
		return sum;
		
	}
	
}
