package Ground;
import Monster.Monster;
import Wizard.*;

public class Ground {
	public static void main(String[] args) {
	
		Character1 c1 = new Character1("간달프", 50);
		
		Magic energyBolt = new Magic("에너지볼트", 10, 5);
		Fire FireBolt = new Fire("파이어볼트", 20, 10);
		Ice iceBolt = new Ice("아이스볼트", 20, 10);
		Electricity Lightning = new Electricity("라이트닝", 20, 10);
		
		Monster Orc = new Monster("오크", 20);
		
		c1.getMagicSpell(energyBolt);
		
		c1.useSpell(Orc);
		
		c1.getMagicSpell(FireBolt);
		
		c1.useSpell(Orc);
		
		c1.getMagicSpell(iceBolt);
		
		c1.useSpell(Orc);
		
		c1.getMagicSpell(Lightning);
		
		c1.useSpell(Orc);
		
		String a = "2";
		
		
		int a1 = 1;
		a1 <<= 2;
		
		
		
		System.out.println(a1);
	
		
	}
	
}
