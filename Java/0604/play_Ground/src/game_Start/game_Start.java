package game_Start;
import java.util.Scanner;

import Battle.Battle;
import Character.make_Character;
import Monster.make_Monster;
import Shop.Shop;

public class game_Start {
	
	public static void main(String[] args) {
		
		Scanner what_name = new Scanner(System.in);
		
		System.out.println("������ �����մϴ�..");
		System.out.println("���ӿ� ����� �̸��� �Է����ּ���");
		
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
				System.out.println("���Ͻô� �ൿ�� �������ּ��� 1:��� 2:�������ͽ� Ȯ�� 3:���� 4:����");
				System.out.println("�����Ϸ��� 1~4�� ������ �ƹ�Ű�� �����ּ���");
				start_Game = choice.nextInt();
				if(start_Game == 1) {
					
					make_Monster slime = new make_Monster("������", 50, 5, 50, 25);
					make_Monster strong_Slime = new make_Monster("���ѽ�����", 100, 10, 100, 50);
					
					String slimeName = slime.get_Monster_Name();
					String strongSlimeName = strong_Slime.get_Monster_Name();
					
					System.out.println("���Ͻô� ���͸� �������ּ��� 1:" + slimeName + "2:" + strongSlimeName);
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
					
					System.out.println("������ �����մϴ�");
					
				}
			
			}
		}//while(start_Game <= 4)

	}
	
}
