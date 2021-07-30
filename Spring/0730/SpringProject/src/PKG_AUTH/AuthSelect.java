package PKG_AUTH;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;

public class AuthSelect implements AuthCRUD{
	
	private ResultSet rs;
	
	@Override
	public void setCRUD() {
		
		//SELECT
	      
	      String strProcName = "SELECT * FROM AUTHES";
	      
	      CallableStatement csmt = con.prepareCall(strProcName);
	      csmt.setString(1, "");
	      csmt.registerOutParameter(2, OracleTypes.CURSOR);
	      
	      csmt.execute();
	      
	      this.rs = (ResultSet)csmt.getObject(2); 
		
		
	}
	
	public ResultSet getResultSet() {
		
		return this.rs;
	}
	
}
