package ThreadExample;

public class Workthis {
	
	public synchronized void sayWork() {
		try {
			Thread.sleep(2000);
		} catch (InterruptedException e) {
			e.printStackTrace();
			System.out.println("���� ��������");
		}
		System.out.println(Thread.currentThread().getName() + "������ ����");
	}
}
