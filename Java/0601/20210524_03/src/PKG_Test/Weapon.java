package PKG_Test;

public class Weapon {

		private String wName;
		
		public Weapon(String wName) {
			
			this.wName = wName;
			
		}
		
		
		public void wShot() {
			
			System.out.println(wName + "À» ½ð´Ù");
			
		}
		
		public String getWeaponName() {
			return wName;
		}
		
}
	