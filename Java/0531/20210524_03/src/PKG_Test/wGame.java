package PKG_Test;

public class wGame {

	public static void main(String[] args) {
		
		Charactor c = new Charactor("무법자");
		Charactor c2 = new Charactor("야옹이");
		
		Weapon w1 = new Weapon("총");
		Weapon w2 = new Weapon("대포");
		Weapon w3 = new Weapon("기관총");
		
		
		c.getWeapon(w1);
		
		c.Shot();
		
		c.getWeapon(w2);
		
		c.Shot();
		
		c.getWeapon(w3);
		
		c.Shot();
		c.Shot();
		
		
		c2.getWeapon(w3);
		
		c2.Shot();
		
		String wName = c2.getWeaponName();// 값이 없음
		
		System.out.println(wName);
		
	}

}
