package PKG_Car;

public class Car {
	
	//GUI - Graphic User Interface
	//디자인새로하고
	//자동차 엔진, 타이어, 최고속도, 속도에 따라, 드리프트 원한다면 각 개당 하나의 클래스가 된다
	//자동차 속성
	//자동차 행위
	
	//객체지향의 추상화 -- 상속
	
	//자동차 - 제네시즈, 소나타, 스포츠카, 트럭 --- 공통적인 사항들
	
	//1. 속성
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
	
	/*값을 수정할 수 있게 해주는것
	public void setMaxSpeed(int maxSpeed) {
		
		this.maxSpeed = maxSpeed;
		
	}
	*/
	
	//값을 확인할 수 있게 해주는것
	public int getMaxSpeed() {
		
		return this.maxSpeed;
		
	}
	
	//2. 행위들
	public void carRun() {
		
		nowSpeed = nowSpeed + 10;
		
		if(nowSpeed > maxSpeed) {
			System.out.println("경고 : 야 그만 밟아");
			nowSpeed = maxSpeed;
		}
		
		System.out.println(carName +"이고 색깔이 " + carColor + "인 자동차가 달린다!");
		System.out.println("이 차의 최고속도는" + maxSpeed + "이다");
		System.out.println("현재 이 차의 속도는" + nowSpeed + "이다!");
		
	}
	
	
	public void chgColor(String carColor) {
		
		this.carColor = carColor;
		
	}
	
}
