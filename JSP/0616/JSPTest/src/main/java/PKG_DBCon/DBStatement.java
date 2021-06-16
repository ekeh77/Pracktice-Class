package PKG_DBCon;
import java.sql.*;

public class DBStatement {

	private String strSql;
	private Statement stmt;
	private ResultSet rs;
	
	public void setStrSql(String strSql) {
		this.strSql = strSql;
	}
	
	public ResultSet getStatement(Connection con) { 
		
		try {
			stmt = con.createStatement();
			setSql();
			
			con.close();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return rs;
		
	}
	
	public void setSql() {
		
		try {
			rs = stmt.executeQuery(strSql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
}
