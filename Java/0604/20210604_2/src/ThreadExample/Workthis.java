package ThreadExample;

public class Workthis {
	
	public synchronized void sayWork() {
		try {
			Thread.sleep(2000);
		} catch (InterruptedException e) {
			e.printStackTrace();
			System.out.println("히히 못지나가");
		}
		System.out.println(Thread.currentThread().getName() + "스레드 실행");
	}
}
