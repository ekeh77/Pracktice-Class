package PKG_Static;

public class StaticExample {
	
	public static void main(String[] args) {
		
		Car car = new Car();
		//�޸𸮿� �ö�´�
		
		for(int i = 1; i <= 100 ; i++) {
			car.speed += i;
		}
		
		System.out.println(car.speed);
		
		
		for(int i = 1; i <= 100 ; i++) {
			car.speed2 += i;
			//���α׷��� ������ �� ���� �����������
		}
		
		System.out.println(Car.speed2);
		
		Car car2 = new Car();
		
		for(int i = 1; i <= 100 ; i++) {
			car2.speed += i;
		}
		
		System.out.println(car2.speed);
		
		for(int i = 1; i <= 100 ; i++) {
			car2.speed2 += i;
			//���α׷��� ������ �� ���� �����������
		}
		
		System.out.println(Car.speed2);
		
		System.out.println(car2.getCarCount());
		
	}
	
}
