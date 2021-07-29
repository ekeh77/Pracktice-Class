package PKG_DEL;

public class AUTHDAO implements IDelete{
	
	@Override
	public String getSql() {
		String strSql = "DELETE FROM AUTHES";
		
		return strSql;
	}
	
}
