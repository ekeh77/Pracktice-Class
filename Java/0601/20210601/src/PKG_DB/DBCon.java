package PKG_DB;

import java.sql.*;
import oracle.jdbc.OracleTypes;


public class DBCon {
	
	private String strURL;
	private String userID;
	private String userPass;
	private Connection con;
	private Statement stmt;
	
	public DBCon(String strURL, String userID, String userPass) throws SQLException, ClassNotFoundException {
		
		this.strURL = strURL;
		this.userID = userID;
		this.userPass = userPass;
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		this.con = DriverManager.getConnection(strURL, userID, userPass);
		

	}
	
	public Connection getConnection() {
		
		return this.con;

	}
	
	public Statement getStatment() throws SQLException {
		
		this.stmt = this.con.createStatement();
		
		return stmt;
		
	}
	
	public ResultSet getResult(String strSql) throws SQLException {
		
		ResultSet rs = stmt.executeQuery(strSql);
		
		return rs;
		
	}
	
}
