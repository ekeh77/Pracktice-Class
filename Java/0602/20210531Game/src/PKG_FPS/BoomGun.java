package PKG_FPS;

public class BoomGun extends Gun{

	public BoomGun(String G_Name, int G_Damege, int G_Ammo, int CanShotNum) {
		super(G_Name, G_Damege, G_Ammo, CanShotNum);
	}
	
	public void shot() {
		System.out.println("��");
	}
	
	public void reload() {
		System.out.println("������~~");
	}
	
	public void boomShot() {
		System.out.println("��ź�߻�");
	}
	
}
