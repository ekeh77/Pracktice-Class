package PKG_XML;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class DBConConfig {
	
	@Bean
	public DBCon MySql() {
		
		return new MySQL();
		
	}
	
	@Bean
	public DBCon MsSql() {
		
		return new MSSQL();
		
	}
	
	@Bean
	public DBCon Oracle() {
		
		return new ORACLE();
		
	}
	
	@Bean
	public DBDAO dbDAO() {
		return new DBDAO();
	}
	
}
