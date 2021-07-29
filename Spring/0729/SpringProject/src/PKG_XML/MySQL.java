package PKG_XML;
import org.springframework.stereotype.Component;

@Component("mySql")
public class MySQL implements DBCon{
	
	@Override
	public void DBConnection() {
		
		System.out.println("MySql에 연결");
		
	}
	
}
