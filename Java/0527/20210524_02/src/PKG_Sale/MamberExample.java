package PKG_Sale;

public class MamberExample {

	public static void main(String[] args) {
		
		//1.��ǰ�� �ϳ� �����
		Product prod1 = new Product("P001", "�����", 500);
		//1.1 -- ��ǰ���̵�, ��ǰ�̸�, ��ǰ����
		
		//2.��ǰ�� �ϳ� �� �����
		Product prod2 = new Product("P002", "������", 1000);
		Product prod3 = new Product("P003", "��Ǫ", 10000);
		
		//3.ȫ�浿�̶�� ȸ���� �����
		Member mem1 = new Member("M001", "ȫ�浿", "M");
		
		mem1.purchase(prod1, 5);
		mem1.purchase(prod2, 5);
		mem1.purchase(prod3, 5);
		
		prod2.setPrice(800);
		
		mem1.purchase(prod2, 5);
		mem1.totalPrice();
		mem1.totalPrice("������");
	}

}
