package Shop;
import java.util.Scanner;
import Character.make_Character;
import Weapon.Weapon;

public class Shop {
	
	public void buy(make_Character Character) {
		
		Weapon we = new Weapon("�ռҵ�", 2);
		
		Scanner choice = new Scanner(System.in);
		System.out.println("����ð�! ������ ���ٰ�?");
		System.out.println("1.����(50��) 2.��������(100��) 3:�ռҵ�(200��)");
		int what_Buy = choice.nextInt();
		
		if(what_Buy == 1) {
			
			if(Character.get_C_Money() >= 50) {
				
				Character.set_C_Money(-50); 
				Character.recovery_C_HP(100);
				System.out.println("������ �����߽��ϴ�");
				System.out.println("HP +100");
				System.out.println("�� ���ð�!");
			
			}
			else {
				
				System.out.println("���� �����ϳ�");
				
			}
		}
		else if(what_Buy == 2) {
			if(Character.get_C_Money() >= 100) {
				
				Character.set_C_Money(-100); 
				Character.recovery_C_HP(200);
				System.out.println("���������� �����߽��ϴ�");
				System.out.println("HP +200");
				System.out.println("�� ���ð�!");
				
			}
			else {
				
				System.out.println("���� �����ϳ�");
				
			}
		}
		else if(what_Buy == 3) {
			if(Character.get_C_Money() >= 200) {
				
				Character.set_C_Money(-200);
				Character.get_Sword(we.WeaponName(), we.WeaponPower());
				System.out.println("�ռҵ带 �����߽��ϴ�");
				System.out.println("�� ���ð�!");
				
			}
			else {
				
				System.out.println("���� �����ϳ�");
				
			}
		}
	}
}
