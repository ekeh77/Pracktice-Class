package PKG_Static;

public class Car {
	
	public int speed = 0;
	
	//������� - static member
	//�ν��Ͻ������ʾƵ� �����ϴ� ���� �޸𸮻� ����
	public static int speed2 = 0;
	
	//���� ��ü�հ踦 �� �� ���
	//�����ϸ� �޸𸮸� ���� �Ա� ������ Ư���� ���� ���
	private static int carCount = 0;
	
	public Car() {
		this.carCount += 1;
	}
	
	public int getCarCount() {
		return this.carCount;
	}
}
