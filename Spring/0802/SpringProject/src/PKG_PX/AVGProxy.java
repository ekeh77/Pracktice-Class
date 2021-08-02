package PKG_PX;

public class AVGProxy {

	private ISum avgProxy;
	
	public AVGProxy(ISum avgProxy) {
		
		this.avgProxy = avgProxy;
		
	}
	
	public float getAvg() {
		
		int sum = this.avgProxy.getSum();
		
		float avg = sum / 2.0f;
		
		return avg;
				
	}
	
	//합을 구하는 메써드 앞에 합을 구하기 전에 로그를 저장하고 싶다.
	
	public void setSum() {
		
		System.out.println("로그를 남긴다.");
		
		System.out.println(avgProxy.getSum());
		
	}
	
}
