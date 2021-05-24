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
	private int[] status = new int[4];// ��ü ����
	
	//ĳ���� ����
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
		JOB = "����";
		have_Money = 0;
		
		System.out.println("ĳ���Ͱ� �����Ǿ����ϴ�");
		
	}//public make_Character(String c_Name)
	
	//�������ͽ� Ȯ��
	public void check_stat(){
		
		System.out.println(c_Name);
		System.out.println("����: " + LEVEL);
		System.out.println("����ġ: " + EXP);
		System.out.println("����: " + JOB);
		System.out.println("HP: " + HP);
		System.out.println("�ɷ�ġ ��:" + STR + " ��ø:" + DEX + " ����:" + INT + " ���:" + LUCK);
		System.out.println("������: " + have_Money + "��");
		
	}
	
	//ĳ���� ������
	public void character_LevelUP() {
		
		if (this.EXP >= 100) {
			
			System.out.println("������ �ö����ϴ�!");
			this.LEVEL += 1;
			this.EXP -= 100;
			System.out.println("���ϴ� �ɷ�ġ�� �����ϼ��� 1:�� 2:��ø 3:���� 4:���");
			Scanner choice = new Scanner(System.in);
			int ablity = choice.nextInt();
			
			if(ablity == 1) {
				
				System.out.println("���� 1 �ö����ϴ�");
				this.STR += 1;
				
			}
			else if(ablity == 2) {
				
				System.out.println("��ø�� 1 �ö����ϴ�");
				this.DEX += 1;
				
			}
			else if(ablity == 3) {
				
				System.out.println("������ 1 �ö����ϴ�");
				this.INT += 1;
				
			}
			else if(ablity == 4) {
				
				System.out.println("����� 1 �ö����ϴ�");
				this.LUCK += 1;
			}
			else {
				
				System.out.println("�ɷ�ġ�� �ø����ʰ� �������մϴ�");
				
			}
			
		}
		
	}//public void character_LevelUP()
	
	//ĳ���� ����
	public void get_Job(){
		
		int what_Job = 0;
		if(this.LEVEL >= 10) {
			
			if(this.JOB != "����") {
				System.out.println("�̹� ������ ������ �ֽ��ϴ� ���� ����: " + this.JOB);
			}
			else {
				System.out.println("� �������� �����Ͻðڽ��ϱ�?");
				System.out.println("1.���� 2.�ü� 3.������ 4.����");
				System.out.println("����Ϸ��� 1~4�ܿ� �ƹ��ų� �Է����ּ���");
				Scanner choice = new Scanner(System.in);
				what_Job = choice.nextInt();
				if(what_Job == 1) {
					System.out.println("����� �����մϴ�!");
					this.JOB = "����";
					System.out.println("�� +2");
					this.STR += 2; 
				}
				else if(what_Job == 2) {
					System.out.println("�ü��� �����մϴ�!");
					this.JOB = "�ü�";
					System.out.println("��ø +2");
					this.DEX += 2; 
				}
				else if(what_Job == 3) {
					System.out.println("������� �����մϴ�!");
					this.JOB = "������";
					System.out.println("���� +2");
					this.INT += 2; 
				}
				else if(what_Job == 4) {
					System.out.println("�������� �����մϴ�!");
					this.JOB = "����";
					System.out.println("��� +2");
					this.LUCK += 2; 
				}
				else {
					
					System.out.println("������ ����մϴ�");
					
				}
			}
		}
		else {
			
			System.out.println("������ �����մϴ� ������ 10������ �����մϴ�");
			
		}
		
		
	}//public void get_Job()
	
	//ĳ���� ȸ��
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
