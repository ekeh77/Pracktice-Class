
public class TVExample {

	public static void main(String[] args) {
		
		TVBox tv = new TVBox("PCB");
		TVBox tv2 = new TVBox("PCB2");
		
		PCB pcb = tv.getPCB();
		pcb.setTVBox(tv);
		tv.TurnOn();


		PCB pcb2 = tv2.getPCB();
		pcb2.setTVBox(tv2);
		tv2.TurnOn();
	}

}
