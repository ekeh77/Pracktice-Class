package PKG_DEL;

public class PRODUCTDAO implements IDelete{
	
	@Override
	public String getSql() {
		String strSql = "DELETE FROM PRODUCT";
		
		return strSql;
	}
}
