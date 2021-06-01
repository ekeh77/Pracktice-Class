package PKG_Magic;

public abstract class Magic {
	private String MName;
	private int useMP;
	private double MDamege;
	
	public Magic(String MName, int useMP, double MDamege) {
		this.MName = MName;
		this.useMP = useMP;
		this.MDamege = MDamege;
	}
	
	public abstract void magicInfo();
	
	public abstract void useMagic();
	
	public String getMName() {
		return this.MName;
	}
	
	public int getUseMP() {
		return this.useMP;
	}
	
	public double getMDamege() {
		return this.MDamege;
	}
	
}
