package PKG_FPS;

public class BoomGun extends Gun{

	public BoomGun(String G_Name, int G_Damege, int G_Ammo, int CanShotNum) {
		super(G_Name, G_Damege, G_Ammo, CanShotNum);
	}
	
	public void shot() {
		System.out.println("Æã");
	}
	
	public void reload() {
		System.out.println("ÀçÀåÀü~~");
	}
	
	public void boomShot() {
		System.out.println("ÆøÅº¹ß»ç");
	}
	
}
