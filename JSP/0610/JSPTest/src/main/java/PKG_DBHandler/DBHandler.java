package PKG_DBHandler;
import java.sql.*;


public class DBHandler {
	private String userId;
	private String userPass;
	private String url;
	private Connection con;
	
	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	public void DBCon(){
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, userId, userPass);
		} 
		catch (ClassNotFoundException e) {
			e.printStackTrace();
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		catch(Exception e) {
			e.printStackTrace();
		}	
	}
	
	public Statement DBSmt() {
		
		Statement stmt = null;
		
		try {
			stmt = this.con.createStatement();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return stmt;
		
	}
	
	public void executeQuery(String strSql) {
		
		Statement stmt = DBSmt();
		
		try {
			stmt.executeQuery(strSql);
			con.close();
			con = null;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public ResultSet getResultSet(String strSql) {
		
		ResultSet rs = null;
		Statement stmt = DBSmt();

		try {
			rs = stmt.executeQuery(strSql);
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rs;
	}
	
}
