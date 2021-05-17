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
		
	}

}
