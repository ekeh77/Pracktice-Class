package PKG_Test;

public class TestClass {
	
	private String strName;
	
	public TestClass() {
		
	}
	
	public void setName(String strName) {
		this.strName = strName;
	}
	
	public String getName() {
		return strName;
	}
	
	public int getSum(int num) {
		
		int result = 0;
		for(int i=1; i<= num; i++) {
			result += i;
		}
	
		return result;
	}
	
}
