package PKG_XML;

import org.springframework.stereotype.Component;

@Component("msSql")
public class MSSQL implements DBCon{
	
	@Override
	public void DBConnection() {
		
		System.out.println("MSSQL 연결");
		
	}
	
}
