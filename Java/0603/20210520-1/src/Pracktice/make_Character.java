package Pracktice;
import java.util.Scanner;

public class make_Character {
	//ĳ������ �Ӽ�
	public String name;//ĳ���� �̸�
	public int HP = 150;
	public int STR;//ĳ���� ��
	public int DEX;//ĳ���� ��ø
	public int INT;//ĳ���� ����
	public int LUCK;//ĳ���� ���
	public int[] status = new int[4];// ��ü ����
	public int haveMoney;
	public String C_Job = "����";
	
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
		
		System.out.println("ĳ���Ͱ� �����Ǿ����ϴ�");
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
			
			System.out.println("ĳ���Ͱ� �����Ǿ����ϴ�");
		
		}
		else {
			
			System.out.println("�̸��� �Է����ּ���");
			
		}
		
	}//public void decide_Status
	
	public void character_Status(){
		
		if (name != null) {
			
			System.out.println(name + "�� ����" + C_Job);
			System.out.println(name + "�� �ɷ�ġ�� ��:" + STR + " ��ø:" + DEX + " ����:" + INT + " ���:" + LUCK + " �Դϴ�");
			System.out.println(name + "�� ������ : " + haveMoney);
		}
		else {
			
			System.out.println("ĳ���͸� ������ �ּ���");
			
		}
		
	}//public void Character_Status
	
	public void  character_Jobs() {
		System.out.println("�ɷ�ġ�� �������� ������ ��õ�մϴ�");
		if (name != null) {
			
			if(STR >= 8 || STR >= 8 && DEX <= 5 && INT <= 5 && LUCK <= 5) {
				
				System.out.println(name + "�� ���縦 ��õ�մϴ�");
				
			}
			else if(DEX >= 8 || STR <= 5 && DEX >= 8 && INT <= 5 && LUCK <= 5) {
				
				System.out.println(name + "�� �ü��� ��õ�մϴ�");
				
			}
			else if(INT >= 8 || STR <= 5 && DEX <= 5 && INT >= 8 && LUCK <= 5) {
				
				System.out.println(name + "�� �����縦 ��õ�մϴ�");
				
			}
			else if(LUCK >= 8 || STR <= 5 && DEX <= 5 && INT <= 5 && LUCK >= 8) {
				
				System.out.println(name + "�� ������ ��õ�մϴ�");
				
			}
			else if(STR >= 6 && DEX >= 6 && INT >= 6 && LUCK >= 6) {
				
				System.out.println(name + "�� �뷱���� ���� ��� ĳ���͸� ��õ�մϴ�");
				
			}
			else{
				
				System.out.println(name + "�� ĳ���� ��õ�մϴ�");
				
			}
		
		}
		else {
			
			System.out.println("ĳ���͸� ������ �ּ���");
			
		}
	}//public void  character_Jobs
	
	public void character_HP_Show() {
		
		System.out.println("���� HP : " + HP);
		
	}//public void character_HP_Show()
	
	public void buy_potion() {
		if(haveMoney >= 50) {
			System.out.println("50���� ������ ������ ���� �� ����մϴ�");
			HP = HP + 100;
			haveMoney -= 50;
		}
		else {
			System.out.println("���� �����մϴ�");
		}
		
	}//public void buy_potion()
	
	public void get_Job() {
		
		Scanner sc = new Scanner(System.in);
		System.out.println("���Ͻô� ������ �������ּ��� 1:���� 2:�ü� 3:������ 4:����");
		int Job = sc.nextInt();
		
		if(Job == 1) {
			if(C_Job == "����") {
				System.out.println("����� �����մϴ�");
				C_Job = "����";
				System.out.println("�� +2");
				STR += 2;
			}
			else {
				System.out.println("�̹� ������ ������ �ֽ��ϴ�");
			}
		}
		else if(Job == 2) {
			if(C_Job == "����") {
				System.out.println("�ü��� �����մϴ�");
				C_Job = "�ü�";
				System.out.println("��ø +2");
				DEX += 2;
			}
			else {
				System.out.println("�̹� ������ ������ �ֽ��ϴ�");
			}
		}
		else if(Job == 3) {
			if(C_Job == "����") {
				System.out.println("������� �����մϴ�");
				C_Job = "������";
				System.out.println("���� +2");
				INT += 2;
			}
			else {
				System.out.println("�̹� ������ ������ �ֽ��ϴ�");
			}
		}
		else if(Job == 4) {
			if(C_Job == "����") {
				System.out.println("�������� �����մϴ�");
				C_Job = "����";
				System.out.println("��� +2");
				LUCK += 2;
			}
			else {
				System.out.println("�̹� ������ ������ �ֽ��ϴ�");
			}
		} 
		
	}//public void get_Job()
	
}//public class make_Character
