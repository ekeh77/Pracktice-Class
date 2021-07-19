package PKG_ADMIN;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Admin_DelProgramList")
public class programDelController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] strCHKs = request.getParameterValues("chk");
		
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1525:xe", "C##mngauth", "1");
			
			
			String strProcName = "{call PKG_AD_PROGRAM.PKG_PROGRAM_DEL(?)}"; 
			CallableStatement csmt = con.prepareCall(strProcName);
						
			for(String strCHK : strCHKs) {
				
				csmt.setString(1, strCHK);
				csmt.execute();
			}
			
			con.close();
			con = null;
			
			response.sendRedirect("/ServBoard/02_admin/program_list.jsp");
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
}
