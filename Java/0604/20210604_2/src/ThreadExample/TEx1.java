package ThreadExample;

public class TEx1 extends Thread{
	
	private Workthis workthis;
	
	public void setWork(Workthis workthis) {
		this.setName("TEx1");
		this.workthis = workthis;
	}
	
	public void run() {
		workthis.sayWork();
	}
}
