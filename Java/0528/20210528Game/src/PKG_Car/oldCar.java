package PKG_Car;
import java.util.Scanner;

public class oldCar extends Car implements getKey{
	private int carKey;
	private String Gear;
	private int speed​_Limit;
	
	public oldCar(String carName, int maxSpeed) {
		super(carName, maxSpeed);
	}
	
	@Override
	public void Key() {
		carKey = 1;
	}
	
	public void carInfo() {
		
		System.out.println("차이름 :" + super.getcarName());
		System.out.println("현재속도 :" + super.getcurrentSpeed());
		System.out.println("한계속도 :" + super.getmaxSpeed());
		System.out.println("기어 :" + Gear);
		
	}
	
	public  void start_Up() {
		
		if(carKey == 1) {
			System.out.println("차의 시동이 걸렸습니다");
		}
		else {
			System.out.println("차키가 필요합니다");
		}
		
	}
	
	public  void setGear() {
		System.out.println("기어를 몇단으로 넣겠습니까? 1:1단 2:2단 3:3단 4:4단 5:5단");
		Scanner wGear = new Scanner(System.in);
		int gearNum = wGear.nextInt();
		if(gearNum == 1) {

			Gear = "1단";
			System.out.println("기어를 " + Gear +"으로 넣었습니다");
			speed​_Limit = 20;
			
		}
		else if(gearNum == 2){
			
			Gear = "2단";
			System.out.println("기어를 " + Gear +"으로 넣었습니다");
			speed​_Limit = 40;
			
		}
		else if(gearNum == 3){
			
			Gear = "3단";
			System.out.println("기어를 " + Gear +"으로 넣었습니다");
			speed​_Limit = 80;
			
		}
		else if(gearNum == 4){
	
			Gear = "4단";
			System.out.println("기어를 " + Gear +"으로 넣었습니다");
			speed​_Limit = 120;
	
		}
		else if(gearNum == 5){
			
			Gear = "5단";
			System.out.println("기어를 " + Gear +"으로 넣었습니다");
			speed​_Limit = super.getmaxSpeed();
	
		}
		
	}
	
	public  void putAccelerator(int num) {
		
		
		System.out.println("당신은 엑셀을 " + num + "번 밟았습니다");
		
		if(Gear == "1단" && carKey == 1) {
				
				for(int i = 0; i < num; i++) {
					
					int currentNum = super.getcurrentSpeed();
					
					if(currentNum >= speed​_Limit) {
						
						System.out.println("당신은 엑셀을 밟았습니다 속도가 한계입니다 기어를 바꿔주세요");
						
					}
					else {
						
						System.out.println("당신은 엑셀을 밟았습니다");
						super.setcurrentSpeed(10);
						
					}
						
				}
				
		}
		else if(Gear == "2단" && carKey == 1) {
			
			for(int i = 0; i < num; i++) {
				
				int currentNum = super.getcurrentSpeed();
				
				if(currentNum >= speed​_Limit) {
					
					System.out.println("당신은 엑셀을 밟았습니다 속도가 한계입니다 기어를 바꿔주세요");
					
				}
				else {
					
					System.out.println("당신은 엑셀을 밟았습니다");
					super.setcurrentSpeed(10);
					
				}
					
			}
			
		}
		else if(Gear == "3단" && carKey == 1) {
			
			for(int i = 0; i < num; i++) {
				
				int currentNum = super.getcurrentSpeed();
				
				if(currentNum >= speed​_Limit) {
					
					System.out.println("당신은 엑셀을 밟았습니다 속도가 한계입니다 기어를 바꿔주세요");
					
				}
				else {
					
					System.out.println("당신은 엑셀을 밟았습니다");
					super.setcurrentSpeed(10);
					
				}
					
			}
			
		}
		else if(Gear == "4단" && carKey == 1) {
			
			for(int i = 0; i < num; i++) {
				
				int currentNum = super.getcurrentSpeed();
				
				if(currentNum >= speed​_Limit) {
					
					System.out.println("당신은 엑셀을 밟았습니다 속도가 한계입니다 기어를 바꿔주세요");
					
				}
				else {
					
					System.out.println("당신은 엑셀을 밟았습니다");
					super.setcurrentSpeed(10);
					
				}
					
			}
			
		}
		else if(Gear == "5단" && carKey == 1) {
			
			for(int i = 0; i < num; i++) {
				
				int currentNum = super.getcurrentSpeed();
				
				if(currentNum >= speed​_Limit) {
					
					System.out.println("당신은 엑셀을 밟았습니다 속도가 한계입니다 기어를 바꿔주세요");
					
				}
				else {
					
					System.out.println("당신은 엑셀을 밟았습니다");
					super.setcurrentSpeed(10);
					
				}
					
			}
			
		}
		else{
			System.out.println("당신은 엑셀을 밟았지만 아무런 반응이 없습니다");
		}
		
	}
	
	public  void putbrake() {
		
		System.out.println("당신은 브레이크를 밟았습니다");
		super.setcurrentSpeed(-10);
		
	}

	@Override
	public void putAccelerator() {
		// TODO Auto-generated method stub
		
	}
	
}
