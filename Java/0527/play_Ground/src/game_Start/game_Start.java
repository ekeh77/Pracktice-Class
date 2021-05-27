package game_Start;
import java.util.Scanner;

import Battle.Battle;
import Character.make_Character;
import Monster.make_Monster;
import Shop.Shop;

public class game_Start {
	
	public static void main(String[] args) {
		
		Scanner what_name = new Scanner(System.in);
		
		System.out.println("게임을 시작합니다..");
		System.out.println("게임에 사용할 이름을 입력해주세요");
		
		String name = what_name.next();
		
		make_Character new_Character = new make_Character(name);
		
		
		int start_Game = 0;
		int choice_Monster = 0;
		
		
		while(start_Game <= 4) {
			
			int c_HP = new_Character.get_C_HP();
			
			if(c_HP <= 0) {
				
				break;
				
			}
			else {
				Scanner choice = new Scanner(System.in);
				System.out.println("원하시는 행동을 선택해주세요 1:사냥 2:스테이터스 확인 3:상점 4:전직");
				System.out.println("종료하려면 1~4를 제외한 아무키를 눌러주세요");
				start_Game = choice.nextInt();
				if(start_Game == 1) {
					
					make_Monster slime = new make_Monster("슬라임", 50, 5, 50, 25);
					make_Monster strong_Slime = new make_Monster("강한슬라임", 100, 10, 100, 50);
					
					String slimeName = slime.get_Monster_Name();
					String strongSlimeName = strong_Slime.get_Monster_Name();
					
					System.out.println("원하시는 몬스터를 선택해주세요 1:" + slimeName + "2:" + strongSlimeName);
					choice_Monster = choice.nextInt();
					Battle battle_Begin = new Battle();
					
					if(choice_Monster == 1) {
						
						battle_Begin.get_Battle(new_Character, slime);
							
					}
					else if(choice_Monster == 2) {
						
						battle_Begin.get_Battle(new_Character, strong_Slime);
						
					}
				}
				else if(start_Game == 2) {
					
					new_Character.check_stat();
					
				}
				else if(start_Game == 3) {
					
					Shop shop = new Shop();
					shop.buy(new_Character);
					
				}
				else if(start_Game == 4) {
					
					new_Character.get_Job();
					
				}
				else {
					
					System.out.println("게임을 종료합니다");
					
				}
			
			}
		}//while(start_Game <= 4)

	}
	
}
