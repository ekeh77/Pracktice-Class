package PKG_DB;
import java.sql.*;
import java.sql.DriverManager;
import java.sql.SQLException;

import oracle.jdbc.OracleTypes;

public class DBHandle {

	private String userID;
	private String userPass;
	private String url;
	private String[] dbInfos;
	private Connection con;
	
	
	public void setDBInfo(String[] dbInfos) {
		this.dbInfos = dbInfos;
	}
	
	public void setUserID(String userID) {
		this.userID = userID;
	}

	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	public void getConnection() {
		
		this.con = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//con = DriverManager.getConnection(url, userID, userPass);
			con = DriverManager.getConnection(dbInfos[2], dbInfos[0], dbInfos[1]);
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
	
	//inline query select, delete, update, insert
	
	public Statement getStatement() {
		
		getConnection();
		Statement stmt = null;
		
		try {
			stmt = this.con.createStatement();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return stmt;
	}
	
	//delete, update, insert
	public void executeQuery(String strsql) {
		
		Statement stmt = getStatement();
		
		try {
			
			stmt.execute(strsql);

			this.con.close();
			this.con = null;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	//select
	public ResultSet getResultSet(String strSql) {
		
		Statement stmt = getStatement();
		ResultSet rs = null;
		try {
			rs = stmt.executeQuery(strSql);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return rs;
	}
	
	//1.procedure활용해서 output parameter존재하지 않는경우
	public void executeQuery(String strProcName, String[] strParams) {
		
		getConnection();
		
		try {
			CallableStatement csmt = this.con.prepareCall(strProcName);
			
			for(int i=0; i<strParams.length;i++) {
				csmt.setString(i + 1, strParams[i]);
			}
			
			csmt.execute();
			this.con.close();
			this.con = null;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	//2.output parameter가 존재하는 경우 - ResultSet - output Cursor
	public ResultSet getResultSet(String strProcName, String[] strParams) {
		
		getConnection();
		ResultSet rs = null;
		
		
		try {
			CallableStatement csmt = this.con.prepareCall(strProcName);
			
			int paramsLength = strParams.length;
			
			for(int i=0; i<paramsLength;i++) {
				csmt.setString(i + 1, strParams[i]);
			}
			
			csmt.registerOutParameter(paramsLength + 1, OracleTypes.CURSOR);
			csmt.execute();
			rs = (ResultSet)csmt.getObject(paramsLength + 1);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rs;
		
	}
}
