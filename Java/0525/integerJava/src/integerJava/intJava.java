package integerJava;

public class intJava {
	
	//���α׷� ������
	public static void main(String[] args) {
		
		byte a = 5;
		byte b = 8;
		
		//byte c = a + b;
		
		int c = a + b; 
		
		//convert, cast -- ����ȯ
		
		//�������̱� ������ ���꿡�� ����
		short s1 = 24;
		short s2 = 32;
		
		//short s3 = a + b;
		
		//������ int - 4byte
		
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
		
		
		//long L4 = 3000000000; ������ �߻� ���ܿ� �Ҵ��� �� 20���̻��� ��� int�� �ν�
		//���� long Ÿ������ ����ϱ� ���� long L4 = 3000000000L; �̶�� �����
		
		long L4 = 3000000000L;
		long L5 = 2200000000L;
		
		long L6 = L4 * L5;
		
		System.out.println(L6);
		
		//2����
		int aa = 0b1101;
		int bb = 0b1001;
		
		int cc = aa + bb;
		
		System.out.println(cc);
		
		//8����
		int aaa = 023;
		int bbb = 012;
		
		int ccc = aaa + bbb;
				
		System.out.println(ccc);
		
		//16����
		int d = 0xAAA;
		int e = 0x1A2B;
		
		int f = d + e;
		
		System.out.println(f);
		
		int ff = aa + e;
		
		System.out.println(ff);
		
		
		testClass tc = new testClass(); //object�� instanceȭ
		int result = tc.getPlus(8,5);
		
		System.out.println(result);
		
		int result2 = tc.getMinus(12, 11);
		
		System.out.println(result2);
		
		tc.setTest();
		
		//20210518 - char
		//byte, short, int, long --������
		//float, double --�Ǽ���
		
		//������ - �ڹٿ��� ''�� ���ڰ� �ƴϴ� (""�� ����)
		char ch = 'A' + 1; // 'A'�� �ƽ�Ű�ڵ尪���� 65�̴�
		
		System.out.println(ch);
		
		//������
		String str = "�����ٶ󸶹ٻ�";//�ڹ��� Ŭ�������� �ϳ�
		String str2 = "�پ���ο�";
		String str3 = str + str2;
		
		System.out.println(str3);
		
		//int�� String�� ��ġ��?
		int abc = 55;
		String str4 = "66";
		
		String re = abc + str4;
		
		System.out.println(re);//�ڹٿ����� �ڵ����� ���ڸ� ���ڷ� ��ȯ���Ѽ� ���ڷ� ����
		
		//����ȯ
		// ����������ȯ - �ڵ����� ��ȯ
		// �Ͻ�������ȯ - ǥ������ ��ȯ
		
		int z1 = 2000000000;//4����Ʈ
		int z2 = 2000000000;
		//21���� �ѱ� ������ intŸ������ �ϸ� �̻��� ���� ����
		
		long z3 = z1 + z2;//8����Ʈ
		
		//���� ����Ʈ���� ū ����Ʈ�� ����������ȯ
		//����Ÿ�Կ��� ���������� ����ȯ�� �Ƿ��� �ݵ�� �� ū ������ ������ �־�� ����
		//byte < short < int < long
		
		System.out.println(z3);
		
		//char�� ���ڷ� �ٲ���ؿ�
		char cha = 'b';
		int icha = (int)cha;
		
		System.out.println(icha);
		
		//���������� ���ڴ�
		double n = 1414.2;
		
		int n2 = (int)n; //�Ͻ�������ȯ
		
		System.out.println(n2);
		
		//�Ǽ��� ��ȯ
		float fffff = 124.1111f;
		
		long lll = (long)fffff;
		
		System.out.println(lll);
		
		int n3 = 135;
		
		//�Ѵ� ������ ��ȯ
		float n4 = (float)(n3 + 0.4);
		float n5 = n3 + 0.4f;
		
		
		//�Ͻ�������ȯ - ���������� ����ȯ
		
		//String -> ����Ÿ������ �ٲ�� ����
		String st1 = "5";
		String st2 = "7";
		
		byte by1 = Byte.parseByte(st1);
		byte by2 = Byte.parseByte(st2);
		
		String st3 = st1 + st2;
		int by3 = by1 + by2;
		
		System.out.println("���ڿ��� : " + st3);
		System.out.println("byte�� : " + by3);
		
		int nn1 = Integer.parseInt(st1);
		int nn2 = Integer.parseInt(st2);
		int nn3 = nn1 + nn2;
		
		System.out.println("int�� : " + nn3);
		
		String st4 = "5414.124";
		double dd1 = Double.parseDouble(st4);
		double dd2 = dd1 * dd1;
		
		System.out.println("double�� : " + dd2);
		
		//boolean true or false
		
		boolean isAct = true;
		
		if(isAct) {
			
			System.out.println("true");
			
		}
		else {
			
			System.out.println("false");
			
		}
		
		//boolean�� ��ȯ
		
		String bStr = "true";
		
		boolean isStr = Boolean.parseBoolean(bStr);
		
		
		//����
		//������
		//byte, short, int(+-2100000000), long, char
		
		//�Ǽ���
		//float, double
		
		//2���� 0b
		int p = 0b110;
		//8���� 0
		int p2 = 02414114710;
		//16���� 0x
		int p3 = 0x21441;
		
		//����ȯ - ������ ����ȯ
		int p4 = 1545;
		int p5 = 1021444111;
		
		int p6 = p4 * p5; // ������ �Ǵ� ��Ÿ�ӿ��� ������ ���� �ʰ� ������� ������â���� ���´�.
		long p7 = (long)p4 * (long)p5;
		
		System.out.println(p7);
		
		//�Ͻ�������ȯ String -> ����(����, �Ǽ�)�� ��ȯ
		String str10 = "1111";
		int nnn333 = Integer.parseInt(str10);
		
		System.out.println(nnn333);
		
	}

}
