package PKG_FPS;

public class BadGun extends Gun{

	public BadGun(String G_Name, int G_Damege, int G_Ammo, int CanShotNum) {
		super(G_Name, G_Damege, G_Ammo, CanShotNum);
	}
	
	public void shot() {
		System.out.println("빠앙");
	}
	
	public void reload() {
		System.out.println("재장~전");
	}
	
}
