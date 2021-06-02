package Battle;
import java.util.Scanner;

import Character.make_Character;
import Monster.make_Monster;

public class Battle {
	
	public void get_Battle(make_Character character, make_Monster monster) {
		
		String monster_Name = monster.get_Monster_Name();
		int monster_HP = monster.get_Moster_HP();
		int monster_Power = monster.get_Monster_Power();
		int monster_Exp = monster.get_Monster_Exp();
		int monster_Money = monster.get_Monster_Money();
		int c_HP = character.get_C_HP();
		int choice_Battle = 0;
		
		Scanner choice = new Scanner(System.in);
		System.out.println("���Ͻô� ������ �������ּ��� 1:�� 2:��ø 3:���� 4:���");
		
		choice_Battle = choice.nextInt();
		
		if(choice_Battle == 1) {
		
			int c_STR = character.get_C_STR();
			
			while(monster_HP > 0) {
				
				double monster_Power_Num = Math.random() * monster_Power + 1;
				double C_Power_Num = Math.random() * c_STR + 1;
				
				if(c_HP <= 0) {
					
					System.out.println("����� �׾����ϴ�");
					character.set_C_HP(c_HP);
					break;
					
				}
				else{
					
					System.out.println("����� ����!" + (int)C_Power_Num + "�� �������� �������ϴ�");
					monster_HP -= (int)C_Power_Num;
					System.out.println( monster_Name +"�� ����!" + (int)monster_Power_Num + "�� �������� �������ϴ�");
					c_HP -= (int)monster_Power_Num;
					
				}
				
			}
		
			if(c_HP > 0) {
				
				System.out.println("����� " + monster_Name + "�� �����߷Ƚ��ϴ�");
				System.out.println("����ġ " + monster_Exp + "�� ������ϴ�");
				System.out.println("�� " + monster_Money + "���� ������ϴ�");
				
				character.set_C_Exp(monster_Exp);
				character.set_C_Money(monster_Money);
				character.set_C_HP(c_HP);
				character.character_LevelUP();
				
			}
		}else if(choice_Battle == 2) {
			
			int c_DEX = character.get_C_DEX();
			
			while(monster_HP > 0) {
				
				double monster_Power_Num = Math.random() * monster_Power + 1;
				double C_Power_Num = Math.random() * c_DEX + 1;
				
				if(c_HP <= 0) {
					
					System.out.println("����� �׾����ϴ�");
					character.set_C_HP(c_HP);
					break;
					
				}
				else{
					
					System.out.println("����� ����!" + (int)C_Power_Num + "�� �������� �������ϴ�");
					monster_HP -= (int)C_Power_Num;
					System.out.println( monster_Name +"�� ����!" + (int)monster_Power_Num + "�� �������� �������ϴ�");
					c_HP -= (int)monster_Power_Num;
					
				}
				
			}
		
			if(c_HP > 0) {
				
				System.out.println("����� " + monster_Name + "�� �����߷Ƚ��ϴ�");
				System.out.println("����ġ " + monster_Exp + "�� ������ϴ�");
				System.out.println("�� " + monster_Money + "���� ������ϴ�");
				
				character.set_C_Exp(monster_Exp);
				character.set_C_Money(monster_Money);
				character.set_C_HP(c_HP);
				character.character_LevelUP();
				
			}
			
		}
		
		else if(choice_Battle == 3) {
			
			int c_INT = character.get_C_INT();
			
			while(monster_HP > 0) {
				
				double monster_Power_Num = Math.random() * monster_Power + 1;
				double C_Power_Num = Math.random() * c_INT + 1;
				
				if(c_HP <= 0) {
					
					System.out.println("����� �׾����ϴ�");
					character.set_C_HP(c_HP);
					break;
					
				}
				else{
					
					System.out.println( "����� ����!" + (int)C_Power_Num + "�� �������� �������ϴ�");
					monster_HP -= (int)C_Power_Num;
					System.out.println( monster_Name +"�� ����!" + (int)monster_Power_Num + "�� �������� �������ϴ�");
					c_HP -= (int)monster_Power_Num;
					
				}
				
			}
		
			if(c_HP > 0) {
				
				System.out.println("����� " + monster_Name + "�� �����߷Ƚ��ϴ�");
				System.out.println("����ġ " + monster_Exp + "�� ������ϴ�");
				System.out.println("�� " + monster_Money + "���� ������ϴ�");
				
				character.set_C_Exp(monster_Exp);
				character.set_C_Money(monster_Money);
				character.set_C_HP(c_HP);
				character.character_LevelUP();
				
			}
			
		}
		
		else if(choice_Battle == 4) {
			
			int c_LUCK = character.get_C_LUCK();
			
			while(monster_HP > 0) {
				
				double monster_Power_Num = Math.random() * monster_Power + 1;
				double C_Power_Num = Math.random() * c_LUCK + 1;
				
				if(c_HP <= 0) {
					
					System.out.println("����� �׾����ϴ�");
					character.set_C_HP(c_HP);
					break;
					
				}
				else{
					
					System.out.println( "����� ����!" + (int)C_Power_Num + "�� �������� �������ϴ�");
					monster_HP -= (int)C_Power_Num;
					System.out.println( monster_Name +"�� ����!" + (int)monster_Power_Num + "�� �������� �������ϴ�");
					c_HP -= (int)monster_Power_Num;
					
				}
				
			}
		
			if(c_HP > 0) {
				
				System.out.println("����� " + monster_Name + "�� �����߷Ƚ��ϴ�");
				System.out.println("����ġ " + monster_Exp + "�� ������ϴ�");
				System.out.println("�� " + monster_Money + "���� ������ϴ�");
				
				character.set_C_Exp(monster_Exp);
				character.set_C_Money(monster_Money);
				character.set_C_HP(c_HP);
				character.character_LevelUP();
				
			}
			
		}
	}
}
