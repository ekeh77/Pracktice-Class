package PKG_Car;

public class Game {

	public static void main(String[] args) {
		
		Car car1 = new Car("�Ķ��", 20, "���");
		//�ڵ����� �޸��� �ϰ� �;�
		car1.carRun();
		
		//����ڰ� �ڵ��� ������ �ٲٰ� �;�
		car1.chgColor("�Ķ�");
		
		car1.carRun();
		car1.carRun();
		
		int nowMaxSpeed = car1.getMaxSpeed();
		System.out.println("���� �� ���� �ְ�ӵ��� : " + nowMaxSpeed + "�Դϴ�");
		
	}

}
