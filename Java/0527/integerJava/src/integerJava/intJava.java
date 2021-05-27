package integerJava;

public class intJava {
	
	//프로그램 진입점
	public static void main(String[] args) {
		
		byte a = 5;
		byte b = 8;
		
		//byte c = a + b;
		
		int c = a + b; 
		
		//convert, cast -- 형변환
		
		//정수형이긴 하지만 연산에는 못씀
		short s1 = 24;
		short s2 = 32;
		
		//short s3 = a + b;
		
		//정수형 int - 4byte
		
		int i1 = 3333;
		int i2 = 5555;
		
		int i0 = a + b;
		int i3 = s1 + s2;
		int i4 = i1 + i2;
		
		//System.out.println(i0);
		
		long L = 1234567891;
		long L1 = 1000000000;
		long L2 = 1000000000;
		
		long L3 = L1 * L2;
		
		System.out.println(L3);
		
		
		//long L4 = 3000000000; 에러가 발생 계산외에 할당할 때 20억이상인 경우 int로 인식
		//정말 long 타입으로 사용하기 위해 long L4 = 3000000000L; 이라고 써야함
		
		long L4 = 3000000000L;
		long L5 = 2200000000L;
		
		long L6 = L4 * L5;
		
		System.out.println(L6);
		
		//2진수
		int aa = 0b1101;
		int bb = 0b1001;
		
		int cc = aa + bb;
		
		System.out.println(cc);
		
		//8진수
		int aaa = 023;
		int bbb = 012;
		
		int ccc = aaa + bbb;
				
		System.out.println(ccc);
		
		//16진수
		int d = 0xAAA;
		int e = 0x1A2B;
		
		int f = d + e;
		
		System.out.println(f);
		
		int ff = aa + e;
		
		System.out.println(ff);
		
		
		testClass tc = new testClass(); //object의 instance화
		int result = tc.getPlus(8,5);
		
		System.out.println(result);
		
		int result2 = tc.getMinus(12, 11);
		
		System.out.println(result2);
		
		tc.setTest();
		
		//20210518 - char
		//byte, short, int, long --정수형
		//float, double --실수형
		
		//정수형 - 자바에서 ''는 문자가 아니다 (""가 문자)
		char ch = 'A' + 1; // 'A'는 아스키코드값으로 65이다
		
		System.out.println(ch);
		
		//문자형
		String str = "가나다라마바사";//자바의 클래스중의 하나
		String str2 = "바아장민움";
		String str3 = str + str2;
		
		System.out.println(str3);
		
		//int와 String을 합치면?
		int abc = 55;
		String str4 = "66";
		
		String re = abc + str4;
		
		System.out.println(re);//자바에서만 자동으로 숫자를 문자로 변환시켜서 문자로 더함
		
		//형변환
		// 묵시적형변환 - 자동으로 변환
		// 암시적형변환 - 표현으로 변환
		
		int z1 = 2000000000;//4바이트
		int z2 = 2000000000;
		//21억을 넘기 때문에 int타입으로 하면 이상한 값이 나옴
		
		long z3 = z1 + z2;//8바이트
		
		//작은 바이트에서 큰 바이트로 묵시적형변환
		//숫자타입에서 묵시적으로 형변환이 되려면 반드시 더 큰 공간을 가지고 있어야 가능
		//byte < short < int < long
		
		System.out.println(z3);
		
		//char를 숫자로 바꿔야해요
		char cha = 'b';
		int icha = (int)cha;
		
		System.out.println(icha);
		
		//정수형으로 쓰겠다
		double n = 1414.2;
		
		int n2 = (int)n; //암시적형변환
		
		System.out.println(n2);
		
		//실수의 변환
		float fffff = 124.1111f;
		
		long lll = (long)fffff;
		
		System.out.println(lll);
		
		int n3 = 135;
		
		//둘다 묵시적 변환
		float n4 = (float)(n3 + 0.4);
		float n5 = n3 + 0.4f;
		
		
		//암시적형변환 - 강제적으로 형변환
		
		//String -> 숫자타입으로 바뀌는 형태
		String st1 = "5";
		String st2 = "7";
		
		byte by1 = Byte.parseByte(st1);
		byte by2 = Byte.parseByte(st2);
		
		String st3 = st1 + st2;
		int by3 = by1 + by2;
		
		System.out.println("문자열합 : " + st3);
		System.out.println("byte합 : " + by3);
		
		int nn1 = Integer.parseInt(st1);
		int nn2 = Integer.parseInt(st2);
		int nn3 = nn1 + nn2;
		
		System.out.println("int합 : " + nn3);
		
		String st4 = "5414.124";
		double dd1 = Double.parseDouble(st4);
		double dd2 = dd1 * dd1;
		
		System.out.println("double곱 : " + dd2);
		
		//boolean true or false
		
		boolean isAct = true;
		
		if(isAct) {
			
			System.out.println("true");
			
		}
		else {
			
			System.out.println("false");
			
		}
		
		//boolean형 변환
		
		String bStr = "true";
		
		boolean isStr = Boolean.parseBoolean(bStr);
		
		
		//정리
		//정수형
		//byte, short, int(+-2100000000), long, char
		
		//실수형
		//float, double
		
		//2진수 0b
		int p = 0b110;
		//8진수 0
		int p2 = 02414114710;
		//16진수 0x
		int p3 = 0x21441;
		
		//형변환 - 묵시적 형변환
		int p4 = 1545;
		int p5 = 1021444111;
		
		int p6 = p4 * p5; // 컴파일 또는 런타임에서 에러가 나지 않고 결과값이 엉망진창으로 나온다.
		long p7 = (long)p4 * (long)p5;
		
		System.out.println(p7);
		
		//암시적형변환 String -> 숫자(정수, 실수)로 변환
		String str10 = "1111";
		int nnn333 = Integer.parseInt(str10);
		
		System.out.println(nnn333);
		
	}

}
