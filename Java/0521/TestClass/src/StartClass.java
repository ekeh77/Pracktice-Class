import PKG_Exam.*;
import PKG_Sell.Member;

public class StartClass {

	public static void main(String[] args) {
		
		/*
		//������ ���α׷���
		
		String[] strNames = new String[3];
		strNames[0] = "ȫ�浿";
		strNames[1] = "�谩��";
		strNames[2] = "ȫ���";
		
		int[][] stdScores = new int[3][4];
		
		//ȫ�浿 ����
		stdScores [0][0] = 80;
		stdScores [0][1] = 80;
		stdScores [0][2] = 80;
		stdScores [0][3] = 80;
		
		//�谩�� ����
		stdScores [1][0] = 70;
		stdScores [1][1] = 70;
		stdScores [1][2] = 70;
		stdScores [1][3] = 70;
		
		//ȫ��� ����
		stdScores [2][0] = 75;
		stdScores [2][1] = 75;
		stdScores [2][2] = 75;
		stdScores [2][3] = 75;
		
		int avg = 0;
		int total = 0;
		
		for(int i=0; i<3; i++) {
			
			for(int j=0; j<4; j++) {
				
				total += stdScores[i][j];
				
			}
			
			avg = total / 4;
			
			System.out.println(strNames[i] + " : " + "����:" + total + ", ��� : " + avg);
			
			avg = 0;
			total = 0;
			
		}
	
		
		//��ü�������
		//��� ���α׷��� �߽��� ��ü���� �ִ�
		//��ü -> �л���, ����
		
		Student std1 = new Student();
		std1.name = "ȫ�浿";
		std1.exam("����", 80);
		std1.exam("����", 70);
		std1.exam("����", 90);
		std1.exam("����", 60);
		
		std1.getTotal();
		std1.getAvg();
		
		Student std2 = new Student();
		std2.name = "�谩��";
		
		std2.exam("����", 75);
		std2.exam("����", 90);
		
		std2.getTotal();
		std2.getAvg();
		
	}
	*/

	
	/*ȸ���� ��ǰ�� ������ Ŭ����*/
	Member mem = new Member("M001", "ȫ�浿");
	mem.memBuy("�����", 500);
	mem.memBuy("�����", 500);
	mem.memBuy("�����", 500);
	mem.memBuy("�����", 500);
	mem.memBuy("�����", 500);
	
	/*
	int totalPrice = mem.getTotalPrice();
	System.out.println("�����Ѱ��� : " + totalPrice);
	*/
	
	/*
	Member mem2 = new Member();
	mem2.memID = "M001";
	mem2.memName = "ȫ�浿";
	*/
	}
}
