package PKG_Game;
import PKG_Condition.*;//��� Ŭ���� ���������

public class Game {

	public static void main(String[] args) {
		
		/*
		//1. ���⸦ ������
		Calculator cal1 = new Calculator();
		cal1.calThrows();
		Calculator cal2 = new Calculator();
		cal2.calThrows();
		Calculator cal3 = new Calculator();
		cal3.resultPrint("����");
		int aa = cal3.getPlus(13, 12);
		cal3.resultPrint(Integer.toString(aa));
		
		Cleaner cl = new Cleaner();
		cl.clearPrint("û�ұ�1");
	
		
		//�ݺ���
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
		
	 //���ǹ�
	//switch case 
	//������ ��Ȯ�� ��
		int num = 1;
		String strOut = "�ʱⰪ";
		switch(num) {
		
		case 1 : strOut = "1�Դϴ�";
		break;
		
		case 2 : strOut = "2�Դϴ�";
		break;
		
		case 3 : strOut = "3�Դϴ�";
		break;
		
		default : strOut = "default";
		
		}
		
		System.out.println(strOut);
		
		String str = "ö��";
		switch(str) {
		
		case "ö��" : str = "ö���Դϴ�";
		break;
		
		case "����" : str = "�����Դϴ�";
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
		
		//�迭
		//datatype ����
		
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
		
		String str1 = "ȫ�浿";
		String str2 = "�谩��";
		
		String str3 = str1;
		str3 = "aaa";
		
		System.out.println(str1);
		System.out.println(str3);//call by value
		
		int[] arr = new int[6]; // 6���� �迭�� ������ �迭
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
		strs[0] = "ȫ�浿";
		strs[0] = "�賲��";
		*/
		
		String st1 = "ȫ�浿"; //������ call by reference�� �����°� �´�
		String st2 = "ȫ�浿";//�׷����� String�� call by value�� ������
		
		String st3 = st1;
		
		st3 = "����ġ";
		
		System.out.println(st1);
		System.out.println(st3);
		//java���� String�� �Ҵ簪���� �������ϰ� ������ ��ġ call by valueó�� �����δ�
		
		String st4 = new String("ȫ�浿");
		String st5 = new String("ȫ�浿");
		String st6 = st4;
		
		st6 = "����ġ";
		
		System.out.println(st6);
		System.out.println(st4);
		
		if(st1 == st2) {
			System.out.println("����");
		}
		
		if(st4 == st5) {
			System.out.println("����");
		}//object type�̶� ���� ���� �ٸ� ��ü
		
		if(st4.equals(st5))//�� ��ü�� ������ �ִ� �������� ���� 
		{
			System.out.println("����");
		}
		
		int aa = 4;
		long bb = 4L;
		double cc = 4.00;
		float dd = 4.00f;
		//call by value �� ����
		
		if(aa == bb) {
			
			System.out.println("����");
			
		}
		if(cc == bb) {
			
			System.out.println("����");
			
		}
		
		//call by value
		//byte, short, char, int, long
		//float, double
		//String str = "";
		
		//call by reference
		//String str = new String("ȫ�浿");
		
		//�迭
		String[] strs = new String[5];
		
		strs[0] = "�̱浿0";
		strs[1] = "�̱浿1";
		strs[2] = "�̱浿2";
		
		String[] strs2 = new String[3];
		strs2[0] = "�̱浿0";
		strs2[1] = "�̱浿1";
		strs2[2] = "�̱浿2";
		
		if(strs == strs2) {
			System.out.println("�迭�� ����");
		}
		else {
			System.out.println("�迭�� �ٸ���");
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
 