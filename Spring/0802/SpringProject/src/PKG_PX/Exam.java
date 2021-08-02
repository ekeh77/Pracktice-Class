package PKG_PX;

public class Exam implements ISum{
	
	private int kor;
	private int math;
	
	public Exam(int kor, int math) {
		
		this.kor = kor;
		this.math = math;
		
	}
	
	@Override
	public int getSum() {
		
		int sum = this.kor + this.math;
		
		return sum;
		
	}
}
