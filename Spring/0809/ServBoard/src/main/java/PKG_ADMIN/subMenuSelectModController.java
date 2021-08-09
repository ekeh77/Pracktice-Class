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

import oracle.jdbc.OracleTypes;

@WebServlet("/Admin_SubMenuSelectMod")
public class subMenuSelectModController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		String strSubMenuID = request.getParameter("strSubMenuID");
		String strPiD = request.getParameter("strPid");
		
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1525:xe", "C##mngauth", "1");
			
			
			String strProcName = "{call PKG_AD_MENUS.PROC_CHK_MENUS(?,?,?)}"; 
			CallableStatement csmt = con.prepareCall(strProcName);
				
			csmt.setString(1, strSubMenuID);
			csmt.setString(2, strPiD);
			csmt.registerOutParameter(3, OracleTypes.CURSOR);
			csmt.execute();
			
			con.close();
			con = null;
			
			response.sendRedirect("/ServBoard/Admin_MenuList");
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}
}
