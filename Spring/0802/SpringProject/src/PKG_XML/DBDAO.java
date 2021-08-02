package PKG_XML;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

//@Component("dbDAO")
/*
@Service("dbDAO")
@Repository("dbDAO")
@Controller("dbDAO")
*/
public class DBDAO {
	
	//@Autowired //DI 즉 속성값을 정하는거기 때문에 여기에도 사용가능
	private DBCon dbCon;
	
	/*
	public DBDAO() {
		//System.out.println("DI의 시점이 어디냐: 생성자"  ); 
	}
	
	public DBDAO(DBCon dbCon) {
		this.dbCon = dbCon;
		System.out.println("DI의 시점이 어디냐: 생성자"  );
	}
	*/
	
	@Autowired
	@Qualifier("MySql")
	public void setConnection(DBCon dbCon) {
		this.dbCon = dbCon;
		
		this.dbCon.DBConnection();
		
		//System.out.println("DI의 시점이 어디냐: setConnection"  );
	}
	/*
	@Autowired
	@Qualifier("oracle")
	public void setConnection(DBCon dbCon) {
		this.dbCon = dbCon;
		
		this.dbCon.DBConnection();
	}
	*/
}