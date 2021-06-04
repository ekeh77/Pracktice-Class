
public class PCB {
	
	private String pcbName;
	private int volume = 0;
	private CallBack callback;
	//return으로는 불가능한 코딩이 있다
	
	public PCB(String pcbName) {
		this.pcbName = pcbName;
	}
	
	public void setTVBox(CallBack tvbox) {
		this.callback = tvbox;
	}
	
	
	public void realTurnOn() {
		
		try {
			
			double dValue = Math.random();
			int t = (int)(dValue * 10000);
			
			Thread.sleep(t); //3초간 대기하기
			System.out.println("전원을 키기위한 회로가 동작" + t);
			
			callback.RecieveMsg(pcbName);
			
		} catch (InterruptedException e) {
			
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		
	}
	
	public void realVolumeUp() {
		
		volume++;
		System.out.println("볼륨" + volume);
		
	}
	
	public void realVolumeDown() {
		
		volume--;
		System.out.println("볼륨" + volume);
		
	}
	
}
