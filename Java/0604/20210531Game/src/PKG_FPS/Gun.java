package PKG_FPS;

public abstract class Gun {
	private String G_Name;
	private int G_Damege;
	private int G_Ammo;
	private int CanShotNum;
	
	public Gun(String G_Name, int G_Damege, int G_Ammo, int CanShotNum) {
		
		this.G_Name = G_Name;
		this.G_Damege = G_Damege;
		this.G_Ammo = G_Ammo;
		this.CanShotNum = CanShotNum;
		
	}
	
	public String getG_Name() {
		return this.G_Name;
	}
	public int getG_Damege() {
		return this.G_Damege;
	}
	public int getG_Ammo() {
		return this.G_Ammo;
	}
	public int getCanShotNum() {
		return this.CanShotNum;
	}
	
	public abstract void shot();
	
	public abstract void reload(); 
	
}
