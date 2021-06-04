
public class PCB {
	
	private String pcbName;
	private int volume = 0;
	private CallBack callback;
	//return���δ� �Ұ����� �ڵ��� �ִ�
	
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
			
			Thread.sleep(t); //3�ʰ� ����ϱ�
			System.out.println("������ Ű������ ȸ�ΰ� ����" + t);
			
			callback.RecieveMsg(pcbName);
			
		} catch (InterruptedException e) {
			
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		
	}
	
	public void realVolumeUp() {
		
		volume++;
		System.out.println("����" + volume);
		
	}
	
	public void realVolumeDown() {
		
		volume--;
		System.out.println("����" + volume);
		
	}
	
}
