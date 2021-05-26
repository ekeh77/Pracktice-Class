package Pracktice;

public class make_Monster {

	public String name;//몬스터의 이름
	public int HP;

	public int monster_Power;
	public int monster_Exp;
	public int monster_Gold;
	public int battle_Money;
	
	public int battle_Monster_STR(int STR, int C_HP) {
		if (C_HP <= 0) {
			
		}else {
			if(STR == 0) {
				
				System.out.println("힘도 없는 당신은 사망했습니다" );
				
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
						
						System.out.println("당신의 공격! " + (int)C_Power_Num + "의 데미지를 입혔습니다" );
						System.out.println(name + "의 공격! " + (int)monster_Power_Num + "의 데미지를 입었습니다" );
						System.out.println(" ");
						
						if(C_HP <= 0 && HP_chack >= 0) {
							
							System.out.println("당신은 사망했습니다");
							break;
							
						}
						else if(C_HP >= 0 && HP_chack <= 0){
							
							System.out.println("당신은 검으로 " + name + "을 " + count_Battle + "번의 공격으로 쓰려뜨렸습니다");
							System.out.println("당신은 경험치 " + monster_Exp + "과 " + monster_Gold + "골드를 얻었습니다" );
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
				
				System.out.println("민첩도 없는 당신은 사망했습니다" );
				
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
					
					System.out.println("당신의 공격! " + (int)C_Power_Num + "의 데미지를 입혔습니다" );
					System.out.println(name + "의 공격! " + (int)monster_Power_Num + "의 데미지를 입었습니다" );
					System.out.println(" ");
					
					if(C_HP <= 0 && HP_chack >= 0) {
						
						System.out.println("당신은 사망했습니다");
						break;
						
					}
					else if(C_HP >= 0 && HP_chack <= 0){
				
						System.out.println("당신은 활로 " + name + "을 " + count_Battle + "번의 공격으로 쓰려뜨렸습니다");
						System.out.println("당신은 경험치 " + monster_Exp + "과 " + monster_Gold + "골드를 얻었습니다" );
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
				
				System.out.println("지능도 없는 당신은 사망했습니다" );
				
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
					
					System.out.println("당신의 공격! " + (int)C_Power_Num + "의 데미지를 입혔습니다" );
					System.out.println(name + "의 공격! " + (int)monster_Power_Num + "의 데미지를 입었습니다" );
					System.out.println(" ");
					
					if(C_HP <= 0 && HP_chack >= 0) {
						
						System.out.println("당신은 사망했습니다");
						break;
						
					}
					else if(C_HP >= 0 && HP_chack <= 0){
				
						System.out.println("당신은 마법으로 " + name + "을 " + count_Battle + "번의 공격으로 쓰려뜨렸습니다");
						System.out.println("당신은 경험치 " + monster_Exp + "과 " + monster_Gold + "골드를 얻었습니다" );
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
				
				System.out.println("운도 없는 당신은 사망했습니다" );
				
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
					
					System.out.println("당신의 공격! " + (int)C_Power_Num + "의 데미지를 입혔습니다" );
					System.out.println(name + "의 공격! " + (int)monster_Power_Num + "의 데미지를 입었습니다" );
					System.out.println(" ");
					
					if(C_HP <= 0 && HP_chack >= 0) {
						
						System.out.println("당신은 사망했습니다");
						break;
						
					}
					else if(C_HP >= 0 && HP_chack <= 0){
				
						System.out.println("당신은 단검으로 " + name + "을 " + count_Battle + "번의 공격으로 쓰려뜨렸습니다");
						System.out.println("당신은 경험치 " + monster_Exp + "과 " + monster_Gold + "골드를 얻었습니다" );
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
