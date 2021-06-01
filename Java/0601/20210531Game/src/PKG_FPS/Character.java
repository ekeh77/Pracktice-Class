package PKG_FPS;

import java.util.ArrayList;

public class Character {
	private ArrayList<Gun> GunInventory;
	private Gun gun;
	public Character() {
		this.GunInventory = new ArrayList<Gun>();
	}
	
	public void getWeapon(Gun gun) {
		GunInventory.add(gun);
		this.gun = gun;
	}
	
	public void getWeaponName() {
		
		for(int i = 0; i<GunInventory.size(); i++) {
			
			String G_Name = GunInventory.get(i).getG_Name();
			System.out.println(G_Name);
			
		}
		
	}
	
	public void chgGun(int num) {
		this.gun = GunInventory.get(num);
	}
	
	public void shotGun() {
		this.gun.shot();
	}
	
	public void shotBoom() {
		if(this.gun instanceof BoomGun) {
			((BoomGun)this.gun).boomShot();
		}
		else {
			System.out.println("ÆøÅºÃÑÀÌ ¾Æ´Õ´Ï´Ù");
		}
		
	}
}
