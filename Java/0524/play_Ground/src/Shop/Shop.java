package Shop;
import java.util.Scanner;
import Character.make_Character;

public class Shop {
	
	public void buy_Potion(make_Character Character) {
		
		Scanner choice = new Scanner(System.in);
		System.out.println("����ð�! ������ ���ٰ�?");
		System.out.println("1.����(50��) 2.��������(100��)");
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
		
	}
}
