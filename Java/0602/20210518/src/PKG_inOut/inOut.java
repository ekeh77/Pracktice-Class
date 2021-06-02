package PKG_inOut;

public class inOut {
	
	public static void main(String[] args) throws Exception {
		/*
		System.out.print("aaaa");//개행없음
		System.out.println("bbbb");//개행있음
		
		System.out.printf("%08d", 241);//데이터베이스의 LPAD와 비슷한 명령어
		
		int a = System.in.read();//예외처리를 반드시 해야함
		//내가 입력하면 아스키코드값을 반환
		
		int b = a + 12;
		
		System.out.println(b);
		
		
		//연산자
		
		int a = 77;
		int b = 13;
		
		int c = a % b;//a에서 b을 나누고 나오는 나머지값
		
		System.out.println(c);
		
		
		int a = 1;
		
		a += 1; // a = a + 1;
		
		System.out.println(a); //2
		
		a -= 1; // a = a - 1;
		
		System.out.println(a); //1
		
		a *= 3; // a = a * 3;
		
		System.out.println(a); //3
		
		a /= 3; // a = a / 3;
		
		System.out.println(a); //1
		
		//증감
		
		a++; // a = a + 1; 할당을 하고 계산 후행연산자
		++a; // a = a + 1; 계산을 하고 할당 선행연산자
		
		System.out.println(a);
		
		int b = a++;
		//a값을 먼저 b에게 할당하고 a = a + 1 실행
		
		System.out.println(a);
		System.out.println(b);
		
		int c = ++a;
		//a = a + 1을 먼저 실행하고 그 값을 할당
		
		System.out.println(a);
		System.out.println(c);
		
		//삼항연산자
		String name = ( a > c) ?  "철수" : "순희";
		//괄호안의 조건이 참이면 앞을 거짓이면 뒤를 실행
		String strGender = "M";
		int num = (strGender == "M") ? 123 : (strGender == "F") ? 456 : 678;
		
		
		System.out.println(name);
		System.out.println(num);
		*/
		
		
		//Condition 클래스를 사용한다
		Condition con = new Condition();
		
		con.conTest();
		con.conTest2();
				
	}
}
