package testJava;

public class main_Place {

	public static void main(String[] args) {
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

	}

}
