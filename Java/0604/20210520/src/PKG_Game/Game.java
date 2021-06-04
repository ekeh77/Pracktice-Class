package PKG_Game;
import PKG_Condition.*;//모든 클래스 가지고오기

public class Game {

	public static void main(String[] args) {
		
		/*
		//1. 계산기를 던져요
		Calculator cal1 = new Calculator();
		cal1.calThrows();
		Calculator cal2 = new Calculator();
		cal2.calThrows();
		Calculator cal3 = new Calculator();
		cal3.resultPrint("우훗");
		int aa = cal3.getPlus(13, 12);
		cal3.resultPrint(Integer.toString(aa));
		
		Cleaner cl = new Cleaner();
		cl.clearPrint("청소기1");
	
		
		//반복문
		int b = 0;
		for(int a = 1; a <= 100; a++) {
			
			if(a % 2 == 1) {
				
				b = b + a;
				
			}
			
			
		}
		
		System.out.println(b);
		
		
		//do while
		b = 0;
		int i = 1;
		do {
			
			b = b + i;
			
			i += 1;
		}
		while(i <= 100)
			;
		
		System.out.println(b);
		
		//while
		b = 0;
		int j = 0;
		while(true) {
			
			if(j == 100) {
				break;
			}
			
			j += 1;
			b = b + j;
		}
		
		System.out.println(b);
		
	 //조건문
	//switch case 
	//조건이 명확할 때
		int num = 1;
		String strOut = "초기값";
		switch(num) {
		
		case 1 : strOut = "1입니다";
		break;
		
		case 2 : strOut = "2입니다";
		break;
		
		case 3 : strOut = "3입니다";
		break;
		
		default : strOut = "default";
		
		}
		
		System.out.println(strOut);
		
		String str = "철수";
		switch(str) {
		
		case "철수" : str = "철수입니다";
		break;
		
		case "순희" : str = "순희입니다";
		break;
		
		default : System.out.println("asdadasdad");
		
		}
		
		System.out.println(str);
		int result = 0;
		for(int ii = 2; ii <= 9; ii++) {
			
			for(int jj = 1; jj <= 9; jj++) {
				
				result = ii * jj;
				System.out.println(ii + " * " + jj + " = " + result);
				
			}
		}
		
		//배열
		//datatype 선언
		
		int a1 = 1;
		int a2 = 2;
		int a3 = 3;
		int a4 = 4;
		int a5 = 5;
		int a6 = 6;
		
		int b1 = a1;
		a1 = 13;
		
		System.out.println(b1);
		System.out.println(a1);//call by value
		
		String str1 = "홍길동";
		String str2 = "김갑순";
		
		String str3 = str1;
		str3 = "aaa";
		
		System.out.println(str1);
		System.out.println(str3);//call by value
		
		int[] arr = new int[6]; // 6개의 배열을 가지는 배열
		arr[0] = 1;
		arr[1] = 2;
		arr[2] = 3;
		arr[3] = 4;
		arr[4] = 5;
		arr[5] = 6;
		
		int[] arr2 = new int[6];
		arr2[0] = arr[0] ;
		arr2[0] = 100;
		
		System.out.println(arr[0]);
		System.out.println(arr2[0]);
		
		int[] arr3 = arr;
		arr3[0] = 1234;
		
		System.out.println(arr[0]);
		System.out.println(arr3[0]);//call by reference
		
		String[] strs = new String[3];
		strs[0] = "1123";
		strs[0] = "홍길동";
		strs[0] = "김남길";
		*/
		
		String st1 = "홍길동"; //원래는 call by reference를 가지는게 맞다
		String st2 = "홍길동";//그렇지만 String은 call by value를 가진다
		
		String st3 = st1;
		
		st3 = "전우치";
		
		System.out.println(st1);
		System.out.println(st3);
		//java에서 String을 할당값으로 선언을하고 받으면 마치 call by value처럼 움직인다
		
		String st4 = new String("홍길동");
		String st5 = new String("홍길동");
		String st6 = st4;
		
		st6 = "전우치";
		
		System.out.println(st6);
		System.out.println(st4);
		
		if(st1 == st2) {
			System.out.println("같음");
		}
		
		if(st4 == st5) {
			System.out.println("같음");
		}//object type이라 같지 않음 다른 객체
		
		if(st4.equals(st5))//두 객체가 가지고 있는 실제값이 같냐 
		{
			System.out.println("같음");
		}
		
		int aa = 4;
		long bb = 4L;
		double cc = 4.00;
		float dd = 4.00f;
		//call by value 다 같다
		
		if(aa == bb) {
			
			System.out.println("같음");
			
		}
		if(cc == bb) {
			
			System.out.println("같음");
			
		}
		
		//call by value
		//byte, short, char, int, long
		//float, double
		//String str = "";
		
		//call by reference
		//String str = new String("홍길동");
		
		//배열
		String[] strs = new String[5];
		
		strs[0] = "이길동0";
		strs[1] = "이길동1";
		strs[2] = "이길동2";
		
		String[] strs2 = new String[3];
		strs2[0] = "이길동0";
		strs2[1] = "이길동1";
		strs2[2] = "이길동2";
		
		if(strs == strs2) {
			System.out.println("배열이 같다");
		}
		else {
			System.out.println("배열이 다르다");
		}
		
		int aaa = 145;
		long[] ll = new long[3];
		ll[0] = aaa;
		ll[1] = 123456789;
		ll[2] = 21000000000L;
		
		
		byte[] bytes = new byte[30];
		int number = 1;
		for(byte iii = 0; iii<bytes.length; iii++) {
			bytes[iii] = (byte)number;
			number += 1;
			
			System.out.println(bytes[iii]);
		}
		
		long ln = 2100000000;
		int[] ints = new int[3];
		ints[0] = (int)ln;
		ints[1] = (int)ln;
		ints[2] = (int)ln;
				
		
	}
	
}
 