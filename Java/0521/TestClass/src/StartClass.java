import PKG_Exam.*;
import PKG_Sell.Member;

public class StartClass {

	public static void main(String[] args) {
		
		/*
		//절차적 프로그래밍
		
		String[] strNames = new String[3];
		strNames[0] = "홍길동";
		strNames[1] = "김갑순";
		strNames[2] = "홍길순";
		
		int[][] stdScores = new int[3][4];
		
		//홍길동 점수
		stdScores [0][0] = 80;
		stdScores [0][1] = 80;
		stdScores [0][2] = 80;
		stdScores [0][3] = 80;
		
		//김갑순 점수
		stdScores [1][0] = 70;
		stdScores [1][1] = 70;
		stdScores [1][2] = 70;
		stdScores [1][3] = 70;
		
		//홍길순 점수
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
			
			System.out.println(strNames[i] + " : " + "총점:" + total + ", 평균 : " + avg);
			
			avg = 0;
			total = 0;
			
		}
	
		
		//객체지향관점
		//모든 프로그램의 중심은 객체에게 있다
		//객체 -> 학생과, 과목
		
		Student std1 = new Student();
		std1.name = "홍길동";
		std1.exam("국어", 80);
		std1.exam("수학", 70);
		std1.exam("영어", 90);
		std1.exam("과학", 60);
		
		std1.getTotal();
		std1.getAvg();
		
		Student std2 = new Student();
		std2.name = "김갑순";
		
		std2.exam("국어", 75);
		std2.exam("수학", 90);
		
		std2.getTotal();
		std2.getAvg();
		
	}
	*/

	
	/*회원이 상품을 구매한 클래스*/
	Member mem = new Member("M001", "홍길동");
	mem.memBuy("새우깡", 500);
	mem.memBuy("새우깡", 500);
	mem.memBuy("새우깡", 500);
	mem.memBuy("새우깡", 500);
	mem.memBuy("새우깡", 500);
	
	/*
	int totalPrice = mem.getTotalPrice();
	System.out.println("구매총가격 : " + totalPrice);
	*/
	
	/*
	Member mem2 = new Member();
	mem2.memID = "M001";
	mem2.memName = "홍길동";
	*/
	}
}
