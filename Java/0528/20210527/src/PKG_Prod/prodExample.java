package PKG_Prod;

public class prodExample {

	public static void main(String[] args) {
		/*
		double[] salePrices = new double[4];
		Computer[] computers = new Computer[2];
		Toy[] toys = new Toy[2];
		
		computers[0] = new Computer("��ǻ��", 50000, "��Ƽ��");
		salePrices[0] = computers[0].getPrice(0.25);
		
		
		toys[0] = new Toy("�峭��", 10000, "Ʈ��");
		salePrices[1] = toys[0].getPrice(0.5);
		
		computers[1] = new Computer("��ǻ��2", 90000, "��Ƽ��");
		salePrices[2] = computers[1].getPrice(0.25);
		
		toys[2] = new Toy("�峭��2", 10000, "Ʈ��2");
		salePrices[3] = toys[2].getPrice(0.5);
		
		for(int i=0; i<salePrices.length; i++) {
			
			System.out.println(salePrices[i]);
			
		}
		*/
		
		int a = 9;
		long b = a; //����ȯ - ����������ȯ
		
		long c = 19;
		int d = (int)c;//����ȯ - �Ͻ�������ȯ
		
		//Casting
		//1.upCasting
		//2.downCasting
		
		Computer C = new Computer("��ǻ��", 50000, "��Ƽ��");
		C.getPrice(0); //Computer
		C.getPPrice(); // Product
		Toy T = new Toy("�峭��", 1000, "Ʈ��");
		
		
		Product p1 = new Computer("��ǻ��", 50000, "��Ƽ��2");// ����ȯ upCasting
		//Computer C2 = p1; //����ȯ
		//��üŸ��(Class, interface) ����ȯ -> Casting
		
		Product p2 = new Toy("�峭��", 1000, "Ʈ��");
		
		System.out.println(p1.getPrice(0.4));
		System.out.println(p2.getPrice(0.5));
		//���� �Ȱ���
		
		//��ü������ �߿��� �� �ϳ��� ���� ������
		Member m = new Member();
		m.purchase(C); //Product p = C;
		m.purchase(T);
		
	}

}
