package PKG_Car;

public class Car {
	
	//GUI - Graphic User Interface
	//�����λ����ϰ�
	//�ڵ��� ����, Ÿ�̾�, �ְ�ӵ�, �ӵ��� ����, �帮��Ʈ ���Ѵٸ� �� ���� �ϳ��� Ŭ������ �ȴ�
	//�ڵ��� �Ӽ�
	//�ڵ��� ����
	
	//��ü������ �߻�ȭ -- ���
	
	//�ڵ��� - ���׽���, �ҳ�Ÿ, ������ī, Ʈ�� --- �������� ���׵�
	
	//1. �Ӽ�
	private String carName;
	private int maxSpeed;
	private String carColor;
	private int nowSpeed;
	
	//
	
	public Car(String carName, int maxSpeed) {
		
		this.carName = carName;
		this.maxSpeed = maxSpeed;
		this.nowSpeed = 0;
		
	}
	
	public Car(String carName, int maxSpeed, String carColor) {
		this.carName = carName;
		this.maxSpeed = maxSpeed;
		this.carColor = carColor;
		this.nowSpeed = 0;
	}
	
	/*���� ������ �� �ְ� ���ִ°�
	public void setMaxSpeed(int maxSpeed) {
		
		this.maxSpeed = maxSpeed;
		
	}
	*/
	
	//���� Ȯ���� �� �ְ� ���ִ°�
	public int getMaxSpeed() {
		
		return this.maxSpeed;
		
	}
	
	//2. ������
	public void carRun() {
		
		nowSpeed = nowSpeed + 10;
		
		if(nowSpeed > maxSpeed) {
			System.out.println("��� : �� �׸� ���");
			nowSpeed = maxSpeed;
		}
		
		System.out.println(carName +"�̰� ������ " + carColor + "�� �ڵ����� �޸���!");
		System.out.println("�� ���� �ְ�ӵ���" + maxSpeed + "�̴�");
		System.out.println("���� �� ���� �ӵ���" + nowSpeed + "�̴�!");
		
	}
	
	
	public void chgColor(String carColor) {
		
		this.carColor = carColor;
		
	}
	
}
