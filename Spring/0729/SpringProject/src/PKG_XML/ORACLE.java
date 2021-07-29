package PKG_XML;

import org.springframework.stereotype.Component;

@Component("oracle")
public class ORACLE implements DBCon{
	
	@Override
	public void DBConnection() {
		
		System.out.println("ORACLE 연결");
		
	}
}
