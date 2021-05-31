package PKG_FPS;

public class GoodGun extends Gun{
	
	public GoodGun(String G_Name, int G_Damege, int G_Ammo, int CanShotNum) {
		super(G_Name, G_Damege, G_Ammo, CanShotNum);
	}
	
	public void shot() {
		System.out.println("ªß");
	}
	
	public void reload() {
		System.out.println("¿Á¿Â¿¸");
	}
}
