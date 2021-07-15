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

@WebServlet("/Admin_ModProgramList")
public class programModController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request,response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String[] strChks = request.getParameterValues("chk");
		String[] strPid = request.getParameterValues("pid");
		String[] strPnames = request.getParameterValues("pname");
		String[] strPurls = request.getParameterValues("purl");
		String[] strPmenuids = request.getParameterValues("pmenuid");
		String[] strPfilenames = request.getParameterValues("pfilename");
		
		
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1525:xe", "C##mngauth", "1");
			
			
			String strProcName = "{call PKG_AD_PROGRAM.PROC_PROGRAM_MOD_INS(?,?,?,?,?)}"; 
			CallableStatement csmt = con.prepareCall(strProcName);
			
			for(int i=0; i<strPid.length; i++) {
				
				csmt.setString(1, strPid[i]);
				csmt.setString(2, strPnames[i]);
				csmt.setString(3, strPurls[i]);
				csmt.setString(4, strPmenuids[i]);
				csmt.setString(5, strPfilenames[i]);
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
