package PKG_FPS;

public class main_Play {

	public static void main(String[] args) {
		GoodGun gun1 = new GoodGun("ÁÁÀºÃÑ", 10, 50, 10);
		BadGun gun2 = new BadGun("³ª»ÛÃÑ", 10, 50, 10);
		BoomGun gun3 = new BoomGun("ÆøÅºÃÑ", 10, 50, 10);
		
		Character c1 = new Character();
		c1.getWeapon(gun1);
		c1.getWeapon(gun2);
		c1.getWeapon(gun3);
		
		c1.getWeaponName();
		c1.shotGun();
		c1.chgGun(0);
		c1.shotGun();
		c1.chgGun(1);
		c1.shotGun();
		c1.chgGun(2);
		c1.shotBoom();
		c1.chgGun(1);
		c1.shotBoom();

	}

}
