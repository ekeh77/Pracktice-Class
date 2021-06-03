import java.sql.*;
import PKG_DB.DBCon;
import oracle.jdbc.OracleTypes;
import oracle.jdbc.OracleDriver;

public class DBExample {

		public static void main(String[] args) throws ClassNotFoundException, SQLException {
			//ojdbc8.jar
			//외부 jar, class파일을 가져와서 사용 
			
			Connection con = null;
			//java에서 DB를 연결할 수 있도록 하는 class
			Statement stmt = null;
			//inline 쿼리를 담는 객체
			ResultSet rs = null;
			//결과를 담는 객체
			
			String userID = "C##JavaDB";
			String userPass = "1";
			String url = "jdbc:oracle:thin:@localhost:1525:xe";
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			con = DriverManager.getConnection(url, userID, userPass);
			//1.연결객체를 만들었다
			
			//2.쿼리를 날려서 결과를 가져오면 된다
			//2-1 inline query
			//2-2 oracle package procedure, procedure
			
			//2-1
			
			String inSID = "%%";
			String strSql = "";
			strSql += "Select * from students ";
			strSql += "Where sid Like '" + inSID + "'";
			
			stmt = con.createStatement();
			
			rs = stmt.executeQuery(strSql);
			//
			while(rs.next()) {
				
				System.out.println(rs.getString("SID"));
				System.out.println(rs.getString("SNAME"));
				
			}
			
			//Connection을 사용해서 데이터베이스(oracle)에 procedur를 담는 객체

			//PROCEDURE
			CallableStatement csmt = null;
			//객체는 ORACLE의 PROCEDURE를 호출하도록 하는 객체
			
			String ProcName = "BEGIN PROC_SEL_STUDENTS(?, ?); END;";
			csmt = con.prepareCall(ProcName);
			csmt.setString(1, "S001");
			csmt.registerOutParameter(2, OracleTypes.CURSOR);
			
			csmt.execute();
			
			rs = (ResultSet)csmt.getObject(2);
			
			while(rs.next()) {
				
				System.out.println(rs.getString("SID"));
				System.out.println(rs.getString("SNAME"));
				
			}
			
		
			
			DBCon db = new DBCon("jdbc:oracle:thin:@localhost:1525:xe","C##JavaDB","1");
			
			String stID = "S002";
			String sSql = "select * from students where SID = '" + stID + "'";
			
			db.getStatment();
			
			ResultSet rs2 = db.getResult(sSql);
			
			while(rs2.next()) {
				
				System.out.println(rs2.getString("SID"));
				System.out.println(rs2.getString("SNAME"));
				
			}
			
			
		}
}
		
