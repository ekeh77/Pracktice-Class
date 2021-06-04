package ThreadExample;

public class threadExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Workthis w1 = new Workthis();
		
		TEx1 t1 = new TEx1();
		t1.setWork(w1);
		t1.start();
		
		t1.interrupt();
		
		TEx2 t2 = new TEx2();
		t2.setWork(w1);
		t2.start();
		
		
	}

}
