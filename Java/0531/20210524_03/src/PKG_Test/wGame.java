package PKG_Test;

public class wGame {

	public static void main(String[] args) {
		
		Charactor c = new Charactor("������");
		Charactor c2 = new Charactor("�߿���");
		
		Weapon w1 = new Weapon("��");
		Weapon w2 = new Weapon("����");
		Weapon w3 = new Weapon("�����");
		
		
		c.getWeapon(w1);
		
		c.Shot();
		
		c.getWeapon(w2);
		
		c.Shot();
		
		c.getWeapon(w3);
		
		c.Shot();
		c.Shot();
		
		
		c2.getWeapon(w3);
		
		c2.Shot();
		
		String wName = c2.getWeaponName();// ���� ����
		
		System.out.println(wName);
		
	}

}
