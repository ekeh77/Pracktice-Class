package Pracktice;

public class make_Monster {

	public String name;//������ �̸�
	public int HP;

	public int monster_Power;
	public int monster_Exp;
	public int monster_Gold;
	public int battle_Money;
	
	public int battle_Monster_STR(int STR, int C_HP) {
		if (C_HP <= 0) {
			
		}else {
			if(STR == 0) {
				
				System.out.println("���� ���� ����� ����߽��ϴ�" );
				
				C_HP = 0;
				
			}
			else {
			
				int count_Battle = 0;
				int HP_chack = HP;
				
				while(HP_chack >= 0) {
						double monster_Power_Num = Math.random() * monster_Power;
						double C_Power_Num = Math.random() * STR;
						
						HP_chack = HP_chack - (int)C_Power_Num;
						C_HP = C_HP - (int)monster_Power_Num;
						count_Battle += 1;
						
						System.out.println("����� ����! " + (int)C_Power_Num + "�� �������� �������ϴ�" );
						System.out.println(name + "�� ����! " + (int)monster_Power_Num + "�� �������� �Ծ����ϴ�" );
						System.out.println(" ");
						
						if(C_HP <= 0 && HP_chack >= 0) {
							
							System.out.println("����� ����߽��ϴ�");
							break;
							
						}
						else if(C_HP >= 0 && HP_chack <= 0){
							
							System.out.println("����� ������ " + name + "�� " + count_Battle + "���� �������� �����߷Ƚ��ϴ�");
							System.out.println("����� ����ġ " + monster_Exp + "�� " + monster_Gold + "��带 ������ϴ�" );
							battle_Money += monster_Gold;
							break;
						}
				}
				
				count_Battle = 0;
				
			}
		}
		return C_HP;
		
	}//public void battle_Monster_STR(int STR)
	
	public int battle_Monster_DEX(int DEX, int C_HP) {
		if (C_HP <= 0) {
			
		}else {
			
			if(DEX == 0) {
				
				System.out.println("��ø�� ���� ����� ����߽��ϴ�" );
				
				C_HP = 0;
				
			}
			else {
			
				int count_Battle = 0;
				int HP_chack = HP;
				
				while(HP_chack >= 0) {
					double monster_Power_Num = Math.random() * monster_Power;
					double C_Power_Num = Math.random() * DEX;
					
					HP_chack = HP_chack - (int)C_Power_Num;
					C_HP = C_HP - (int)monster_Power_Num;
					count_Battle += 1;
					
					System.out.println("����� ����! " + (int)C_Power_Num + "�� �������� �������ϴ�" );
					System.out.println(name + "�� ����! " + (int)monster_Power_Num + "�� �������� �Ծ����ϴ�" );
					System.out.println(" ");
					
					if(C_HP <= 0 && HP_chack >= 0) {
						
						System.out.println("����� ����߽��ϴ�");
						break;
						
					}
					else if(C_HP >= 0 && HP_chack <= 0){
				
						System.out.println("����� Ȱ�� " + name + "�� " + count_Battle + "���� �������� �����߷Ƚ��ϴ�");
						System.out.println("����� ����ġ " + monster_Exp + "�� " + monster_Gold + "��带 ������ϴ�" );
						battle_Money += monster_Gold;
						break;
					}
				}
				count_Battle = 0;
				
			}
		}
		return C_HP;
		
	}//public void battle_Monster_DEX(int DEX) 
	
	public int battle_Monster_INT(int INT, int C_HP) {
		if (C_HP <= 0) {
			
		}else {
			if(INT == 0) {
				
				System.out.println("���ɵ� ���� ����� ����߽��ϴ�" );
				
				C_HP = 0;
				
			}
			else {
			
				int count_Battle = 0;
				int HP_chack = HP;
				
				while(HP_chack >= 0) {
					double monster_Power_Num = Math.random() * monster_Power;
					double C_Power_Num = Math.random() * INT;
					
					HP_chack = HP_chack - (int)C_Power_Num;
					C_HP = C_HP - (int)monster_Power_Num;
					count_Battle += 1;
					
					System.out.println("����� ����! " + (int)C_Power_Num + "�� �������� �������ϴ�" );
					System.out.println(name + "�� ����! " + (int)monster_Power_Num + "�� �������� �Ծ����ϴ�" );
					System.out.println(" ");
					
					if(C_HP <= 0 && HP_chack >= 0) {
						
						System.out.println("����� ����߽��ϴ�");
						break;
						
					}
					else if(C_HP >= 0 && HP_chack <= 0){
				
						System.out.println("����� �������� " + name + "�� " + count_Battle + "���� �������� �����߷Ƚ��ϴ�");
						System.out.println("����� ����ġ " + monster_Exp + "�� " + monster_Gold + "��带 ������ϴ�" );
						battle_Money += monster_Gold;
						break;
					}
				}
				count_Battle = 0;
				
			}
		}
		return C_HP;
		
	}//public void battle_Monster_INT(int INT)
	
	public int battle_Monster_LUCK(int LUCK, int C_HP) {
		if (C_HP <= 0) {
			
		}else {
			if(LUCK == 0) {
				
				System.out.println("� ���� ����� ����߽��ϴ�" );
				
				C_HP = 0;
				
			}
			else {
			
				int count_Battle = 0;
				int HP_chack = HP;
				
				while(HP_chack >= 0) {
					double monster_Power_Num = Math.random() * monster_Power;
					double C_Power_Num = Math.random() * LUCK;
					
					HP_chack = HP_chack - (int)C_Power_Num;
					C_HP = C_HP - (int)monster_Power_Num;
					count_Battle += 1;
					
					System.out.println("����� ����! " + (int)C_Power_Num + "�� �������� �������ϴ�" );
					System.out.println(name + "�� ����! " + (int)monster_Power_Num + "�� �������� �Ծ����ϴ�" );
					System.out.println(" ");
					
					if(C_HP <= 0 && HP_chack >= 0) {
						
						System.out.println("����� ����߽��ϴ�");
						break;
						
					}
					else if(C_HP >= 0 && HP_chack <= 0){
				
						System.out.println("����� �ܰ����� " + name + "�� " + count_Battle + "���� �������� �����߷Ƚ��ϴ�");
						System.out.println("����� ����ġ " + monster_Exp + "�� " + monster_Gold + "��带 ������ϴ�" );
						battle_Money += monster_Gold;
						break;
					}
				}
				
				count_Battle = 0;
				
			}
		}
		return C_HP;
		
	}//public void battle_Monster_LUCK(int LUCK)
	
}
