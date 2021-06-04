package ThreadExample;

public class TEx2 extends Thread{

	private Workthis workthis;
	
	public void setWork(Workthis workthis) {
		this.setName("TEx2");
		this.workthis = workthis;
	}
	
	public void run() {
		workthis.sayWork();
	}
	
}
