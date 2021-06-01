package testJava;

import RPG_Weapon.*;

public class main_Place {

	public static void main(String[] args) {
		/*
		practice weapon = new practice();
		weapon.makeWeapon("우지", 10, 1);

		
		practice weapon2 = new practice();
		weapon2.makeWeapon("샷건", 2, 5);
		
		Monster Orc = new Monster("오크", 60, 5);
		
		Charactor Char = new Charactor("사람1");
		
		Char.getWeapon(weapon2);
		Char.shot(Orc);
		Char.shot(Orc);
		Char.reloadWeapon();
		Char.shot(Orc);
		Char.shot(Orc);
		Char.reloadWeapon();
		Char.shot(Orc);
		Char.shot(Orc);
		Char.reloadWeapon();
		Char.shot(Orc);
		Char.shot(Orc);
		Char.reloadWeapon();
		Char.shot(Orc);
		Char.shot(Orc);
		Char.reloadWeapon();
		Char.shot(Orc);
		Char.shot(Orc);
	*/
		
		Member m = new Member();
		Sword s = new Sword("롱소드", 5, 1);
		Bow b = new Bow("롱보우", 10, 2);
		Magic_Wand w = new Magic_Wand("완드", 5, 1);
		
		m.getWeapon(s);
		m.getWInfo();
		m.userUse(s);
		
		
		m.supplyArrow(b);
		m.getWeapon(b);
		m.getWInfo();
		for(int i = 0; i < 4; i++) {
			m.supplyArrow(b);
			m.userUse(b);
		}
		m.userUse(b);
		m.getWeapon(w);
		m.getWInfo();
		m.userUse(w);
		
		
	}

}
