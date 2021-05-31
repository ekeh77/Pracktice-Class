package Pracktice;
import java.util.Scanner;

public class make_Character {
	//캐릭터의 속성
	public String name;//캐릭터 이름
	public int HP = 150;
	public int STR;//캐릭터 힘
	public int DEX;//캐릭터 민첩
	public int INT;//캐릭터 지능
	public int LUCK;//캐릭터 행운
	public int[] status = new int[4];// 전체 스탯
	public int haveMoney;
	public String C_Job = "없음";
	
	public make_Character(String name) {
		
		this.name = name;
		
		for(int i = 0; i < 4; i++) {
			
			double R_Num = Math.random() * 10;
			status[i] = (int)R_Num;
			
		}

		STR = status[0];
		DEX = status[1];
		INT = status[2];
		LUCK = status[3];
		
		System.out.println("캐릭터가 생성되었습니다");
	}
	
	public void decide_Status(String name) {
		
		if (name != null) {
			
			this.name = name;
			
			for(int i = 0; i < 4; i++) {
				
				double R_Num = Math.random() * 10;
				status[i] = (int)R_Num;
				
			}

			STR = status[0];
			DEX = status[1];
			INT = status[2];
			LUCK = status[3];
			
			System.out.println("캐릭터가 생성되었습니다");
		
		}
		else {
			
			System.out.println("이름을 입력해주세요");
			
		}
		
	}//public void decide_Status
	
	public void character_Status(){
		
		if (name != null) {
			
			System.out.println(name + "의 직업" + C_Job);
			System.out.println(name + "의 능력치는 힘:" + STR + " 민첩:" + DEX + " 지능:" + INT + " 행운:" + LUCK + " 입니다");
			System.out.println(name + "의 소지금 : " + haveMoney);
		}
		else {
			
			System.out.println("캐릭터를 생성해 주세요");
			
		}
		
	}//public void Character_Status
	
	public void  character_Jobs() {
		System.out.println("능력치를 바탕으로 직업을 추천합니다");
		if (name != null) {
			
			if(STR >= 8 || STR >= 8 && DEX <= 5 && INT <= 5 && LUCK <= 5) {
				
				System.out.println(name + "은 전사를 추천합니다");
				
			}
			else if(DEX >= 8 || STR <= 5 && DEX >= 8 && INT <= 5 && LUCK <= 5) {
				
				System.out.println(name + "은 궁수를 추천합니다");
				
			}
			else if(INT >= 8 || STR <= 5 && DEX <= 5 && INT >= 8 && LUCK <= 5) {
				
				System.out.println(name + "은 마법사를 추천합니다");
				
			}
			else if(LUCK >= 8 || STR <= 5 && DEX <= 5 && INT <= 5 && LUCK >= 8) {
				
				System.out.println(name + "은 도적를 추천합니다");
				
			}
			else if(STR >= 6 && DEX >= 6 && INT >= 6 && LUCK >= 6) {
				
				System.out.println(name + "은 밸런스가 좋아 모든 캐릭터를 추천합니다");
				
			}
			else{
				
				System.out.println(name + "은 캐삭을 추천합니다");
				
			}
		
		}
		else {
			
			System.out.println("캐릭터를 생성해 주세요");
			
		}
	}//public void  character_Jobs
	
	public void character_HP_Show() {
		
		System.out.println("남은 HP : " + HP);
		
	}//public void character_HP_Show()
	
	public void buy_potion() {
		if(haveMoney >= 50) {
			System.out.println("50원을 지불해 포션을 구매 후 사용합니다");
			HP = HP + 100;
			haveMoney -= 50;
		}
		else {
			System.out.println("돈이 부족합니다");
		}
		
	}//public void buy_potion()
	
	public void get_Job() {
		
		Scanner sc = new Scanner(System.in);
		System.out.println("원하시는 직업을 선택해주세요 1:전사 2:궁수 3:마법사 4:도적");
		int Job = sc.nextInt();
		
		if(Job == 1) {
			if(C_Job == "없음") {
				System.out.println("전사로 전직합니다");
				C_Job = "전사";
				System.out.println("힘 +2");
				STR += 2;
			}
			else {
				System.out.println("이미 직업을 가지고 있습니다");
			}
		}
		else if(Job == 2) {
			if(C_Job == "없음") {
				System.out.println("궁수로 전직합니다");
				C_Job = "궁수";
				System.out.println("민첩 +2");
				DEX += 2;
			}
			else {
				System.out.println("이미 직업을 가지고 있습니다");
			}
		}
		else if(Job == 3) {
			if(C_Job == "없음") {
				System.out.println("마법사로 전직합니다");
				C_Job = "마법사";
				System.out.println("지식 +2");
				INT += 2;
			}
			else {
				System.out.println("이미 직업을 가지고 있습니다");
			}
		}
		else if(Job == 4) {
			if(C_Job == "없음") {
				System.out.println("도적으로 전직합니다");
				C_Job = "도적";
				System.out.println("행운 +2");
				LUCK += 2;
			}
			else {
				System.out.println("이미 직업을 가지고 있습니다");
			}
		} 
		
	}//public void get_Job()
	
}//public class make_Character
