package PKG_DEL;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

public class DeleteAll {
	
	private IDelete IDel;
	
	public void setDelete(IDelete IDel) {
		this.IDel = IDel;
		
		String strSql = IDel.getSql();
		
		 try {
	         
	         Connection con = null;
	         
	         String strProcName = strSql;
	         
	         CallableStatement csmt = con.prepareCall(strProcName);
	         csmt.setString(1, "");
	         
	         csmt.execute();
	         
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	}
	
}
