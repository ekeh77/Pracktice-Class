package playGround;
import java.util.Scanner;

import Pracktice.make_Character;
import Pracktice.make_Monster;

public class play_Something {

	public static void main(String[] args) {
		
		
		make_Character gerin = new make_Character("�⸰");
		gerin.character_HP_Show();
		gerin.character_Status();
		
		make_Monster Slime = new make_Monster();
		Slime.name = "������";
		Slime.HP = 50;
		Slime.monster_Power = 5;
		Slime.monster_Exp = 10;
		Slime.monster_Gold = 25;

		make_Monster strong_Slime = new make_Monster();
		strong_Slime.name = "���ѽ�����";
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
			System.out.println("���Ͻô� �ൿ�� �������ּ��� 1:��� 2:�������ͽ� Ȯ�� 3:���Ǳ��� 4:���� 5:��Ȱ 6:����");
			start_Game = choice.nextInt();
			
			if (start_Game == 1) {
				System.out.println("���Ͻô� ���͸� �������ּ��� 1:������ 2:���ѽ�����");
				choice_Monster = choice.nextInt();
				if(choice_Monster == 1) {
					
					System.out.println("���Ͻô� ��Ʋ�� �������ּ��� 1:�� 2:��ø 3:���� 4:���");
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
						System.out.println("����� �����ƽ��ϴ�");
					}
					
				}
				else if(choice_Monster == 2){
					
					System.out.println("���Ͻô� ��Ʋ�� �������ּ��� 1:�� 2:��ø 3:���� 4:���");
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
						System.out.println("����� �����ƽ��ϴ�");
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
				gerin.C_Job = "����";
				new_ID = choice.next();
				gerin.decide_Status(new_ID);
			}
			else if(start_Game >= 6) {
				break;
			}
		}

	}

}
