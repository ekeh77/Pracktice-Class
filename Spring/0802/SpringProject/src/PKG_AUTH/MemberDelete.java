package PKG_AUTH;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

public class MemberDelete implements IDelete{

	@Override
	public void setDelete() {
		
		//DELETE
         
         String strProcName = "DELETE * FROM MEMBERS";
         
	}
	
}
