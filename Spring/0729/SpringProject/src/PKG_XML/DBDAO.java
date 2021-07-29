package PKG_XML;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component("dbDAO")
public class DBDAO {
	
	private DBCon dbCon;
	
	@Autowired
	@Qualifier("mySql")
	public void setConnection2(DBCon dbCon) {
		this.dbCon = dbCon;
		
		this.dbCon.DBConnection();
	}
	
	@Autowired
	@Qualifier("oracle")
	public void setConnection(DBCon dbCon) {
		this.dbCon = dbCon;
		
		this.dbCon.DBConnection();
	}
	
}