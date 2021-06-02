package Shop;
import java.util.Scanner;
import Character.make_Character;
import Weapon.Weapon;

public class Shop {
	
	public void buy(make_Character Character) {
		
		Weapon we = new Weapon("롱소드", 2);
		
		Scanner choice = new Scanner(System.in);
		System.out.println("어서오시게! 무엇을 살텐가?");
		System.out.println("1.포션(50원) 2.하이포션(100원) 3:롱소드(200원)");
		int what_Buy = choice.nextInt();
		
		if(what_Buy == 1) {
			
			if(Character.get_C_Money() >= 50) {
				
				Character.set_C_Money(-50); 
				Character.recovery_C_HP(100);
				System.out.println("포션을 구매했습니다");
				System.out.println("HP +100");
				System.out.println("또 오시게!");
			
			}
			else {
				
				System.out.println("돈이 부족하네");
				
			}
		}
		else if(what_Buy == 2) {
			if(Character.get_C_Money() >= 100) {
				
				Character.set_C_Money(-100); 
				Character.recovery_C_HP(200);
				System.out.println("하이포션을 구매했습니다");
				System.out.println("HP +200");
				System.out.println("또 오시게!");
				
			}
			else {
				
				System.out.println("돈이 부족하네");
				
			}
		}
		else if(what_Buy == 3) {
			if(Character.get_C_Money() >= 200) {
				
				Character.set_C_Money(-200);
				Character.get_Sword(we.WeaponName(), we.WeaponPower());
				System.out.println("롱소드를 구매했습니다");
				System.out.println("또 오시게!");
				
			}
			else {
				
				System.out.println("돈이 부족하네");
				
			}
		}
	}
}
