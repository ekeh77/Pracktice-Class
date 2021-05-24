package PKG_Car;

public class Game {

	public static void main(String[] args) {
		
		Car car1 = new Car("파라곤", 20, "노랑");
		//자동차를 달리게 하고 싶어
		car1.carRun();
		
		//사용자가 자동차 색깔을 바꾸고 싶어
		car1.chgColor("파랑");
		
		car1.carRun();
		car1.carRun();
		
		int nowMaxSpeed = car1.getMaxSpeed();
		System.out.println("현재 이 차의 최고속도는 : " + nowMaxSpeed + "입니다");
		
	}

}
