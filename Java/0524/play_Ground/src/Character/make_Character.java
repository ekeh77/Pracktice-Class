package Character;
import java.util.Scanner;

public class make_Character {
	private String c_Name;
	private int HP;
	private int LEVEL;
	private int EXP;
	private int STR;
	private int DEX;
	private int INT;
	private int LUCK;
	private String JOB;
	private int have_Money;
	private int[] status = new int[4];// 전체 스탯
	
	//캐릭터 생성
	public make_Character(String c_Name) {
		
		this.c_Name = c_Name;
		
		for(int i = 0; i < 4; i++) {
			
			double R_Num = Math.random() * 10;
			status[i] = (int)R_Num;
			
		}
		
		HP = 150;
		LEVEL = 10;
		STR = status[0];
		DEX = status[1];
		INT = status[2];
		LUCK = status[3];
		JOB = "없음";
		have_Money = 0;
		
		System.out.println("캐릭터가 생성되었습니다");
		
	}//public make_Character(String c_Name)
	
	//스테이터스 확인
	public void check_stat(){
		
		System.out.println(c_Name);
		System.out.println("레벨: " + LEVEL);
		System.out.println("경험치: " + EXP);
		System.out.println("직업: " + JOB);
		System.out.println("HP: " + HP);
		System.out.println("능력치 힘:" + STR + " 민첩:" + DEX + " 지능:" + INT + " 행운:" + LUCK);
		System.out.println("소지금: " + have_Money + "원");
		
	}
	
	//캐릭터 레벨업
	public void character_LevelUP() {
		
		if (this.EXP >= 100) {
			
			System.out.println("레벨이 올랐습니다!");
			this.LEVEL += 1;
			this.EXP -= 100;
			System.out.println("원하는 능력치를 선택하세요 1:힘 2:민첩 3:지능 4:행운");
			Scanner choice = new Scanner(System.in);
			int ablity = choice.nextInt();
			
			if(ablity == 1) {
				
				System.out.println("힘이 1 올랐습니다");
				this.STR += 1;
				
			}
			else if(ablity == 2) {
				
				System.out.println("민첩이 1 올랐습니다");
				this.DEX += 1;
				
			}
			else if(ablity == 3) {
				
				System.out.println("지능이 1 올랐습니다");
				this.INT += 1;
				
			}
			else if(ablity == 4) {
				
				System.out.println("행운이 1 올랐습니다");
				this.LUCK += 1;
			}
			else {
				
				System.out.println("능력치를 올리지않고 레벨업합니다");
				
			}
			
		}
		
	}//public void character_LevelUP()
	
	//캐릭터 전직
	public void get_Job(){
		
		int what_Job = 0;
		if(this.LEVEL >= 10) {
			
			if(this.JOB != "없음") {
				System.out.println("이미 직업을 가지고 있습니다 현재 직업: " + this.JOB);
			}
			else {
				System.out.println("어떤 직업으로 전직하시겠습니까?");
				System.out.println("1.전사 2.궁수 3.마법사 4.도적");
				System.out.println("취소하려면 1~4외에 아무거나 입력해주세요");
				Scanner choice = new Scanner(System.in);
				what_Job = choice.nextInt();
				if(what_Job == 1) {
					System.out.println("전사로 전직합니다!");
					this.JOB = "전사";
					System.out.println("힘 +2");
					this.STR += 2; 
				}
				else if(what_Job == 2) {
					System.out.println("궁수로 전직합니다!");
					this.JOB = "궁수";
					System.out.println("민첩 +2");
					this.DEX += 2; 
				}
				else if(what_Job == 3) {
					System.out.println("마법사로 전직합니다!");
					this.JOB = "마법사";
					System.out.println("지능 +2");
					this.INT += 2; 
				}
				else if(what_Job == 4) {
					System.out.println("도적으로 전직합니다!");
					this.JOB = "도적";
					System.out.println("행운 +2");
					this.LUCK += 2; 
				}
				else {
					
					System.out.println("전직을 취소합니다");
					
				}
			}
		}
		else {
			
			System.out.println("레벨이 부족합니다 전직은 10레벨에 가능합니다");
			
		}
		
		
	}//public void get_Job()
	
	//캐릭터 회복
	public void recovery_C_HP(int set_HP) {
		this.HP += set_HP;
	}//public void set_C_HP
	
	public void set_C_HP(int set_HP) {
		this.HP = set_HP;
	}//public void set_C_HP
	
	public int get_C_HP() {
		return this.HP;
	}//public int get_C_HP
	
	
	public void set_C_STR(int set_STR) {
		this.STR += set_STR;
	}//public void set_C_STR(int set_STR)
	
	public int get_C_STR() {
		return this.STR;
	}//public int get_C_STR
	
	
	public void set_C_DEX(int set_DEX) {
		this.DEX += set_DEX;
	}//public void set_C_STR(int set_STR)
	
	public int get_C_DEX() {
		return this.DEX;
	}//public int get_C_STR
	
	public void set_C_INT(int set_INT) {
		this.INT += set_INT;
	}//public void set_C_STR(int set_STR)
	
	public int get_C_INT() {
		return this.INT;
	}//public int get_C_STR
	
	public void set_C_LUCK(int set_LUCK) {
		this.LUCK += set_LUCK;
	}//public void set_C_STR(int set_STR)
	
	public int get_C_LUCK() {
		return this.LUCK;
	}//public int get_C_STR
	
	public void set_C_Exp(int set_Exp) {
		this.EXP += set_Exp;
	}//public void set_C_Exp(int set_Exp)
	
	public void set_C_Money(int set_Money) {
		this.have_Money += set_Money;
	}//public void set_C_STR(int set_STR)
	
	public int get_C_Money() {
		return this.have_Money;
	}//public int get_C_STR
	
}
