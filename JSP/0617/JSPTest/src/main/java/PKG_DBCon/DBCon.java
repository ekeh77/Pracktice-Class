package PKG_DBCon;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBCon {

	private String userId;
	private String userPass;
	private String url;
	
	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	public Connection getConnection() {
		
		Connection con = null;
		
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
		
		return con;
		
		
	}
	
}
