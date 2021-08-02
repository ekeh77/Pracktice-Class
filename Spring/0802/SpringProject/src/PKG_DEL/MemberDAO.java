package PKG_DEL;

public class MemberDAO implements IDelete{
	
	@Override
	public String getSql() {
		String strSql = "DELETE FROM MEMBERS";
		
		return strSql;
	}
	
}
