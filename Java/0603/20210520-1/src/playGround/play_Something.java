package playGround;
import java.util.Scanner;

import Pracktice.make_Character;
import Pracktice.make_Monster;

public class play_Something {

	public static void main(String[] args) {
		
		
		make_Character gerin = new make_Character("기린");
		gerin.character_HP_Show();
		gerin.character_Status();
		
		make_Monster Slime = new make_Monster();
		Slime.name = "슬라임";
		Slime.HP = 50;
		Slime.monster_Power = 5;
		Slime.monster_Exp = 10;
		Slime.monster_Gold = 25;

		make_Monster strong_Slime = new make_Monster();
		strong_Slime.name = "강한슬라임";
		strong_Slime.HP = 100;
		strong_Slime.monster_Power = 10;
		strong_Slime.monster_Exp = 30;
		strong_Slime.monster_Gold = 50;
		
		int start_Game = 0;
		int choice_Monster = 0;
		int choice_Battle = 0;
		String new_ID = "";
		
		while(start_Game <= 6) {
			Scanner choice = new Scanner(System.in);
			System.out.println("원하시는 행동을 선택해주세요 1:사냥 2:스테이터스 확인 3:포션구매 4:전직 5:부활 6:종료");
			start_Game = choice.nextInt();
			
			if (start_Game == 1) {
				System.out.println("원하시는 몬스터를 선택해주세요 1:슬라임 2:강한슬라임");
				choice_Monster = choice.nextInt();
				if(choice_Monster == 1) {
					
					System.out.println("원하시는 배틀을 선택해주세요 1:힘 2:민첩 3:지능 4:행운");
					choice_Battle = choice.nextInt();
					
					if(choice_Battle == 1) {
						gerin.HP = Slime.battle_Monster_STR(gerin.STR, gerin.HP);
						gerin.haveMoney = Slime.battle_Money;
					}
					else if(choice_Battle == 2) {
						gerin.HP = Slime.battle_Monster_DEX(gerin.DEX, gerin.HP);
						gerin.haveMoney = Slime.battle_Money;
					}
					else if(choice_Battle == 3) {
						gerin.HP = Slime.battle_Monster_INT(gerin.INT, gerin.HP);
						gerin.haveMoney = Slime.battle_Money;
					}
					else if(choice_Battle == 4) {
						gerin.HP = Slime.battle_Monster_LUCK(gerin.LUCK, gerin.HP);
						gerin.haveMoney = Slime.battle_Money;
					}
					else {
						System.out.println("당신은 도망쳤습니다");
					}
					
				}
				else if(choice_Monster == 2){
					
					System.out.println("원하시는 배틀을 선택해주세요 1:힘 2:민첩 3:지능 4:행운");
					choice_Battle = choice.nextInt();
					
					if(choice_Battle == 1) {
						gerin.HP = strong_Slime.battle_Monster_STR(gerin.STR, gerin.HP);
						gerin.haveMoney = strong_Slime.battle_Money;
					}
					else if(choice_Battle == 2) {
						gerin.HP = strong_Slime.battle_Monster_DEX(gerin.DEX, gerin.HP);
						gerin.haveMoney = strong_Slime.battle_Money;
					}
					else if(choice_Battle == 3) {
						gerin.HP = strong_Slime.battle_Monster_INT(gerin.INT, gerin.HP);
						gerin.haveMoney = strong_Slime.battle_Money;
					}
					else if(choice_Battle == 4) {
						gerin.HP = strong_Slime.battle_Monster_LUCK(gerin.LUCK, gerin.HP);
						gerin.haveMoney = strong_Slime.battle_Money;
					}
					else {
						System.out.println("당신은 도망쳤습니다");
					}
					
				}
				else {
					
				}
				
			}
			else if(start_Game == 2) {
				gerin.character_HP_Show();
				gerin.character_Status();
			}
			else if(start_Game == 3) {
				gerin.buy_potion();
			}
			else if(start_Game == 4) {
				gerin.get_Job();
			}
			else if(start_Game == 5) {
				gerin.HP = 150;
				gerin.C_Job = "없음";
				new_ID = choice.next();
				gerin.decide_Status(new_ID);
			}
			else if(start_Game >= 6) {
				break;
			}
		}

	}

}
