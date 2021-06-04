
public class TVBox implements CallBack{
	
	private PCB pcb;
	
	public TVBox(String pcbName) {
		pcb = new PCB(pcbName);
	}
	
	public PCB getPCB() {
		return this.pcb;
	}
	
	public void TurnOn() {
		
		//전원버튼을 눌러서 키는 동작
		//전원버튼을 눌렀다는 사실을 전달
		pcb.realTurnOn();
		
	}
	
	@Override
	public void RecieveMsg(String str) {
		
		System.out.println(str + "가 켜졌어요");
		
	}
	
	public void volumeUp() {
		
		pcb.realVolumeUp();
		
	}
	
	public void volumeDown() {
		
		pcb.realVolumeDown();
		
	}
	
}
