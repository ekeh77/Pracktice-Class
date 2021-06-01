package PKG_GetDB;
import java.sql.*;

import oracle.jdbc.OracleTypes;

public class getDB {
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String url = "jdbc:oracle:thin:@localhost:1525:xe";
		String userID = "dopractice";
		String userPass = "1";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		con = DriverManager.getConnection(url, userID, userPass);
		String sel = " * ";
		String from = " g_members ";
		String where = " mid like '%%'";
		String strSql = "select" + sel + 
						"from" + from + 
						"where" + where;
		
		stmt = con.createStatement();
		
		rs = stmt.executeQuery(strSql);
		
		while(rs.next()) {
			
			System.out.println(
							   rs.getString("MID") 		+ " " + 
							   rs.getString("MNAME") 	+ " " +
							   rs.getString(3)			+ " " +
							   rs.getInt(4)				+ " " +
							   rs.getString(5)
							  );
		}
		
		
		
		
		
		CallableStatement csmt = null;
		
		String ProcName = "BEGIN PROCEDURE1(?, ?, ?, ?); END;";
		csmt = con.prepareCall(ProcName);
		csmt.setString(1, "M001");
		csmt.setString(2, "ȫ");
		csmt.setString(3, "ȫ�浿");
		csmt.registerOutParameter(4, OracleTypes.CURSOR);
		
		csmt.execute();
		
		rs = (ResultSet)csmt.getObject(4);
		
		while(rs.next()) {
			
			System.out.println(rs.getString("MID"));
			System.out.println(rs.getString("MNAME"));
			
		}
		
		con.close();
		
		String url2 = "jdbc:oracle:thin:@localhost:1525:xe";
		String userID2 = "test";
		String userPass2 = "1";
		
		con = DriverManager.getConnection(url2, userID2, userPass2);
		
		String strSql2 = "select * from reservation_tbl";
		
		stmt = con.createStatement();
		
		rs = stmt.executeQuery(strSql2);
		
		while(rs.next()) {
			
			System.out.println(
							   rs.getString("R_ID") 	+ " " + 
							   rs.getString("R_TEL") 	+ " " +
							   rs.getString("R_STR")	+ " " +
							   rs.getString(4)			+ " " +
							   rs.getInt(5)
							  );
		}
		
	}
	
}
