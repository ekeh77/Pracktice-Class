package PKG_AUTH;

public class DeleteDAO {
	
	private IDelete IDel;
	
	public void setDelete(IDelete IDel) {
		this.IDel = IDel;
		
		this.IDel.setDelete();
	}
	
}
