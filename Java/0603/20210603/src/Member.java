
public class Member implements CallBack{

	private int point = 0;
	private Car car;
	//private int pointNum = 0;  
	
	public void rideCar(Car car) {
		
		this.car = car;
		
	}
	
	public void getPoint() {
		//�ѹ��� ����Ʈ�� ȹ���� �� �־��
		/*
		this.pointNum += 1;
		if(this.pointNum <= 1) {
		
			this.point += 1000;
			car.getPoint();
			System.out.println("����� " + this.point + "�� ȹ���߾��");
			
		}
		else {
			
			System.out.println("���̻� ����Ʈ�� ���� �� �����");
			
		}
		*/

		car.getPoint();		
		
	}
	
	
	@Override
	public void ResultMsg(int hasPoint) {
		
		point += hasPoint;
		
		System.out.println("��������Ʈ�� " + hasPoint);
		System.out.println("������Ʈ�� " + point);
		
	}
	
}
